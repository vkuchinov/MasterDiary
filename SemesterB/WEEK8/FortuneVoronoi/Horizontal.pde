class Horizontal{
  
       float y;
       
       Horizontal(){
        
       }
      
       void draw(){
         
            stroke(255, 0, 255);
            strokeWeight(1.0);
        
            line(0, mouseY*2, width, mouseY*2);
            
            drawParabolae(mouseY*2);
            
         
       } 
       
       void drawParabolae(float dy_) {
         
               //sort points by y value
               Collections.sort(points, new sortByY());
               for(PVector p: points) { if (dy_ > p.y) { drawParabola(p.x, p.y, dy_); } }
          
       }
        
}

class sortByY implements Comparator<PVector>
{
  //@Override
  int compare(PVector v1, PVector v2) { return Float.compare(v1.y, v2.y); }
}
