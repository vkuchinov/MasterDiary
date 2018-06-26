class Spiral{
  
   float radius;
   int n;
   
   ArrayList<PVector> nodes = new ArrayList<PVector>();
   ArrayList<PVector> sets = new ArrayList<PVector>();
   
   Spiral(float radius_, int n_){
     
       radius = radius_;
       n = n_;
       
       fermatsSpiral();
     
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

   void fermatsSpiral(){
     
        for (int i = 0; i < n; i++) {
        
          float theta = 2.39998131 / 32.0 * i;
          float radius = 32.0 * sqrt(theta);
          float x = cos(theta) * radius;
          float y = sin(theta) * radius;
          
          nodes.add(new PVector(x, y));
          
        }

   }
   
   void setCircles(float[] circles_){
     
      sets.add(new PVector(nodes.get(0).x, nodes.get(0).y, circles_[0]));
      int index = 1;
      for(int i = 1; i < circles_.length; i++){
        
        boolean collision = true;
        PVector A = sets.get(sets.size() - 1);
        int count = index;
        
        while(collision){
          
          PVector B = new PVector(nodes.get(count).x, nodes.get(count).y, circles_[i]);
          float dist = PVector.dist(new PVector(A.x, A.y), new PVector(B.x, B.y));
          if(dist > (A.z + B.z)) { collision = false; sets.add(new PVector(nodes.get(count).x, nodes.get(count).y, circles_[i])); index = count; }
          count++;
          if(count > nodes.size()) break;
          
        }
        
        
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
   
   void drawCircles(){
     
     fill(255, 128);
     stroke(0, 128);
     for(PVector c : sets) { ellipse(c.x, c.y, c.z * 2, c.z * 2); }
    
     
   }
}
