/*

SPIRAL WITH N-NODES v1.0

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Spiral s;

void setup(){
 
   size(512, 512, "processing.core.PGraphicsRetina2D"); 
   translate(width/2, height/2);
   
   s = new Spiral(200, 32);
   s.draw();
   
}
