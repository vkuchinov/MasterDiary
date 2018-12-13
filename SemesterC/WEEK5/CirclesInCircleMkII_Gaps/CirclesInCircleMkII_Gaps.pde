/*

CIRCLES INSCRIBER Mk II [GAPS]
[calculate parent circle diameter to fit n children circles along its edge, where n always >= 6]

REFERENCES:
http://mathworld.wolfram.com/CirclePacking.html
https://math.stackexchange.com/questions/1407779/arranging-circles-around-a-circle

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Float[] data = new Float[]{ 24.0, 32.0, 64.0, 40.0, 24.0, 16.0, 16.0, 24.0 };
ArrayList<PVector> points = new ArrayList<PVector>();


boolean done = false;
float R = 128.0;
   
void setup(){
 
   size(650, 650);
   translate(width/2, height/2);

   data = addGaps(data, 40.0);
   
   Circle c = new Circle(new PVector(0, 0, 0), R);
   c.draw(64);
   
   while(!done){
     
     background(220);
     
     c.radius = R;
     c.draw(128);
     
     ArrayList<Circle> circles = new ArrayList<Circle>();
     Circle first = new Circle(new PVector(0, -R - data[0], 0), data[0]);
     Circle previous = new Circle(new PVector(0, -R - data[0], 0), data[0]);
     circles.add(first);
     
     first.draw(255);

     for(int i = 1; i < data.length; i++){
       
         Circle next = circlesToTangent(new Circle(new PVector(0, 0, 0), R), previous, data[i], -1.0);
         next.draw(255);
         circles.add(next);
         previous = next;
         
     }

     boolean valid = true;

     
     for(int i = 0; i < circles.size(); i++){
       for(int j = 0; j < circles.size(); j++){
       
         if(i != j) { 
          
          if(checkCollision(circles.get(i), circles.get(j))) { valid = false; }
         
         }
       
       }
     }

     if(valid) { done = true; } else { R += 0.25; }
     
   }

  
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
      
      if (cosv < -1.0 || cosv > 1.0) { return null; }
        
      double angle = Math.acos( cosv ) * side_;
      PVector vnew = rotateVector(v, angle, l2);
      PVector newcenter = PVector.add( c2_.center, vnew);

      return new Circle(newcenter, radius_);
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

boolean checkCollision(Circle a_, Circle b_){

   float dist = PVector.dist(new PVector(a_.center.x, a_.center.y), new PVector(b_.center.x, b_.center.y)); 
   
   if(dist > (a_.radius + b_.radius) - 1) { return false; }
   else if(dist <= abs(a_.radius - b_.radius) + 1) { return true; }
   else { return true; }


}

Float[] addGaps(Float[] data_, float radius_){
 
     Float[] out = new Float[data_.length * 2]; 
     
     for(int i = 0; i < data_.length; i++){
      
        out[i * 2] = data_[i]; 
        out[i * 2 + 1] = radius_; 
        
     }
     
     return out;
  
}

float getAngle(PVector center_, PVector p0_, PVector p1_){
  
      PVector d1 = new PVector(p0_.x, p0_.y, p0_.z);
      d1.sub(center_);
      
      PVector d2 = new PVector(p1_.x, p1_.y, p1_.z);
      d2.sub(center_);
      
      float out = atan2(d2.y, d2.x) - atan2(d1.y, d1.x);
      if(out < 0 ) out = abs(out) + TWO_PI;
      return out;
      
}
