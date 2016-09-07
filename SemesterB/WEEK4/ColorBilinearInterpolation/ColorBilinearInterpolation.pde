/*

BILINEAR INTERPOLATION

COLORS MAP [JUST FOR THIS EXAMPLE]

    0 1
    2 3
    
    0: x:   0, y:   0
    1: x: 600, y:   0
    2: x:   0, y: 600
    3: x: 600, y: 600 

REFERENCES
https://en.wikipedia.org/wiki/Bilinear_interpolation

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

//color[] corners = new color[4];
color[] corners = new color[]{ color(255, 0, 255), color(255, 255, 0), color(0, 255, 255), color(128, 128, 128)};
void setup(){
  
     size(600, 600);
     //for(int c = 0; c < 4; c++){ corners[c] = color(seed.nextInt(255), seed.nextInt(255), seed.nextInt(255)); }
     
     noStroke();
     
     for(int y = 0; y < height; y++){
       for(int x = 0; x < width; x++){
         
           fill(bilinearInterpolation(x, y, corners));
           rect(x, y, 1, 1);
           
       }
     }

}

color bilinearInterpolation(int x_, int y_, color[] colors_){

     float red, green, blue;
     PVector fraction = new PVector(1.0/600.0 * x_, 1.0/600.0 * y_);
     
     color X1 = linearInterpolation(colors_[0], colors_[2], fraction.x);
     color X2 = linearInterpolation(colors_[1], colors_[3], fraction.x);
     
     return linearInterpolation(X1, X2, fraction.y);

}

color linearInterpolation(color c0_, color c1_, float fraction_){

            float fraction = constrain(fraction_, 0.0, 1.0);
            
            float deltaR = red(c1_) - red(c0_);
            float deltaG = green(c1_) - green(c0_);
            float deltaB = blue(c1_) - blue(c0_);

            float red = constrain(red(c0_) + (deltaR * fraction), 0, 255);
            float green = constrain(green(c0_) + (deltaG * fraction), 0, 255);
            float blue = constrain(blue(c0_) + (deltaB * fraction), 0, 255);

            return color(red, green, blue);
            
}

