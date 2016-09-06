/*

LINEAR INTERPOLATION

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;
Random seed = new Random(12345);
color[] edges = new color[2];

void setup(){
  
     size(600, 150);
     edges[0] = color(seed.nextInt(255), seed.nextInt(255), seed.nextInt(255));
     edges[1] = color(seed.nextInt(255), seed.nextInt(255), seed.nextInt(255));

     for(int x = 0; x < width; x++){
      
        noStroke();
        fill(interpolationColor(edges[0], edges[1], 1.0/600.0 * x));
        rect(x, 0, 1, 150); 
       
     }

}

color interpolationColor(color c0_, color c1_, float fraction_){

            float fraction = constrain(fraction_, 0.0, 1.0);
            
            float deltaR = red(c1_) - red(c0_);
            float deltaG = green(c1_) - green(c0_);
            float deltaB = blue(c1_) - blue(c0_);

            float red = constrain(red(c0_) + (deltaR * fraction), 0, 255);
            float green = constrain(green(c0_) + (deltaG * fraction), 0, 255);
            float blue = constrain(blue(c0_) + (deltaB * fraction), 0, 255);

            return color(red, green, blue);
            
}
