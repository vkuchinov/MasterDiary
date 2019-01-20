class Point extends PVector{
  
     float radius, angle, velocity;
  
     Point(float radius_, float angle_, float velocity_){
       
         radius = radius_;
         angle = angle_;
         velocity = velocity_;
         
         x = radius * (float)Math.cos(angle);
         y = radius * (float)Math.sin(angle);
       
     }
     
     void draw(){
       
         noStroke();
         fill(255);
         ellipse(x, y, 8, 8);
                  
         noFill();
         
         //velocity vector
         PVector v = PVector.fromAngle((float)Math.atan2(-y, -x) - HALF_PI);
         v.normalize();
         v.mult(velocity);
         stroke(0, 255, 255);
         line(x, y, x + v.x * 9.0, y + v.y * 9.0);
         
         //centripetal
         double ca = Math.pow(velocity, 2) / radius / 2;
         float theta = (float)Math.atan2(-y, -x);
         PVector c = PVector.fromAngle(theta);
         c.normalize();
         c.mult((float)ca);
         
         v.add(c);
         
         stroke(255, 0, 255);
         line(x, y, x + c.x * 499.0, y + c.y * 499.0);
         
         x += v.x;
         y += v.y;

     } 
  
}
