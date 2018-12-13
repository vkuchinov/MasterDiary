/*

CIRCLES INSCRIBER Mk II
[calculate parent circle diameter to fit n children circles along its edge, where n always >= 6]

Children circles could have different radiuses

1, 2, 3 from 6
4, 5 from itself


REFERENCES:
http://mathworld.wolfram.com/CirclePacking.html
https://math.stackexchange.com/questions/1407779/arranging-circles-around-a-circle

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float[] data = new float[]{ 24.0, 32.0, 64.0, 40.0, 24.0, 20.0, 16.0, 16.0, 60.0, 92.0, 10.0, 12.0 };
ArrayList<PVector> points = new ArrayList<PVector>();

boolean done = false;
float R = 20.0;
   
void setup(){
 
   size(650, 650);
   translate(width/2, height/2);

   Circle c = new Circle(new PVector(0, 0, 0), R);
   c.draw(128);
   
   while(!done){
        
     background(220);
    
     c.radius = R;
     c.draw(128);
     
     boolean check = true;

     ArrayList<Circle> circles = new ArrayList<Circle>();
     Circle first = new Circle(new PVector(0, -R - data[0], 0), data[0]);
     float limit = TWO_PI - getAngle(new PVector(0.0, 0.0, 0.0), first.center, first.edge);
     float sum = getAngle(new PVector(0.0, 0.0, 0.0), first.center, first.edge);
     
     first.draw(255);
     circles.add(first);
     
     Circle previous = new Circle(new PVector(0, -R - data[0], 0), data[0]);

     
     for(int i = 1; i < data.length; i++){
       
         Circle next = circlesToTangent(new Circle(new PVector(0, 0, 0), R), previous, data[i], -1.0);
         sum += getAngle(new PVector(0.0, 0.0, 0.0), previous.edge, next.edge);
         next.draw(255);
         if( i <= data.length - 1 && sum >= limit){ R += 0.25 ; break; }
         else if(i == data.length - 1 && sum < limit ) { done = true; }
         circles.add(next);
         previous = next;
 
     }
     
     println(R, sum);
     //done = true;
     
   }

  
}

PVector getTangents(Circle c_, PVector p_, int index_){
 
   PVector[] out = new PVector[]{new PVector(0, 0), new PVector(0, 0)};
 
   PVector median = PVector.lerp(new PVector(c_.center.x, c_.center.y), p_, 0.5);
   float dist = median.dist(p_);

        float dx = p_.x - median.x;
        float dy = p_.y - median.y;

        float d = sqrt((dy*dy) + (dx*dx));

        if (d > (c_.radius + dist)) { return new PVector(0, 0); }
        if (d < abs(c_.radius - dist)) { return new PVector(0, 0); }

        float a = (pow(c_.radius, 2) - pow(dist, 2) + pow(d, 2)) / (2.0 * d) ;

        float x2 = c_.center.x + (dx * a/d);
        float y2 = c_.center.y + (dy * a/d);

        float h = sqrt(pow(c_.radius, 2) - pow(a, 2));

        float rx = -dy * (h/d);
        float ry = dx * (h/d);

        out[0] = new PVector(x2 + rx, y2 + ry);
        out[1] = new PVector(x2 - rx, y2 - ry);

   return out[index_];
   
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

float getAngle(PVector center_, PVector p0_, PVector p1_){
  
      float phi = atan2(p1_.y, p1_.x) - atan2(p0_.y, p0_.x);
      phi *= 360.0 / (2.0 * PI);
      if (phi < 0){ phi = phi + 360;}

      return radians(phi);

}
