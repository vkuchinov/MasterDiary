/*

BILINEAR INTERPOLATION
with coefficients Qs

COLORS MAP [JUST FOR THIS EXAMPLE]

    0 1
    2 3
    
    0: x:   0, y:   0
    1: x: 600, y:   0
    2: x:   0, y: 600
    3: x: 600, y: 600 [with 1.0]

REFERENCES
https://en.wikipedia.org/wiki/Bilinear_interpolation

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;
Random seed = new Random(12345678);
color[] corners = new color[4];
float[] q = new float[]{ 0.5, 0.5, 0.5, 1.0 };

void setup(){
  
     size(600, 600);
     for(int c = 0; c < 4; c++){ corners[c] = color(seed.nextInt(255), seed.nextInt(255), seed.nextInt(255)); }
     
     noStroke();
     fill(corners[0]);
     rect(0, 0, 300, 300);
     fill(corners[1]);
     rect(300, 0, 300, 300);
     fill(corners[2]);
     rect(0, 300, 300, 300);
     fill(corners[3]);
     rect(300, 300, 300, 300);
     
     for(int y = 0; y < height; y++){
       for(int x = 0; x < width; x++){
         
           fill(bilinearInterpolation(x, y, corners, q));
           rect(x, y, 1, 1);
           
       }
     }

}

color bilinearInterpolation(int x_, int y_, color[] colors_, float[] q_){

      float red, green, blue;
      
      return color(red, green, blue);
}
