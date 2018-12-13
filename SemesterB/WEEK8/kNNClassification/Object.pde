class Object extends PVector{
  
   int category;
   float d = 0.0;
   
   Object(float x_, float y_, int category_){
    
       x = x_; y = y_;
       category = category_;
     
   } 
  
   Object(float d_, int category_){
    
       d = d_;
       category = category_;
     
   } 
   
   void draw(){
     
      stroke(0);
      strokeWeight(2.0);
      fill(scheme[category]);
      ellipseMode(CENTER);
      ellipse(x, y, size * 0.75, size * 0.75);
     
   }
  
}

class ObjectList extends ArrayList<Object>{
  
   void draw() { for(Object o : this) { o.draw(); } }

}
