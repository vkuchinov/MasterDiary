/*

DIFFERENTIAL GROWTH
based on Anders Hoff [inconvergent]

[x] updated with growth regions
[-] random insert > shifted by n (n = 2)

REFERENCES:
http://inconvergent.net
https://github.com/inconvergent/differential-line

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

import processing.pdf.*;

DifferentialLine dl;
int resolution = 128;
float r = 100.0;
float t = 0.3;

void setup(){
 
   size(900, 900, "processing.core.PGraphicsRetina2D"); 
   translate(width / 2, height / 2);
   background(255);
   
   dl = new DifferentialLine(true);
   
   for(float a = 0; a < TAU; a += TAU / resolution ){ dl.addPoint(r * cos(a), r * sin(a), false, 5.0); }

}

void draw(){
 
   background(255);
   translate(width / 2, height / 2);
  
   dl.insertEdgePoint(false, 5, 5);
   
   dl.update(t);
   dl.draw(); 

   if(frameCount%5120 == 0) { println(dl.points.size()); }
  
}
