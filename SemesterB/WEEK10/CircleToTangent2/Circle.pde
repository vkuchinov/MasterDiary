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
      
          noStroke();
          fill(c_);
          ellipseMode(CENTER);
          ellipse(center.x, center.y, radius*2, radius*2);
       
     }
}

class CircleList extends ArrayList<Circle>{
  
     void draw(){
      
           for(int c = 0; c < this.size(); c++){
             
                //retro air color scheme from kuler.adobe.com
                if(c < 2) this.get(c).draw(color(#F24C27)); else this.get(c).draw(#F2EFDC);
             
           }
       
     } 
  
}
