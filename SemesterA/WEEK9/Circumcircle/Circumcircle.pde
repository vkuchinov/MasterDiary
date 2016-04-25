/*

CIRCUMCIRCLE [CIRCUMSCRIBED CIRCLE]

The circumcircle is a triangle's circumscribed circle, 
i.e., the unique circle that passes through each of 
the triangle's three vertices. 

The center of the circumcircle is called the circumcenter, 
and the circle's radius is called the circumradius.

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;
Random seed = new Random(1234);

PVector[] points = new PVector[3];

void setup(){
 
  size(600, 600);
  background(64);
  
  for(int p = 0; p < points.length; p++){
      points[p] = new PVector(150 + seed.nextInt(300), 150 + seed.nextInt(300));   
  }
  
  PVector center = getCircumcircleCenter(points[0], points[1], points[2]);
  
  //circumcenter
  stroke(0, 255, 255);
  strokeWeight(6);
  point(center.x, center.y);
  
  //circumcircle
  noFill();
  stroke(255);
  strokeWeight(1);
  ellipseMode(CENTER);
  //center.z as radius
  ellipse(center.x, center.y, center.z * 2, center.z * 2);
  println(center.z);
  
  //draw points
  for(int p = 0; p < points.length; p++){
      stroke(255, 0, 0);
      strokeWeight(6);
      point(points[p].x, points[p].y);  
  }
  
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
