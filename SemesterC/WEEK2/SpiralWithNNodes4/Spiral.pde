class Spiral{
  
   float radius;
   int n;
   
   ArrayList<PVector> nodes = new ArrayList<PVector>();
   ArrayList<Rectangle> sets = new ArrayList<Rectangle>();
   
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
   
   void setRectangles(PVector[] data_){
     
      Rectangle r = new Rectangle(new PVector(0.0, 0.0), data_[0].x * 0.8, data_[0].y * 0.8);
      r.setByCenter(nodes.get(0));
      sets.add(r);
         
      for(int i = 1; i < data_.length; i++){
       
         boolean collision = true;
         int count = 0;
         
         while(collision){
          
         boolean check = true;
         Rectangle B = new Rectangle(new PVector(0.0, 0.0), data_[i].x * 0.8, data_[i].y * 0.8);
         B.setByCenter(new PVector(nodes.get(count).x, nodes.get(count).y));
      
         for(Rectangle A : sets) {
           
               float xmin = max(A.position.x, B.position.x);
               float xmax1 = A.position.x + A.dimensions.x;
               float xmax2 = B.position.x + B.dimensions.x;
               
               float xmax = min(xmax1, xmax2);

               if (xmax > xmin) {
                 
                  float ymin = max(A.position.y, B.position.y);
                  float ymax1 = A.position.y + A.dimensions.y;
                  float ymax2 = B.position.y + B.dimensions.y;
                  float ymax = min(ymax1, ymax2);
                  if (ymax > ymin) { check = false; }
                
               }
           
         }
         
         if(check) { sets.add(B); collision = false; }
         
         if(count > nodes.size() - 2) break;
         count++;
         
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
   
   void drawRectangles(){
     
     fill(255, 128);
     stroke(0, 128);
     for(Rectangle r : sets) { rect(r.position.x, r.position.y, r.dimensions.x, r.dimensions.y); }
     
   }
}
