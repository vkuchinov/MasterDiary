class Circle{
 
   PVector origin;
   
   Circle(PVector center_, float radius_){
    
        origin = new PVector(center_.x, center_.y, radius_);
     
   } 
  
   void draw(){
    
        fill(255);
        ellipse(origin.x, origin.y, origin.z * 2, origin.z * 2); 
     
   }
   
   void draw(float x_, float y_){
    
        fill(255);
        origin.x = -width/2 + x_; origin.y = -height/2 + y_;
        ellipse(origin.x, origin.y, origin.z * 2, origin.z * 2); 
     
   }
  
}
