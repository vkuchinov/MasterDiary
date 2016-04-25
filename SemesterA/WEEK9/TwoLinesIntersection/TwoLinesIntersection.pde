/*

CROSSING DOT 
finding an intersection of two lines*

* or return null if there is no intersection



@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;

Random seed = new Random(9);

PVector a1, a2, b1, b2;

void setup(){
  
 size(600, 600, "processing.core.PGraphicsRetina2D");
 
 a1 = new PVector(seed.nextInt(width), seed.nextInt(height));
 a2 = new PVector(seed.nextInt(width), seed.nextInt(height));
 b1 = new PVector(seed.nextInt(width), seed.nextInt(height));
 b2 = new PVector(seed.nextInt(width), seed.nextInt(height));
 
 //line A
 line(a1.x, a1.y, a2.x, a2.y);
 
 //line B
 line(b1.x, b1.y, b2.x, b2.y);
 
 stroke(255, 0, 0);
 strokeWeight(5);
 
 PVector[] lineA = {a1, a2};
 PVector[] lineB = {b1, b2};

 PVector intersection = findIntersection(lineA, lineB);
 point(intersection.x, intersection.y);
 
}

PVector findIntersection(PVector[] lineA_, PVector[] lineB_){

    final double EPSILON = Math.ulp(1.0);
    
    float x12 = lineA_[0].x - lineA_[1].x;
    float x34 = lineB_[0].x - lineB_[1].x;
    float y12 = lineA_[0].y - lineA_[1].y;
    float y34 = lineB_[0].y - lineB_[1].y;
    
    float c = x12 * y34 - y12 * x34;
    
    if (abs(c) < EPSILON)
    {
      //lines are parallel
      return null;
    }
    else
    {
      float a = lineA_[0].x * lineA_[1].y - lineA_[0].y * lineA_[1].x;
      float b = lineB_[0].x * lineB_[1].y - lineB_[0].y * lineB_[1].x;
    
      float x = (a * x34 - b * x12) / c;
      float y = (a * y34 - b * y12) / c;
    
      return new PVector(x , y);
    } 
}


