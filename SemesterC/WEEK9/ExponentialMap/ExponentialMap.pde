/*

EXPONENTIAL MAP 

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float n[] = new float[]{0.0, 1.3, 2.2, 5.0, 8.1, 9.1, 9.2, 10.9, 25.0, 33.9, 40.9, 45.3, 50.0};

void setup(){
  
   size(800, 400);
   background(0);
   
   noFill();
   stroke(0, 255, 255);
   beginShape();
   for(int i = 0; i < n.length; i++){
   vertex(map(i, 0, n.length, 50, 800), map(n[i], 0, 50, 200, 50));
   }
   endShape();
   
   stroke(255, 0, 255);
   beginShape();
   for(int i = 0; i < n.length; i++){
   vertex(map(i, 0, n.length, 50, 800), map(exponentialMap(n, n[i], 0.0, 50.0, 8.0, 16.0), 8.0, 16.0, 350, 200));
   }
   endShape();
}

float exponentialMap(float[] n_, float value_, float min0_, float max0_, float min1_, float max1_){
  
  float a = 0.8; float b = 5E2;
    
  float o[] = new float[n_.length];
  for(int i = 0; i < n_.length; i++){ o[i] = a * pow(b, map(n_[i], min0_, max0_, 0.0, 1.0)); }
  
  float min = min(o);
  float max = max(o);
  
  float v = map(value_, min0_, max0_, 0.0, 1.0);
  return map(a * pow(b, v), min, max, min1_, max1_); 
  
}

