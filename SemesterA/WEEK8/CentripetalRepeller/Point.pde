class Point extends PVector{
  
     float radius, angle, velocity, dir;
  
     Point(float radius_, float angle_, float velocity_){
       
         radius = radius_;
         angle = angle_;
         velocity = velocity_;
         
         x = radius * (float)Math.cos(angle);
         y = radius * (float)Math.sin(angle);
         
         dir = 1.0;
         if(random(0, 1) < 0.5) dir *= -1.0;
       
     }
     
     void draw(Mark m_){

         PVector tan = new PVector(0.0, 0.0);
         if(PVector.dist(new PVector(x, y), new PVector(m_.x, m_.y)) < m_.radius * 1.5) { 
            
          float dist = PVector.dist(new PVector(x, y), new PVector(m_.x, m_.y));
          PVector v0 = PVector.sub(new PVector(x, y), new PVector(m_.x, m_.y));
          float mag = v0.mag();
          float ax = m_.x + v0.x / mag * m_.radius;
          float ay = m_.y + v0.y / mag * m_.radius; 
          
          float theta = v0.heading() + dir * PI / 2;
          tan = PVector.fromAngle(theta);
          tan.mult(map(dist, m_.radius * 1.5, 0, 1.0, 9.9));
          
         }

         noStroke();
         fill(255);
         ellipse(x, y, 1, 1);
                  
         noFill();
         
         //velocity vector
         PVector v = PVector.fromAngle((float)Math.atan2(-y, -x) - HALF_PI);
         v.normalize();
         v.mult(velocity);
         //stroke(0, 255, 255);
         //line(x, y, x + v.x * 9.0, y + v.y * 9.0);
         
         //centripetal
         double ca = Math.pow(velocity, 2) / radius / 2;
         float theta = (float)Math.atan2(-y, -x);
         PVector c = PVector.fromAngle(theta);
         c.normalize();
         c.mult((float)ca);
         
         v.add(c);
         v.add(tan);
         
         //stroke(255, 0, 255);
         //line(x, y, x + c.x * 499.0, y + c.y * 499.0);
         
         
         x += v.x;
         y += v.y;

     } 
  
}

class PointList extends ArrayList<Point>{
 
      void draw(Mark m_){ for(Point p : this) { p.draw(m_);  } } 
  
}
