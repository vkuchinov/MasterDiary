/*

CIRCLE TO TANGENTS
draws third circle with given radius for two neighboured
circles. 

REFERENCES:
http://shiffman.net/2011/02/03/rotate-a-vector-processing-js/

@author     Vladimir V. KUCHINOV
@email      helloworld@vkuchinov.co.uk

*/

import java.util.Random;
Random seed = new Random(123467);

CircleList circles = new CircleList();
float inc = 1.0;

void setup(){
  
    size(600, 600, "processing.core.PGraphicsRetina2D");
    background(#404040);
    
    Circle c1 = new Circle(new PVector(width/2 - 8, height/2), 8, "OUT");
    circles.add(c1);
    Circle c2 = new Circle(new PVector(width/2 + 8, height/2), 8, "OUT");
    circles.add(c2);

    for(int c = 0; c < 32; c++){
          
          int ccc = circles.size();
          float nextRadius = -3.0 + seed.nextInt(6000)/1000.0;

          Circle c3a = circlesToTangent(circles.get(circles.size() - 2), circles.get(circles.size() - 1), 8.0 + nextRadius, inc);
          if(!circleIntersection(c3a, ccc, circles)) { circles.add(c3a);}
          inc *= -1.0; 
              
    } 
    
    //symmetry
    int listSize = circles.size();
    for(int c = 2; c < listSize; c++){
      
          Circle c3b = new Circle(new PVector(width/2 - abs(width/2 - circles.get(c).center.x), height/2 + abs(height/2 - circles.get(c).center.y)), circles.get(c).radius, "OUT");
          circles.add(c3b);
       
    }
    
    circles.draw();
    
}

void draw(){
    
      background(#404040);
      circles.draw(mouseX, mouseY);
  
}

void mousePressed() {
  
       circles.mousePressed();

}

void keyPressed() {
 
      circles.keyPressed();
      
}


Circle circlesToTangent(Circle c1_, Circle c2_, float radius_, float side_) {
    
      float x1 = c1_.center.x, y1 = c1_.center.y, r1 = c1_.radius;
      float x2 = c2_.center.x, y2 = c2_.center.y, r2 = c2_.radius;

      PVector v = new PVector(x1 - x2, y1 - y2);
      
      double  l3 = modulus(v);
      
      float isens = 1.0;
      
      if (c1_.type == "IN" || c2_.type == "IN") {
        isens *= -1.0;
      }
      
      double l1 = r1 + isens*radius_;
      double l2 = r2 + radius_;
      
      double cosv = (l3 * l3 - l1 * l1 + l2 * l2)/(2.0 * l2 * l3);
      
        if (cosv < -1.0 || cosv > 1.0) {
          
              //println("cosv ", cosv);
              return null;
        }
        
      double angle = Math.acos( cosv ) * side_;
      PVector vnew = rotateVector(v, angle, l2);
      PVector newcenter = PVector.add( c2_.center, vnew);

      return new Circle(newcenter, radius_, "OUT");
}

double modulus(PVector v_){
  
  return Math.sqrt(v_.dot(v_));
  
}

PVector rotateVector(PVector v_, double angle_, double l_){
  
   double xTmp = v_.x;
   double x = v_.x*Math.cos(angle_) - v_.y*Math.sin(angle_);
   double y = xTmp * Math.sin(angle_) + v_.y*Math.cos(angle_);
   
   PVector output = new PVector((float)x, (float)y);
   output.normalize();
   output.mult((float)l_);
   return output;
  
}

boolean circleIntersection(Circle c_, int size_, CircleList circles_){
  
     for(int c = 0; c < size_; c++){
       float dist = PVector.dist(circles_.get(c).center, c_.center);
       if(Math.abs(c_.radius - circles_.get(c).radius) > dist - 0.01) { return true; }
     }
     
     return false;
}

boolean circleTangency(Circle c1_, Circle c2_){
  
     //simple tangency
     double dist = PVector.dist(c1_.center, c2_.center);
     double difference = Math.abs(c1_.radius + c2_.radius - dist);
     if(difference < 0.01) { return true; }
       
     return false;
     
}

boolean circleTangency(Circle c1_, Circle c2_, Circle c3_){
  
     //simple tangency
     double distA = PVector.dist(c1_.center, c2_.center);
     double distB = PVector.dist(c1_.center, c3_.center);
     double differenceA = Math.abs(c1_.radius + c2_.radius - distA);
     double differenceB = Math.abs(c1_.radius + c3_.radius - distB);
     if(differenceA < 0.01 && differenceB < 0.01) { return true; }
       
     return false;
     
}

boolean circleTangency(Circle c1_, CircleList circles_){
  
     boolean out = true;
     
     for(int c = 0; c < circles_.size(); c++){
     //simple tangency
     double dist = PVector.dist(c1_.center, circles_.get(c).center);
     double difference = Math.abs(c1_.radius + circles_.get(c).radius - dist);
     if(difference > 0.01) { out = false; }
     }
     
     return out;
     
}
