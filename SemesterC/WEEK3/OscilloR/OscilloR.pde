/*

PARAMETRIC OSCILLO(S) ℝ³ > ℝ²
[projections]*
        
       x:    y:    z:
r  = < f(t), g(t), h(t) >

PROJECTIONS:
                  x:      y: z:
xz = r A(t) = <  sin(t),      0, t >
xy = r B(t) = < -sin(t), cos(t), 0 >
zy = r C(t) = <       0, cos(t), t >


REFERENCES:
https://en.wikipedia.org/wiki/Real_number

UPDATED [2016]:
https://math.boisestate.edu/~jaimos/classes/m275-summer2016/notes/2-1a-curves.pdf

author Vladimir V KUCHINOV
@email helloworld@vkuchinov.co.uk

*/

import peasy.*;
PeasyCam cam;

float R = 128.0;
float cnst = 128.0;

void setup(){
 
     size(512, 512, P3D);
     background(192, 192, 192);
    
     cam = new PeasyCam(this, 256);
     cam.setMinimumDistance(50);
     cam.setMaximumDistance(500); 
 
     
}

void draw(){
  
    colorMode(RGB);
    background(192, 192, 192);
    
    for(float t = -PI; t <= PI; t += 0.01) {
       
       float x = 0, y = 0, z = 0;
       
       x =  R * cos(t);
       y =  R * sin(t);
       z =  cnst * t;
       
       strokeWeight(2.0);
       point(x, y, z);
       
    }

  
}




