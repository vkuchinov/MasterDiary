class Point extends PVector{
  
     PVector origin;
     float radius;
     float angle;
     float dx, dy;
     
     Point(float x_, float y_, float dx_, float dy_, float radius_){
       
         radius = radius_;
         origin = new PVector(x_, y_);
         
         x = -40;
         y = 32;
         
         dx = dx_; dy = dy_;

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

         noStroke();
         ellipse(origin.x, origin.y, radius * 2.0, radius * 2.0);
         
         stroke(0);
         strokeWeight(4);
         point(origin.x + x, origin.y + y);
      
     } 
 
}
