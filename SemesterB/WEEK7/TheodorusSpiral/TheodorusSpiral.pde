/*

THEODORUS' SPIRAL

REFERENCES:
https://en.wikipedia.org/wiki/Spiral_of_Theodorus

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

void setup(){
 
     size(800, 800, "processing.core.PGraphicsRetina2D"); 
     translate(width / 2, height / 2); 
     
     noFill();
     beginShape();
     
     for(int i = 1; i < 256; i++){
       
         float phi = TWO_PI / 18.0 * ( i % 18 );
         float r = sqrt(i);
         
         float x = 18 * r * cos(phi);
         float y = 18 * r * sin(phi);
         
         vertex(x, y);
       
     }
  
     endShape();
     
}
