/*

KOCH SNOWFLAKE
based on vectors and draw()

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/


Koch flake;

void setup(){
  
    size(720, 720);
    frameRate(1);
    
    flake = new Koch(0, -50, 300, radians(99.0));

}

void draw(){
  
    background(220);
    translate(width/2, height/2);
  
    flake.nextLevel();
    flake.draw();

}
