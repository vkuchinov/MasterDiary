class Triangle{
  
      final int NUM_DOTS = 10000;
      
      PVector[] points = new PVector[3];
      color[] cc = new color[3];
      
      Triangle(){
       
            points[0] = new PVector(280.0, 80.0);
            points[1] = new PVector(80.0, 390.0);
            points[2] = new PVector(400.0, 420.0);
       
      } 
      
      void draw(){
        
        strokeWeight(1.0);
        for(PVector v : points) point(v.x, v.y);
            
        for(float l = 0.0; l < 1.0; l += 0.005){
         
              PVector l1 = PVector.lerp(points[0], points[1], l);  
              PVector l2 = PVector.lerp(points[0], points[2], l); 
              
              for(int p = 0; p < (int)random(32, 512); p++){
               
                PVector pp = PVector.lerp(l1, l2, random(1.0));
                point(pp.x, pp.y);
                
              }
        }
        
      
        
      }
  
}
