/*

MITSUBISHI FLAKE [artefacted from Koch SnowFlake]
based on vectors and draw()

to do a correct version on Koch snowflake, have to
determine what intersection out of two should be selected

Let's call it Mitsubishi fractal :)

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/


Koch flake;

void setup(){
  
    size(720, 720);
    frameRate(1);
    
    flake = new Koch(0, 50, 350, radians(30));

}

void draw(){
  
    background(220);
    translate(width/2, height/2);
  
    flake.nextLevel();
    flake.draw();

}
