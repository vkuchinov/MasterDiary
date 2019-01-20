/*

CONVEX HULL 

In mathematics, the convex hull or convex envelope of a set X of points in 
the Euclidean plane or Euclidean space is the smallest convex set that contains X. 
For instance, when X is a bounded subset of the plane, the convex hull may be visualized 
as the shape enclosed by a rubber band stretched around X.

ALGORTITHM:

The algorithmic problem of finding the convex hull of a finite set of points in 
the plane or other low-dimensional Euclidean spaces is one of the fundamental 
problems of computational geometry.

Ups, something wrong... Continue researching...

Have to introduce Polygon class for each Voronoi site (element) 
anyway...


REFERENCES:
https://www.topcoder.com/community/data-science/data-science-tutorials/geometry-concepts-line-intersection-and-its-applications/
http://shiffman.net/2011/12/23/night-4-sorting-the-vertices-of-a-polygon/
https://en.wikipedia.org/wiki/Convex_hull
http://rosettacode.org/wiki/Convex_hull

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;
import java.util.Arrays;

Random seed = new Random(234567);

final int NUM_POINTS = 8;

ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Integer> colors = new ArrayList<Integer>();

ArrayList<PVector> centers = new ArrayList<PVector>();
ArrayList<Face> faces = new ArrayList<Face>();

PImage voronoi;

void setup(){
 
  size(600, 600, "processing.core.PGraphicsRetina2D");
  background(64);
  
  voronoi = createImage(600, 600, RGB);

  //for(int p = 0; p < NUM_POINTS; p++){
  //    points.add(new PVector(150 + seed.nextInt(300), 150 + seed.nextInt(300)));   
  //}
  

  points.add(new PVector(105, 150));
  colors.add((int)random(255));
  points.add(new PVector(210, 450));
  colors.add((int)random(255));
  points.add(new PVector(255, 300));
  colors.add((int)random(255));
  points.add(new PVector(315, 150));
  colors.add((int)random(255));
  points.add(new PVector(465, 90));
  colors.add((int)random(255));
  points.add(new PVector(465, 300));
  colors.add((int)random(255));
  points.add(new PVector(465, 510));
  colors.add((int)random(255));
  
  PVector[] pointsArray = points.toArray(new PVector[points.size()]);
  
  for(int pp = 0; pp < points.size(); pp++){
      for(int p = 2; p < points.size(); p++){
          centers.add(getCircumcircleCenter(pointsArray[0], pointsArray[p - 1], pointsArray[p]));
      }
      pointsArray = shiftArray(pointsArray);
  }
  
 
  drawVoronoi();
  image(voronoi, 0, 0);
  
  //draw points
  for(int p = 0; p < points.size(); p++){
      stroke(255, 0, 0);
      strokeWeight(6);
      point(points.get(p).x, points.get(p).y);  
  }
  
  setConvexHull(centers);
  drawConvexHull();  
  
}

PVector getCircumcircleCenter(PVector a_, PVector b_, PVector c_){
  
    final double EPSILON = Math.ulp(1.0);
    PVector center = new PVector(0.0, 0.0);
    
    double xc, yc, m1, m2, mx1, mx2, my1, my2, dx, dy;
    double y1y2 = Math.abs(a_.y - b_.y);
    double y2y3 = Math.abs(b_.y - c_.y);
    
    if(y1y2 < EPSILON && y2y3 < EPSILON) println("coincident points");
    
    if(y1y2 < EPSILON){
        m2  = -((c_.x - b_.x) / (c_.y - b_.y));
        mx2 = (b_.x + c_.x) / 2.0;
        my2 = (b_.y + c_.y) / 2.0;
        xc  = (b_.x + a_.x) / 2.0;
        yc  = m2 * (xc - mx2) + my2;
    }
    else if(y2y3 < EPSILON){
        m1  = -((b_.x - a_.x) / (b_.y - a_.y));
        mx1 = (a_.x + b_.x) / 2.0;
        my1 = (a_.y + b_.y) / 2.0;
        xc  = (c_.x + b_.x) / 2.0;
        yc  = m1 * (xc - mx1) + my1;
    }
    else{
        m1  = -((b_.x - a_.x) / (b_.y - a_.y));
        m2  = -((c_.x - b_.x) / (c_.y - b_.y));
        mx1 = (a_.x + b_.x) / 2.0;
        mx2 = (b_.x + c_.x) / 2.0;
        my1 = (a_.y + b_.y) / 2.0;
        my2 = (b_.y + c_.y) / 2.0;
        xc  = (m1 * mx1 - m2 * mx2 + my2 - my1) / (m1 - m2);
        yc  = (y1y2 > y2y3) ? m1 * (xc - mx1) + my1 : m2 * (xc - mx2) + my2;
    }
    
    dx = b_.x - xc;
    dy = b_.y - yc;
    float radius = sqrt((float)(dx * dx + dy * dy));
    
    center.x = (float)xc;
    center.y = (float)yc;
    
    //radius as Z-axis parameter
    center.z = radius;
    
    return center;  
  
}


void setConvexHull(ArrayList<PVector> points_){
  
  faces.clear();
  if(points_.size() < 6) return;
  
  faces.add(new Face(points_.get(0), points_.get(1), points_.get(2)));
  
  for(int i = 3; i < points_.size(); i++){
    PVector point = points_.get(i);
    Face f = null;

    for(int j = 0; j < faces.size(); ++j){
        f = faces.get(j);
        if(f.inTriangle(point))
        break;
      }
    
    if(true){

      faces.remove(f);
  
      Face f1 = new Face(point, f.edges[0], f.edges[1]);
      Face f2 = new Face(point, f.edges[1], f.edges[2]);
      Face f3 = new Face(point, f.edges[2], f.edges[0]);
      
      faces.add(f1);
      faces.add(f2);
      faces.add(f3);
  
      validEdge(f1, point);
      validEdge(f2, point);
      validEdge(f3, point);
    }
  }
}

void drawConvexHull(){

ArrayList<PVector> l1 = new ArrayList<PVector>(points.subList(0,3));

  stroke(255);
  strokeWeight(1);
  noFill();
  for(int j = 0; j < faces.size(); ++j){
    Face f = faces.get(j);
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.edges));
    l2.retainAll(l1);
    
    if(l2.size() == 0)
    f.draw();
  }

}

void validEdge(Face face_, PVector point_){
  
  Face fadj = face_.getAdjacent(point_);
  
  if(fadj == null) return;
  
  if(fadj.inCircle(point_))
  {
    fadj.flip(face_);
    validEdge(face_, point_);
    validEdge(fadj, point_);
  }
}

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

class SupportingGeometry extends ArrayList{
  
  void render(){
   
     for(int s = 0; s < this.size(); s++){
        SupportingCircle c = (SupportingCircle)this.get(s);
        c.draw();
     } 
  }
  
}

class SupportingCircle{
  
   PVector center;
   float radius;
   color strokeColor = color(255, 0, 255);
   
   SupportingCircle(float x_, float y_, float r_, color sc_){
     center = new PVector(x_, y_);
     radius = r_;
     strokeColor = sc_;
   }
   
   SupportingCircle(PVector center_, float r_, color sc_){
     center = new PVector(center_.x, center_.y);
     radius = r_;
     strokeColor = sc_;
   }
   
   void draw(){
   
     noFill();
     stroke(strokeColor);
     strokeWeight(1);
     
     ellipseMode(CENTER);
     ellipse(center.x, center.y, radius * 2, radius * 2);
     
   }
   
   void dottedDraw(){
    
     for(int n = 0; n < 1440; n += 2){
      
        stroke(strokeColor);
        strokeWeight(1.5);
        point(center.x + sin(radians(360.0/180.0 * n)) * radius, center.y + cos(radians(360.0/180.0 * n)) * radius);
      
     } 
     
   }
   
}

void drawVoronoi() {

  for (int x = 0; x < voronoi.width; x++){
    for (int y = 0; y < voronoi.height; y++){
      
      float minDist = voronoi.width + voronoi.height;
      int closest = 0;

      for (int n = 0; n < points.size(); n++){
        
        PVector defPoint = points.get(n);
        
        //Eucledean distance sqrt((x1 - x2)^2 + (y1 - y2)^2)
        float dist = dist(x, y, defPoint.x, defPoint.y);
        if (dist<minDist)
        {
          closest = n;
          minDist = dist;
        }
      }
      voronoi.pixels[y * voronoi.width + x] = colors.get(closest);
    }
  }
  voronoi.updatePixels();
}



