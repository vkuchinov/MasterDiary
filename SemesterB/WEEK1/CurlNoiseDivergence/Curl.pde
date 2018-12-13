class Curl{
  
   float freqA = 0.333, freqB = 0.333, freqC = 0.333;
   int phaseA = 0, phaseB = 2, phaseC = 4;
   
   float speed = 0.5, step = 512.0;
   
   ArrayList<Disc> discs = new ArrayList<Disc>();

   Curl(int N_){
     
     for(int i = 0; i < N_; i++){
      
        Disc d = new Disc(random(0, width), random(0, height));
        discs.add(d);
       
     }
    
   } 
   
   PVector computeCurl(float x_, float y_){
  
      float EPSILON  = 0.001;
      float n1 = noise(x_, y_ + EPSILON); 
      float n2 = noise(x_, y_ - EPSILON); 
      float a = (n1 - n2) / (2.0 * EPSILON);

      n1 = noise(x_ + EPSILON, y_);
      n2 = noise(x_ - EPSILON, y_); 
      float b = (n1 - n2) / (2.0 * EPSILON);

      return new PVector(a, -b);
      
   }

   void draw(){
     
      for(Disc d : discs) { 
      
        PVector curl = computeCurl(d.x / step, d.y / step);
        d.velocity.x = speed * curl.x;
        d.velocity.y = speed * curl.y;
      
        d.add(d.velocity);

        if(d.x < 0 || d.x > width) { d.x = random(0, width); d.y = random(0, height); }
        if(d.y < 0 || d.y > height) { d.x = random(0, width); d.y = random(0, height); }
        d.draw(); 
    
      }
     
   }
  
}

class Disc extends PVector{
  
    PVector velocity = new PVector(0.0, 0.0);
    float radius = 1.0;
    float c = random(0, 255);
    
    Disc(float x_, float y_){
      
        x = x_; y = y_;
      
    }
    
    void draw(){
     
       stroke(c, 240, 240);
       strokeWeight(radius);
       point(x, y);
       
      
    }
  
}


