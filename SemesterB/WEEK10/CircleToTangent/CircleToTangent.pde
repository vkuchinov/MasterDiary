/*

CIRCLE TO TANGENTS
draws third circle with given radius for two neighboured
circles. 

REFERENCES:
http://shiffman.net/2011/02/03/rotate-a-vector-processing-js/

@author     Vladimir V. KUCHINOV
@email      helloworld@vkuchinov.co.uk

*/

void setup(){
  
    size(600, 600, "processing.core.PGraphicsRetina2D");
    background(240);
    
    Circle c1 = new Circle(new PVector(width/2 - 60, height/2), 60, "OUT");
    Circle c2 = new Circle(new PVector(width/2 + 90, height/2), 90, "OUT");
    
    c1.draw(0); c2.draw(0);
   
    Circle c3 = circlesToTangent(c1, c2, 50.0, -1.0);
    c3.draw(color(255, 0, 0));
    
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
          
              println("cosv ", cosv);
              return null;
        }
        
      double angle = Math.acos( cosv ) * side_;
      PVector vnew = rotateVector(v, angle, l2);
      println(vnew);
      PVector newcenter = PVector.add( c2_.center, vnew);

      return new Circle(newcenter, radius_, null);
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
