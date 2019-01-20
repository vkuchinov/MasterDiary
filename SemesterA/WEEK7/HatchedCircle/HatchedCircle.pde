/*

HATCHED CIRCLE
based on built-in Processing method 'ellipse'
with some restrictions

by default haching angle is 45°.

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

void setup(){
  
    size(500, 500, "processing.core.PGraphicsRetina2D");
    background(255);
    
    //centerX, centerY, radius, density
    Hatched circle = new Hatched(width/2, height/2, 150.0, 64);
    circle.draw();

}
