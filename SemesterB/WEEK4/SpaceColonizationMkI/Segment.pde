class Segment {

  PVector position;
  PVector growDir = new PVector();
  int grow_count = 0;
  float area = 0;
  Segment parent;
  
  int lifetime;

  public Segment(PVector p, Segment parent) {
    this.parent = parent;
    this.position = p;
    lifetime = 0;
  }

  public void draw() {

    lifetime++;
    
    stroke(0);
    strokeWeight(1);
    if (parent != null) {//null signals root
      PVector ploc = parent.position;
    }

    //trunk
     stroke(0);
    strokeWeight(1);
    parent.area += area;

    //pushMatrix();
    //translate(-width/2, -height/2);
    //PVector diff = PVector.sub(position, parent.position);
    //rotate(diff.heading2D());
    //box(sqrt(area),sqrt(area),sqrt(area));
    //line(loc.x,loc.y,loc.z,parent.loc.x,parent.loc.y,parent.loc.z);
    line(position.x, position.y, parent.position.x, parent.position.y);
    //popMatrix();

    stroke(142, 72, 19);
    //line(loc.x, loc.y, ploc.x, ploc.y);

    stroke(255, 255, 255);
    //if(loc.y < 500 && noise(loc.x*1000,loc.y*1000) < winter)
    //line(loc.x+2, loc.y-3, ploc.x+2, ploc.y-3);
  }

  public void drawLine(float x1, float y1, float z1, float x2, float y2, float z2, float weight, color strokeColour)
  {
    PVector p1 = new PVector(x1, y1, z1);
    PVector p2 = new PVector(x2, y2, z2);
    PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
    float rho = sqrt(pow(v1.x, 2)+pow(v1.y, 2)+pow(v1.z, 2));
    float phi = acos(v1.z/rho);
    float the = atan2(v1.y, v1.x);
    v1.mult(0.5);

    pushMatrix();
    translate(x1, y1);
    translate(v1.x, v1.y);
    rotate(the);
    //rotateY(phi);
    noStroke();
    fill(strokeColour);
    //box(weight, weight, p1.dist(p2)*1.2);
    popMatrix();
  }
}

