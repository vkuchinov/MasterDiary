/*

DOUBLE-DRAGON FRACTAL
[double curve Dragon fractal / twindragon]

REFERENCES:
https://en.wikipedia.org/wiki/Dragon_curve

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Double dragon;

void setup(){
 
   size(500, 500, "processing.core.PGraphicsRetina2D");
   background(255);
   
   dragon = new Double(width/2, height/2, 8, 4);
   dragon.draw();
  
}
