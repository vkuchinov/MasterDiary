class Sphere{
 
   PVector center;
   float radius;

   ArrayList<PVector> points = new ArrayList<PVector>();
   
   Sphere(PVector center_, float radius_, int n_){
     
       center = new PVector(center_.x, center_.y, center_.z);
       radius = radius_;

       float step = 360.0 / n_;
         
         for(float p = 0.0; p <= 360.0; p += step){
             for(float t = 0.0; t <= 360.0; t+= step){
             
             float x = radius * cos(radians(p))*sin(radians(t));
             float y = radius  * sin(radians(p))*sin(radians(t));
             float z = radius * cos(radians(t));

             points.add(new PVector(x, y, z));
             
             }
         }
       
    
   } 
   
   void draw(){
     
      stroke(128);
      strokeWeight(2);
      for(PVector p : points) { point(p.x, p.y, p.z); } 
     
   }
  
  
}
