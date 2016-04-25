class Circle{
  
     PVector location;
     float radius;
    
     Circle(float radius_, PVector location_){
      
           location = new PVector(location_.x, location_.y);
           radius = radius_;
       
     } 
     
     void draw(color c_){
       
          stroke(c_);
          strokeWeight(1.0);
          noFill();
          
          ellipseMode(CENTER);
          ellipse(location.x, location.y, radius * 2, radius * 2);
       
     }
     
     float curvature(){
          
         return 1.0 / radius;  //curvature is 1.0 / radius
          
     }
  
}
