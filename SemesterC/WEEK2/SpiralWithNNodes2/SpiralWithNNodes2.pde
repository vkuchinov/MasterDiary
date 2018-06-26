/*

SPIRAL WITH N-NODES v1.0

REFERENCES:
http://mathworld.wolfram.com/topics/Spirals.html

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Spiral s;
float circles[] = new float[]{80.0, 77.0, 60.0, 45.0, 40.0, 32.0, 22.0, 13.0, 11.0, 8.0, 7.5, 4.0, 4.0, 3.0, 15.0, 30.0, 30.0}; 

void setup(){
 
   size(512, 512, "processing.core.PGraphicsRetina2D"); 
   translate(width/2, height/2);
   
   s = new Spiral(200, 512);
   s.draw();
   
   fill(220, 128);
   rect(-width/2, -height/2, width, height);
   
   s.setCircles(circles);
   s.drawCircles();
   
}
