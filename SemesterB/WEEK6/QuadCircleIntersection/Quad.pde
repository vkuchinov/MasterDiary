class Quad{
  
     float x1,x2, y1, y2;
     
     Quad(float x1_, float y1_, float x2_, float y2_){
      
           x1 = min(x1_, x2_); x2 = max(x1_, x2_); y1 = min(y1_, y2_); y2 = max(y1_, y2_);
     } 
     
     void draw(){
         
           noFill();
           stroke(0);
           strokeWeight(2);
           rect(x1, y1, x2 - x1, y2 - y1);
       
     }
     
     void highlight(){
         
           noFill();
           stroke(0, 255, 255);
           strokeWeight(3);
           rect(x1, y1, x2 - x1, y2 - y1);
       
     }
  
}

class QuadList extends ArrayList<Quad>{
  
    void draw(){
       
         for(int q = 0; q < this.size(); q++){
               this.get(q).draw();
         } 
      
    }
    
    void checkIntersection(Circle c_){
      
        for(int q = 0; q < this.size(); q++){
               if(intersect(this.get(q), c_)) this.get(q).highlight();
         } 
      
    }
    
     boolean intersect(Quad q_, Circle c_){
       
        //horizontal
        double recthalfWidth = (q_.x2 - q_.x1) / 2.0;
        double recthalfHeight= (q_.y2 - q_.y1) / 2.0;
        
        double cx = Math.abs(c_.x - q_.x1 - recthalfWidth);
        double distByX = recthalfWidth + c_.radius;
        
        if (cx > distByX) return false;
        
        //vertical
        double cy = Math.abs(c_.y - q_.y1 - recthalfHeight);
        double distByY = recthalfHeight + c_.radius;
        
        if (cy > distByY)  return false;
        
        //diagonals
        if (cx <= recthalfWidth || cy <= recthalfHeight) return true;
        
        double xCornerDist = cx - recthalfWidth;
        double yCornerDist = cy - recthalfHeight;
        double xCornerDistSq = xCornerDist * xCornerDist;
        double yCornerDistSq = yCornerDist * yCornerDist;
        double maxCornerDistSq = c_.radius * c_.radius;
        return xCornerDistSq + yCornerDistSq <= maxCornerDistSq;

     }
  
  
}

