/*

POLYSKELION [N-SIDES -SKELION]

There are of course numerous images of the symbols of interest. With the focus of this exercise 
on the triskelion, a preliminary challenge was the location of a precision rendering in 2D. 
The form is of mathematical interest, given the challenge of generating a triple spiral 
(Parametric equations and specifications of a triskelion (triple spiral), 
Mathematics Stack Exchange, 30 January 2014). 

This extends to the generation of "quadskelions" and "polyskelions", namely chains of interlinked
spirals as reproduced below from that exchange.


    T1 = - π/N + π/2 - 2πx/N;
    0 < T2 < 1
    
    X(x,y) = cos(2πx / N) + y * sin(π/N) cos((2πs + π) * y - T1(x))
    Y(x,y) = sin(2π(x + 1) / N) + y * sin(π/N) * cos((2πs + π) * y - T1(x))
    
    X1(x,y) = cos(2π(x + 1) / N) - y * sin(π/N) * cos((2πs + π) * y - T1(x))
    Y1(x,y) = cos(2π(x + 1) / N) - y * sin(π/N) * sin((2πs + π) * y - T1(x))
    
    (X(L,t), Y(L,t) { 2L + t <= T }), where 0 < t < 1
    (X(L,t), Y(L,t) { 2L + 2 - t <= T }), where 0 < t < 1
    
    T = 2N(T2)
    
    L = [0 ... N - 1] 
    
REFERENCES:
https://en.wikipedia.org/wiki/Triskelion
https://www.geogebra.org/m/qYT5HT6b
http://benice-equation.blogspot.com/2014/07/tiling-using-spiral-hexaskelions.html
https://math.stackexchange.com/questions/651772/parametric-equations-and-specifications-of-a-triskelion-triple-spiral

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Collections;

int N = 6;
int s = -2;
float R = 128.0;

float T1 = 0.0;

   
ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
 
   size(600, 600, "processing.core.PGraphicsRetina2D");
   translate(width/2, height/2);
   background(0);
   colorMode(HSB);

   for(int L = 0; L <= N - 1; L++){
      
           float T2 = 1.0;
           float T = 2 * N * T2;
           
           ArrayList<PVector> set0 = new ArrayList<PVector>();
           ArrayList<PVector> set1 = new ArrayList<PVector>();
           
           for(float t = 0; t <= 1.0; t += 1E-4){
             
              float xy0 = 2.0 * L + max(t, T);
              //float xy1 = 2.0 * L + 2 + max(t, T);
             
              float T1 = - PI/(float)N + HALF_PI - TWO_PI * L / (float)N;
              
              float x0 = cos(TWO_PI * L / (float)N) + t * sin(PI/ (float)N) * cos((TWO_PI * s + PI) * t - T1);
              float y0 = sin(TWO_PI * L / (float)N) + t * sin(PI/ (float)N) * sin((TWO_PI * s + PI) * t - T1);
             
              set0.add(new PVector(x0 * R, y0 * R));
              stroke(map(t, 0, 1, 0, 128), 240, 240);
              ///point(x0 * R, y0 * R);
              
              float x1 = cos(TWO_PI * (L + 1) / (float)N) - (1.0 - t) * sin(PI/ (float)N)*cos((TWO_PI * s + PI) * (1.0 - t) - T1);
              float y1 = sin(TWO_PI * (L + 1) / (float)N) - (1.0 - t) * sin(PI/ (float)N)*sin((TWO_PI * s + PI) * (1.0 - t) - T1);

              set1.add(new PVector(x1 * R, y1 * R));
              stroke(map(t, 0, 1, 128, 256), 240, 240);
              //point(x1 * R, y1 * R);
           }
           
           points.addAll(set0);
           points.addAll(set1);
           
   }
   
   beginShape();
   for(PVector p : points) { vertex(p.x, p.y); }
   endShape(CLOSE);
  
}
