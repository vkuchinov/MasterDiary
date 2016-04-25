/*

HORIZONTAL & VERTICAL FLIPS
a very simple trick to do it
with scale() method

    scale(x, y)
    
    scale(-1.0,  1.0) horizontal flip
    scale( 1.0, -1.0) vertical flip
    
    * could be used in 3D space as well scale(x, y, z);

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

void setup(){
 
     size(600, 600);
     background(0);
    
     stroke(255, 0, 255);
     fill(255);
     translate(width/2, height/2);
    
     line(-200, 200, 200, -200);   //same parameters
    
     //horizontal flip example
     scale(-1.0, 1.0);
    
     line(-200, 200, 200, -200);   //same parameters
  
}
