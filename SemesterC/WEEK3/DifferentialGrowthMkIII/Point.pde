class Point extends PVector{
 
     boolean fixed = false;
     PVector velocity, acceleration, force;
     float m = 1.0;
     float drag = 0.8;
     float collisionDistance = 16.0;
     
     Point(float x_, float y_, boolean fixed_){
      
         fixed = fixed_;
         x = x_; y = y_;
         velocity = new PVector(0.0, 0.0);
         acceleration = new PVector(0.0, 0.0);
         force = new PVector(0.0, 0.0);
       
     } 
  
     void addForce(PVector f_){ force.add(f_); }
     void resetForce() { force = new PVector(0.0, 0.0); }
     
     void fix() { fixed = true; }
     
     void update(float t_){
      
        if(!fixed){
            
            acceleration = new PVector(force.x, force.y);
            acceleration.div(m);
            
            PVector v0 = cloneAndMult(acceleration, t_);
            velocity.add(v0);
            PVector v1 = cloneAndMult(velocity, t_);
            x += v1.x;
            y += v1.y;
            velocity.mult(drag);
         
        } 
       
     }
     
     void checkCollision(int i_, PointList points_){
       
         for(int p = 0; p < points_.size(); p++){
          
              if(i_ != p) { 
                
                    PVector d = PVector.sub(new PVector(x, y), new PVector(points_.get(p).x, points_.get(p).y));
                    if(d.mag() < collisionDistance + 0.03 * PVector.dist(new PVector(0.0, 0.0), new PVector(x, y))){ d.mult(1.0 / (d.mag() + 0.001)); force.add(d); }
              }
           
         }
       
     }
     
     PVector cloneAndMult(PVector v_, float mult_){
      
          PVector output = new PVector(v_.x, v_.y, 0.0);
          output.mult(mult_);
          return output;
       
     }
  
}

class PointList extends ArrayList<Point>{
  
    void draw(Boundaries bounds_){ beginShape(); for(Point p : this) { vertex(map(p.x, bounds_.minX, bounds_.maxX, -width / 2 * 0.69, width / 2 * 0.69), map(p.y, bounds_.minY, bounds_.maxY, -height / 2 * 0.69, height / 2 * 0.69)); } endShape(CLOSE); }
    void draw(Boundaries bounds_, float offsetX_, float offsetY_){ beginShape(); for(Point p : this) { vertex(offsetX_ + map(p.x, bounds_.minX, bounds_.maxX, -width / 2 * 0.69, width / 2 * 0.69), offsetY_ + map(p.y, bounds_.minY, bounds_.maxY, -height / 2 * 0.69, height / 2 * 0.69)); } endShape(CLOSE); }


}
