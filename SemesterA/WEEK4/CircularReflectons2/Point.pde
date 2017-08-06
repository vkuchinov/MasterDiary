class Point extends PVector{
  
     float radius;
     float angle;
     float dx, dy;
     
     Point(float x_, float y_, float dx_, float dy_, float radius_){
       
         x = x_; y = y_;
         dx = dx_; dy = dy_;
         angle = random(-PI, PI);
         radius = radius_;
      
     }
     
     void update(){

         x += dx;
         y += dy;
         
         if (sqrt(x * x + y * y) >= radius - 4) {
           
             float v = sqrt(dx * dx + dy * dy);
             float collisionPointAngle = atan2(-y, x);
             float a0 = atan2(-dy, dx);
             float a1 = 2.0 * collisionPointAngle - a0;
             
             dx = -v * cos(a1);
             dy = v * sin(a1);
           
         }
       
     }
    
     void draw(){
      
         update();
         
         stroke(0);
         strokeWeight(4);
         point(x, y);
      
     } 
 
}
