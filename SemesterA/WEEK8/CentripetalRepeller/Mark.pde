class Mark extends PVector{
 
    float radius;
    
    Mark(float x_, float y_, float radius_){
     
        x = x_; y = y_;
        radius = radius_;
      
    }
   
    void update(float mx_, float my_){
      
      x = mx_ - width / 2;
      y = my_ - height / 2;
      
    }
    
    void draw(){
      
        noStroke();
        fill(255, 0, 255);
        ellipse(x, y, radius * 2, radius * 2);
     
    } 
  
}
