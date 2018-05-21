/*

INFINITY FORMULA [∞]

Graph plot formula to draw the lemniscate ∞ symbol

r = 2 + 2 * cos ( n * theta )

where n is number of 'petals', in this case
it should be 2;

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float scale = 64.0;
float n = 2.0;

void setup(){
 
   size(600, 600, "processing.core.PGraphicsRetina2D");
   translate(width / 2, height / 2);
   
   for(float theta = -PI; theta <= PI; theta += 0.01){
     
     
     float r = 2 + 2 * cos ( n * theta );
     
     float x = r * cos(theta) * scale;
     float y = r * sin(theta) * scale;
  
     point(x, y);
     
   }
  
}
