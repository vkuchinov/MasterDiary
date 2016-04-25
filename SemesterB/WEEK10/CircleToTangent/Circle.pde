class Circle{
  
     String type; //IN, OUT
     PVector center;
     float radius;
     
     Circle(PVector center_, float radius_, String type_){
       
         center = new PVector(center_.x, center_.y, 0.0);
         radius = radius_;
         
         type = type_;
       
     }
  
     void draw(color c_){
      
          noFill();
          stroke(c_);
          ellipseMode(CENTER);
          ellipse(center.x, center.y, radius*2, radius*2);
       
     }
}
