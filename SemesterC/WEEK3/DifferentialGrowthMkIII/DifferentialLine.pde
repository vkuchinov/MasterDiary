class DifferentialLine{
 
     int count = 0;
     
     Boundaries bounds = new Boundaries();
     
     boolean closed = false;
     PointList points = new PointList();
     SegmentList segments = new SegmentList();
     
     DifferentialLine(boolean closed_){ closed = closed_; } 
     
     void addPoint(float x_, float y_, boolean fixed_ , float length_){
       
         Point p = new Point(x_, y_, fixed_);
         points.add(p);

         if(this.points.size() > 1){
      
               if(closed && segments.size() > 0){ segments.remove(segments.size() - 1); }
               segments.add(new Segment(points.get(points.size() - 2), points.get(points.size() - 1), length_));
               if(closed){ segments.add(new Segment(points.get(points.size() - 1), points.get(0), length_)); }
         }
       
     }
     
     void insertPoint(boolean fixed_, float len0_, float len1_, int index_){
       
          if(points.size() > 1){
            
          PVector median = PVector.add(new PVector(points.get(index_).x, points.get(index_).y), new PVector(points.get(index_ + 1).x, points.get(index_ + 1).y));
          median.mult(0.5);
          
          Point p = new Point(median.x, median.y, fixed_);
          points.add(index_ + 1, p);

          segments.remove(index_);
          segments.add(index_, new Segment(points.get(index_), points.get(index_ + 1), len0_));
          segments.add(index_ + 1, new Segment(points.get(index_ + 1), points.get(index_ + 2), len1_));
      
          }
       
     }
     
     void insertPointByN(boolean fixed_, float len0_, float len1_, int n_){
       
          if(count < points.size() - 2 - n_) { count += n_; } else { count = 0; }
          
          if(points.size() > 1){
            
          int index_ = count;
          
          PVector median = PVector.add(new PVector(points.get(index_).x, points.get(index_).y), new PVector(points.get(index_ + 1).x, points.get(index_ + 1).y));
          median.mult(0.5);
          
          Point p = new Point(median.x, median.y, fixed_);
          points.add(index_ + 1, p);

          segments.remove(index_);
          segments.add(index_, new Segment(points.get(index_), points.get(index_ + 1), len0_));
          segments.add(index_ + 1, new Segment(points.get(index_ + 1), points.get(index_ + 2), len1_));
      
          }
       
     }
     
     void insertEdgePoint(boolean fixed_, float len0_, float len1_){
       
          int index_ = 0;
          
          if(points.size() > 1){
          
          boolean edged = false;
          while(!edged){
            
            index_ = floor(random(points.size() - 2));
            Point p = points.get(index_);
            if(PVector.dist(new PVector(0.0, 0.0), new PVector(p.x, p.y)) >= bounds.distance.x) edged = true;
            
          }
          
          PVector median = PVector.add(new PVector(points.get(index_).x, points.get(index_).y), new PVector(points.get(index_ + 1).x, points.get(index_ + 1).y));
          median.mult(0.5);
          
          Point p = new Point(median.x, median.y, fixed_);
          points.add(index_ + 1, p);

          segments.remove(index_);
          segments.add(index_, new Segment(points.get(index_), points.get(index_ + 1), len0_));
          segments.add(index_ + 1, new Segment(points.get(index_ + 1), points.get(index_ + 2), len1_));
      
          }
       
     }
     
     void update(float t_){
       
       for(Segment s : segments){ s.applyForces(); }
       for(int i = 0; i < points.size(); i++) {
           
                Point p = points.get(i);
                p.checkCollision(i, points);
                p.update(t_);
                p.resetForce();
                bounds.set(p);
                
       }
  
     }
     
     void draw(){
         
         if(frameCount%512 == 0){
         
         beginRecord(PDF, "outputs/output_" + frameCount + ".pdf"); 
         
         fill(0);
         noStroke();
         
         points.draw(bounds, width / 2, height / 2);
         
         endRecord();
         
         }
         
         fill(0);
         noStroke();
         
         points.draw(bounds);
       
     }
  
}

class Boundaries{
  
    PVector distance; // (10.0, 20.0) min, max
    float minX, maxX, minY, maxY;
    float k = 0.85;
    
    Boundaries(){
      
        minX = Float.POSITIVE_INFINITY;
        maxX = Float.NEGATIVE_INFINITY;
        
        minY = Float.POSITIVE_INFINITY;
        maxY = Float.NEGATIVE_INFINITY;
        
        distance = new PVector(r * k, r);
      
    }
    
    void set(PVector v_){
     
       minX = min(minX, v_.x);
       maxX = max(maxX, v_.x);
       
       minY = min(minY, v_.y);
       maxY = max(maxY, v_.y);
       
       float minDistance = PVector.dist(new PVector(0.0, 0.0), new PVector(minX, minY));
       float maxDistance = PVector.dist(new PVector(0.0, 0.0), new PVector(maxX, maxY));
       
       distance.y = max(minDistance, maxDistance);
       distance.x = k * distance.y;
       
      
    }
  
    void set(Point p_){
     
       minX = min(minX, p_.x);
       maxX = max(maxX, p_.x);
       
       minY = min(minY, p_.y);
       maxY = max(maxY, p_.y);
      
    }
  
}

