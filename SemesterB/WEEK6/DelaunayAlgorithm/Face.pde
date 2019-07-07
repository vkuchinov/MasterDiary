class Face
{
  
  PVector[] edges;
    
  // Constructor
  Face(PVector a, PVector b, PVector c)
  {
    edges = new PVector[] {a, b, c};    
    this.CC(); //counter-clockwise rotation
  }
  
  void CC()
  {
    if(edges[0].dist(edges[1]) - edges[0].dist(edges[2]) > 0) {
        PVector tmp = edges[1]; edges[1] = edges[2]; edges[2] = tmp; //shifting 
    }
  }
  
  void draw()
  {
    
    beginShape();
    for(int v = 0; v < 3; v++){
    vertex(edges[v].x, edges[v].y);
    }
    endShape(CLOSE);
    
  }

  boolean inTriangle(PVector point_)
  {
    PVector v0 = PVector.sub(edges[2], edges[0]);
    PVector v1 = PVector.sub(edges[1], edges[0]);
    PVector v2 = PVector.sub(point_, edges[0]);
    
    float dot00 = PVector.dot(v0, v0);
    float dot01 = PVector.dot(v0, v1);
    float dot02 = PVector.dot(v0, v2);
    float dot11 = PVector.dot(v1, v1);
    float dot12 = PVector.dot(v1, v2);
    
    float inv = 1.0 / (dot00 * dot11 - dot01 * dot01);
    float u = (dot11 * dot02 - dot01 * dot12) * inv;
    float v = (dot00 * dot12 - dot01 * dot02) * inv;
    
    return (u >= 0) && (v >= 0) && (u + v < 1);
  }
  
  boolean inCircle(PVector point_)
  {
    float [] cir = calculateCircle(edges[0], edges[1], edges[2]);
    if(dist(cir[0], cir[1], point_.x, point_.y) < cir[2]) return true;
    else return false;
  }

  float[] calculateCircle(PVector point1_, PVector point2_, PVector point3_)
  {

  float slope1 = (point1_.y - point2_.y)/(point1_.x - point2_.x);
  float slope2 = (point2_.y - point3_.y)/(point2_.x - point3_.x);
  float ret[] = new float[3];

  if(slope1 != slope2)
  {
  ret[0] = (slope1 * slope2 * (point3_.y - point1_.y) + slope1 * (point2_.x + point3_.x) - slope2 * (point1_.x + point2_.x)) / ( 2 *(slope1 - slope2));  //X
  ret[1] = -1 / slope1*(ret[0] - (point1_.x + point2_.x) / 2) + (point1_.y + point2_.y) / 2; //Y
  ret[2] = dist(ret[0], ret[1], point2_.x, point2_.y); //radius
  
  supports.add(new SupportingCircle(ret[0], ret[1], ret[2], color(255, 255, 255, 32)));
  
  }
    return ret;
  }
  
  void flip(Face f)
  {

    ArrayList<PVector> l1 = new ArrayList<PVector>(Arrays.asList(edges));
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.edges));
    
    l2.retainAll(l1);
    
    if(l2.size() != 2) return;
    
    PVector p1 = null;
    PVector p2 = null;
    
    for(int i = 0; i < 3; ++i)
    {
      p1 = edges[i];
      if(!l2.contains(p1))
        break;
    }
    for(int i = 0; i < 3; ++i)
    {
      p2 = f.edges[i];
      if(!l2.contains(p2))
        break;
    }
    
    edges = new PVector[] {p1, p2, l2.get(0)};
    f.edges = new PVector[] {p1, p2, l2.get(1)};
    this.CC();
    f.CC();
    
  }
  
  Face getAdjacent(PVector point_)
  { 
    ArrayList<PVector> l1 = new ArrayList<PVector>(Arrays.asList(edges));
    
    for(int i = 0; i < faces.size(); ++i)
    {
      Face f = faces.get(i);
      if(f == this) continue;
      
      ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.edges));
      
      l2.retainAll(l1);

      if(l2.size() == 2 && !l2.contains(point_))
        return f;
    }
    return null;
  }
}
