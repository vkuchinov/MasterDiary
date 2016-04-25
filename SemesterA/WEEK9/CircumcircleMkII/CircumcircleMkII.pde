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
Random seed = new Random(234567);

final int NUM_POINTS = 8;

ArrayList<PVector> points = new ArrayList();
ArrayList<PVector> centers = new ArrayList();

void setup(){
 
  size(600, 600, "processing.core.PGraphicsRetina2D");
  background(64);
  
  for(int p = 0; p < NUM_POINTS; p++){
      points.add(new PVector(150 + seed.nextInt(300), 150 + seed.nextInt(300)));   
  }
  
  for(int p = 2; p < NUM_POINTS; p++){
      centers.add(getCircumcircleCenter(points.get(p - 2), points.get(p - 1), points.get(p)));
  }
  
  //bad route
  connectAllPoints(centers, color(0, 255, 255), 0.75);
  
  for(int c = 0; c < centers.size(); c++){
      //circumcenter
      stroke(0, 255, 255);
      strokeWeight(6);
      point(centers.get(c).x, centers.get(c).y);
                  
      //circumcircle
      noFill();
      stroke(255);
      strokeWeight(0.5);
      ellipseMode(CENTER);
      //center.z as radius
      ellipse(centers.get(c).x, centers.get(c).y, centers.get(c).z * 2, centers.get(c).z * 2);
  }
  
  //draw points
  for(int p = 0; p < points.size(); p++){
      stroke(255, 0, 0);
      strokeWeight(6);
      point(points.get(p).x, points.get(p).y);  
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

void connectAllPoints(ArrayList<PVector> points_, color stroke_, float weight_){
  
    PVector[] pointsArray = points_.toArray(new PVector[points_.size()]);
    
    stroke(stroke_);
    strokeWeight(weight_);
    
    for(int pp = 0; pp < pointsArray.length; pp++){
        for(int p = 1; p < pointsArray.length; p++){
          line(pointsArray[0].x, pointsArray[0].y, pointsArray[p].x, pointsArray[p].y);
        }
        //shifting array 
        System.arraycopy(pointsArray, 1, pointsArray, 0, pointsArray.length - 1);
        println(pointsArray);
    }
}
