/*

TRANSLATE & ROTATION
a very basic experiment of pairing translation and 
rotation together

@author    Vladimir V. KUCHINOV
@email     helloworld@vkuchinov.co.uk
  
*/

final float RATIO = 0.005;

float count = 0;
float speed = 0;
 
void setup(){
 
   size(500, 500, "processing.core.PGraphicsRetina2D");
     
}
 
void draw(){
    
   translate(width/2, height/2);
   background(0);
   
   fill(255, 16);
   stroke(255);
   
   for(int i = 0; i < 32; i++){
     
       rotate(0.5 * count);
       rect(i, i, i * 5.0,i * 4.0, 5.0, 5.0, 5.0, 5.0);
       
   }
    
   count += speed;
   speed = map(0 , 0, width, -RATIO , RATIO);
    
}

