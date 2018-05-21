class Segment{
  
      Point a, b;
      float len, k = 0.9;
      
      Segment(Point a_, Point b_, float length_){
        
            a = a_;
            b = b_;
            len = length_;
        
      }
  
      void applyForces(){
        
            PVector AB = PVector.sub(new PVector(b.x, b.y), new PVector(a.x, a.y));
            float forceMag = k * ( len - AB.mag());

            AB.setMag(forceMag);
            
            PVector forceAB = new PVector(AB.x, AB.y);
            PVector forceBA = new PVector(forceAB.x, forceAB.y);
            forceBA.mult(-1.0);
            
            a.addForce(forceBA);
            b.addForce(forceAB);
        
      }
      
}

class SegmentList extends ArrayList<Segment>{
  
  
  void splice(int index_, int num_, Segment add_){
     
     SegmentList output = new SegmentList();
    
     for(int i = 0; i < this.size(); i++){
     
     if(i == index_) { output.add(add_); }
     else if(i > index_ && i < index_ + num_) {  }
     else { output.add(this.get(i)); }
    
     } 
     
     this.clear();
     this.addAll(output);
    
  }
  
  
}

