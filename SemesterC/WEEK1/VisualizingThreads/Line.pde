class Line{
  
    PVector start, end, point;
    Line(PVector start_, PVector end_, PVector point_){
     
         start = new PVector(start_.x, start_.y, start_.z);
         end = new PVector(end_.x, end_.y, end_.z);
         point = new PVector(point_.x, point_.y, point_.z);
    } 
    
    void draw(){
      
        stroke(#5E7C88);
        strokeWeight(2.0);
        line(start.x, start.y, start.z, end.x, end.y, end.z);
      
        stroke(#FF0000);
        strokeWeight(3.0);
        point(point.x, point.y, point.z);
        
    }
  
}

class LineList extends ArrayList<Line>{
  
       void draw(){
       
            for(int l = 0; l < this.size(); l++){
              
                  this.get(l).draw();
                  if(l != 0) { stroke(#FF0000); strokeWeight(1.0); line(this.get(l).point.x, this.get(l).point.y, this.get(l).point.z, this.get(l - 1).point.x, this.get(l - 1).point.y, this.get(l - 1).point.z); }
                  
              
            }

       }
  
}
