class Rectangle{

   PVector position, dimensions;
   Rectangle(PVector position_, float width_, float height_){
    
        dimensions = new PVector(width_, height_);
        position = new PVector(position_.x, position_.y);
     
   } 
  
   void draw(){

     fill(255);
     rect(position.x, position.y, dimensions.x, dimensions.y);
     
   }
   
   void draw(float x_, float y_){

       fill(255);
       
       position.x = -width/2 - dimensions.x/2 + x_;
       position.y = -height/2 - dimensions.y/2 + y_;
       
       rect(position.x, position.y, dimensions.x, dimensions.y);
     
   }
  
}
