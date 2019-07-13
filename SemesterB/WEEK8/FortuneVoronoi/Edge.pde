class Edge{
  
      float x0, y0, x1, y1;
      PVector xy0, xy1;
      
      int valid = 1; //-1: invalid, 1: valid
  
      Edge(float x0_, float y0_, float x1_, float y1_){
       
           x0 = x0_; x1 = x1_; 
           y0 = y0_; y1 = y1_;
           
           xy0 = new PVector(x0, y0);
           xy1 = new PVector(x1, y1);
        
      }
     
      Edge(PVector xy0_, PVector xy1_){
       
           x0 = xy0_.x; x1 = xy1_.x; 
           y0 = xy0_.y; y1 = xy1_.y;
           
           xy0 = new PVector(x0, y0);
           xy1 = new PVector(x1, y1);
        
      }  
  
     //ab_: 0: a (start), 1: b (end)
     void updateXY(int ab_, float x_, float y){
       
       
     }
     
     void draw(){
      
          stroke(0);
          strokeWeight(1);
          line(x0, y0, x1, y1);
          
     }
}

class EdgeList extends ArrayList<Edge>{
  
      void draw(){ for(Edge e: this) e.draw(); } 
  
}
