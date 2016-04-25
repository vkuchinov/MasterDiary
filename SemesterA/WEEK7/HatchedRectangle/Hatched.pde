class Hatched{
  
     PVector point;
     float w, h;
     
     int density, mode;
     
     float contour, contourWeight, hatching, hatchingWeight;
     
     Hatched(float x_, float y_, float w_, float h_, int density_){
       
         point = new PVector(x_, y_);
         w = w_; h = h_;
         
         density = density_ / 2;
         
         contour = 0;
         contourWeight = 2.0;
         hatching = 0;
         hatchingWeight = 1.0;
         
         mode = 0;
      
     }
    
     void setMode(int mode_){
      
          //CORNER: 0, CENTER: 3 
          mode = mode_;
       
     } 
     
     void setStyle(){
       
       
     }
     
     void draw(){
       
         if(mode == 3) { pushMatrix(); translate(-w/2, -h/2); }
         //contours
         stroke(contour);
         strokeWeight(contourWeight);
         line(point.x, point.y, point.x + w, point.y);
         line(point.x + w, point.y, point.x + w, point.y + h); 
         line(point.x + w, point.y + h, point.x, point.y + h);
         line(point.x, point.y + h, point.x, point.y );
   
         PVector p0 = new PVector(point.x, point.y);
         PVector p1 = new PVector(point.x + w, point.y);
         PVector p2 = new PVector(point.x, point.y + h); 
         PVector p3 = new PVector(point.x + w, point.y + h);
         
         stroke(hatching);
         strokeWeight(hatchingWeight);
         
         for(int d = 0; d < density ; d++){
         
                 PVector l1 = PVector.lerp(p0, p1, 1.0 / density * d);  
                 PVector l2 = PVector.lerp(p0, p2, 1.0 / density * d); 
                 PVector l3 = PVector.lerp(p3, p1, 1.0 / density * d);  
                 PVector l4 = PVector.lerp(p3, p2, 1.0 / density * d); 
                 line(l1.x, l1.y, l2.x, l2.y);   
                 line(l3.x, l3.y, l4.x, l4.y);    
     
         } 
    
                 line(point.x, point.y + h, point.x + w, point.y);   
  
         if(mode == 3) popMatrix();               

     }
  
}
