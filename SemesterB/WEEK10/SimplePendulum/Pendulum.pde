class Pendulum extends PVector{
 
   float theta, mass, len, velocity;
   PVector position;
   
   Pendulum(float theta_, float len_, float mass_){
    
       //pivot point
       x = 0; y = 0;
       
       theta = theta_; len = len_; mass = mass_;
       position = new PVector(x, y + len);
     
   } 
  
   void update(){
     
     float acceleration = -G * mass / len * sin(theta);
     velocity += acceleration;
     
     theta += velocity;
     
     position.x = len * sin(theta);
     position.y = len * cos(theta);
     
     
   }
   
   void draw(){
     
       update();
       stroke(0);
       strokeWeight(2);
       line(x, y, position.x, position.y);
       
       noStroke();
       fill(0);
       
       //pivot
       ellipse(x, y, 8, 8);
       
       ellipse(position.x, position.y, 32.0, 32.0);  
     
   }
   
}
