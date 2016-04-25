/*
MONTE CARLO DISTRIBUTION

REFERENCES:
https://en.wikipedia.org/wiki/Monte_Carlo_method

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

void setup(){
 
   size(920, 480);
   
   ellipseMode(CENTER);
   fill(255, 128);
   noStroke();
   ellipse(240, 220, 400, 400);
   ellipse(680, 220, 400, 400);
   
   for(int p = 0; p < 2048; p++){
    
      //standard distribution
      float theta = random(- 2 * PI, 2 * PI); 
      float x = 240 + cos(theta) * random(180.0);
      float y = 220 + sin(theta) * random(180.0);
      
      stroke(0);
      strokeWeight(1.5);
      point(x, y);
      
      //Monte Carlo distribution
      theta = random(- 2 * PI, 2 * PI);
      x = 680 + cos(theta) * monteCarlo(180.0);
      y = 220 + sin(theta) * monteCarlo(180.0);
      
      stroke(0);
      strokeWeight(1.5);
      point(x, y);
      
   }
  
}

float monteCarlo(float value_){
  
  while (true) {
        float r1 = random(1.0);
        float probability = r1;
        float r2 = random(1.0);
        if (r2 < probability) {
            return r1 * value_;
        }
    } 
}
