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
          strokeWeight(1.0);
          ellipseMode(CENTER);
          ellipse(center.x, center.y, radius*2, radius*2);
          
          strokeWeight(1);
          stroke(0, 255, 255);
          line(0, 0, center.x, center.y);
                   
          strokeWeight(6);
          stroke(c_);
          //point(edge.x, edge.y);
          point(center.x, center.y);

     }
     
      void draw(color c_, Circle l_){
      
          noFill();
          stroke(c_);
          strokeWeight(1);
          ellipseMode(CENTER);
          ellipse(center.x, center.y, radius*2, radius*2);
          
          strokeWeight(1);
          stroke(0, 255, 255);
          line(0, 0, center.x, center.y);
          
          line(l_.center.x, l_.center.y, center.x, center.y);
          
          strokeWeight(6);
          stroke(c_);
          //point(edge.x, edge.y);
          point(center.x, center.y);

     }
     
}
