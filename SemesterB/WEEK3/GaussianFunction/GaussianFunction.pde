/*

GAUSSIAN FUNCTION
knows as well as Bell curve or normal distribution

REFERENCES
http://codepen.io/zapplebee/pen/ByvmMo

@author    Vladimir V. KUCHINOV
@email     helloworld@vkuchinov.co.uk

*/

float max = Float.MIN_VALUE;
float min = Float.MAX_VALUE;

void setup(){
 
      size(600, 700, "processing.core.PGraphicsRetina2D"); 
      background(255);
      
      for(float s = 0.25; s < 5.0; s += 0.1){
        
          for(float i = 0; i < 500; i += 0.1){
            
            float x = map(i, 0, 500, -5.0, 5.0);
            float y = (float)dynamicGaussian(x, 0.0, s);
            
            //min = min(min, y);
            //max = max(max, y);
    
            strokeWeight(0.75);
            point(50 + i, map(y, 0, 1, height - 50, 0));
            
          }
          
      }
  
}

  double gaussian(float x_) {

      float mean = 0.0;
      float sigma = 1.0;

      return (1.0 / Math.sqrt(2.0 * Math.PI * sigma)) * Math.exp(-sq(x_ - mean) / (2.0 * sigma));

  }
  
  double dynamicGaussian(float x_, float mean_, float sigma_) {

      return (1.0 / Math.sqrt(2.0 * Math.PI * sigma_)) * Math.exp(-sq(x_ - mean_) / (2.0 * sigma_));

  }
