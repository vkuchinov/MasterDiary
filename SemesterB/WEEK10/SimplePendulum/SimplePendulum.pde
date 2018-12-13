/*

A SIMPLE PENDULUM
[based on gravity without any friction or other 'stoppers']

T = 2 * PI * sqrt ( L / g );


REFERENCE:
https://en.wikipedia.org/wiki/Pendulum
https://rosettacode.org/wiki/Animate_a_pendulum

@auhtor Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float G = 9.80665;
Pendulum p;

void setup(){
  
   size(512, 512, "processing.core.PGraphicsRetina2D");
   translate(width/2, 64); 
   
   p = new Pendulum(PI/4.0, 256.0, 0.01);
  
}

void draw(){
  
   background(220); 
   translate(width/2, 64); 
   
   p.draw();
  
}
