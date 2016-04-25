/*

HATCHED RECTANGLE

@author     Vladimir V. KUCHINOV
@email      helloworld@vkuchinov.co.uk

*/

Hatched rectangle;

void setup(){
 
    size(600, 600, "processing.core.PGraphicsRetina2D"); 
  
    //setting rectangle
    rectangle = new Hatched(width/2, height/2, 320, 200, 64);
    
    //CENTER, CORNER
    rectangle.setMode(CENTER);
    
    rectangle.draw();
    
}
