class Circle{
  
     float x, y, radius;
     
     Circle(float x_, float y_, float radius_){
      
         x = x_; y = y_;
         radius = radius_;
      
     } 
  
     void draw(){
       
         x = mouseX;
         y = mouseY;
         
         noFill();
         stroke(255, 0, 255);
         strokeWeight(2);
         
         ellipseMode(CENTER);
         ellipse(x, y, radius * 2, radius * 2);
         
     }
     
}
