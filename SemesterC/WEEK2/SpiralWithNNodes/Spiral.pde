class Spiral{
  
   float radius;
   int n;
   
   ArrayList<PVector> nodes = new ArrayList<PVector>();
   
   Spiral(float radius_, int n_){
     
       radius = radius_;
       n = n_;
       
       theodorusSpiral();
     
   }
   
   void equiangularSpiral(){

       float sigma = 6.0 * PI;
       float step = sigma / n;
       float max = max(exp(sigma) * cos(sigma), exp(sigma) * sin(sigma));
       
       for(float t = 0; t <= sigma; t += step){
         
           float x = map(exp(t) * cos(t), 0, max, 0, radius);
           float y = map(exp(t) * sin(t), 0, max, 0, radius);
           
           nodes.add(new PVector(x, y));
         
       }
     
   }
   
   void theodorusSpiral(){
    
       float theta = 0.0;
       float increment = 2 * PI / 16;
       
       float max = sqrt(n);
       
       for(float i = 0; i <= n; i++){
         
           float x = map(sqrt(i), 0, max, 0, radius) * cos(theta);
           float y = map(sqrt(i), 0, max, 0, radius) * sin(theta);
           
           nodes.add(new PVector(x, y));
         
           theta += increment;
         
       }
     
   }

   void draw(){
    
      noFill();
      beginShape();
      for(PVector p : nodes){ vertex(p.x, p.y); }  
      endShape();
      
      fill(255, 0, 255);
      noStroke();
      for(PVector p : nodes){ ellipse(p.x, p.y, 4, 4); }  
     
   }
}
