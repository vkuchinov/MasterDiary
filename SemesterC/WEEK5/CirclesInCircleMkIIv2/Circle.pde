class Circle{
  
     String type; //IN, OUT
     PVector center;
     PVector edge;
     float radius;
     
     Circle(PVector center_, float radius_){
       
         center = new PVector(center_.x, center_.y, radius);
         radius = radius_;
    
         edge = getTangents(this, new PVector(0, 0), 1);
         type = "";
       
     }
     
     Circle(PVector center_, float radius_, float angle_){
       
         center = new PVector(center_.x, center_.y, radius);
         radius = radius_;
         
         edge = getTangents(this, new PVector(0, 0), 1);
       
         type = "";
       
     }

     void draw(color c_){
      
          noFill();
          stroke(c_);
          strokeWeight(1);
          ellipseMode(CENTER);
          ellipse(center.x, center.y, radius*2, radius*2);
          
          strokeWeight(6);
          point(edge.x, edge.y);
       
     }
}
