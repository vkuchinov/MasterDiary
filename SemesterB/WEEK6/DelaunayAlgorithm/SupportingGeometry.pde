class SupportingGeometry extends ArrayList{
  
  void render(){
   
     for(int s = 0; s < this.size(); s++){
        SupportingCircle c = (SupportingCircle)this.get(s);
        c.draw();
     } 
  }
  
}

class SupportingCircle{
  
   PVector center;
   float radius;
   color strokeColor = color(255, 0, 255);
   
   SupportingCircle(float x_, float y_, float r_, color sc_){
     center = new PVector(x_, y_);
     radius = r_;
     strokeColor = sc_;
   }
   
   SupportingCircle(PVector center_, float r_, color sc_){
     center = new PVector(center_.x, center_.y);
     radius = r_;
     strokeColor = sc_;
   }
   
   void draw(){
   
     noFill();
     stroke(strokeColor);
     strokeWeight(1);
     
     ellipseMode(CENTER);
     ellipse(center.x, center.y, radius * 2, radius * 2);
     
   }
   
   void dottedDraw(){
    
     for(int n = 0; n < 1440; n += 2){
      
        stroke(strokeColor);
        strokeWeight(1.5);
        point(center.x + sin(radians(360.0/180.0 * n)) * radius, center.y + cos(radians(360.0/180.0 * n)) * radius);
      
     } 
     
   }
   
}
