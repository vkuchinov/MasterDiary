class Particle extends PVector{
  
   PVector v;
   PVector n;
   float speed;
   ArrayList<PVector> points = new ArrayList<PVector>();
   
   Particle(float x_, float y_, float z_, float speed_){
    
       x = x_; y = y_; z = z_;
       speed = speed_;
       v = new PVector(random(-1.0, 1.0), random(-1.0, 1.0), random(-1.0, 1.0));
       v.normalize();
       v.mult(speed);
       
       points.add(new PVector(x, y, z));
      
  
   } 


   void draw(Sphere walls_){
 
      PVector c = new PVector(walls_.center.x, walls_.center.y, walls_.center.z);
      
      if(PVector.dist(new PVector(x, y, z), c) > 100.0) {
        
          PVector n = new PVector(0.0, 0.0, 0.0);
          n.x = (c.x - x) / abs(c.x - x);
          n.y = (c.y - y) / abs(c.y - y);
          n.z = (c.z - z) / abs(c.z - z);
          n.normalize();
          
          x += n.x; 
          y += n.y; 
          z += n.z;
          
          v.add(n);
          v.normalize();
          v.mult(speed);
          
          points.add(new PVector(x, y, z));
          
      } 
      
      this.add(v);
      
      stroke(0);
      strokeWeight(5);
      point(x, y, z);
      
      for(int i = 1; i < points.size(); i++){
       
         stroke(255);
         strokeWeight(2);
         line(points.get(i - 1).x, points.get(i - 1).y, points.get(i - 1).z, points.get(i).x, points.get(i).y, points.get(i).z);  
        
      }
      
   }

}

class ParticleSystem extends ArrayList<Particle>{
  
  
  
}
