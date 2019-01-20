/*

CENTRIPETAL FORCE

A centripetal force (from Latin centrum, "center" and petere,
"to seek") is a force that makes a body follow a curved path. 

Its direction is always orthogonal to the motion of the body and towards 
the fixed point of the instantaneous center of curvature of the path. 

Isaac Newton described it as "a force by which bodies are drawn or impelled, 
or in any way tend, towards a point as to a centre".In Newtonian mechanics, 
gravity provides the centripetal force responsible for astronomical orbits.


R - radius, or r
Ω - angular velocity (spin rate), or ω
V - tangential velocity (rim speed)
A - centripetal acceleration, or a
T - period of rotation

ν = 2 * π * R / T;

centripetal acceleration
a = ν² / R, where ν is moving velocity
ν = r * ω

so, a = r * ω²

or a = ( 4 * π² * r ) / T²

centripetal force
F = m * ν² / r
F = m * r * ω²

F = m * ν² / r² * r, vector form


REFERENCES:
https://en.wikipedia.org/wiki/Centripetal_force
https://www.khanacademy.org/science/physics/centripetal-force-and-gravitation/centripetal-acceleration-tutoria/v/centripetal-force-and-acceleration-intuition

http://www.artificial-gravity.com/sw/SpinCalc/

http://www.walter-fendt.de/ph6en/carousel_en.htm

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Point p;

void setup(){
 
   size(600, 600, "processing.core.PGraphicsRetina2D"); 
   background(0);
   p = new Point(200.0, random(-PI, PI), 3.2);
  
}

void draw(){
  
    //background(0);
    noStroke();
    fill(0, 0.5);
    rect(0, 0, width, height);
    translate( width / 2, height / 2 );

    p.draw();
    
    
}
