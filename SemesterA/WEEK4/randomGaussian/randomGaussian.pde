/*

DIFFERENT TYPES OF RANDOM [PSEUDO-RANDOM] GENERATORS

random()
Generates random numbers. Each time the random() function is called, 
it returns an unexpected value within the specified range. If only 
one parameter is passed to the function, it will return a float 
between zero and the value of the high parameter. For example, 
random(5) returns values between 0 and 5 (starting at zero, and 
up to, but not including, 5).

randomSeed() goes with random()
Sets the seed value for random(). By default, random() produces different 
results each time the program is run. Set the seed parameter to a constant 
to return the same pseudo-random numbers each time the software is run.

randomGaussian()
Returns a float from a random series of numbers having a mean of 0 and standard deviation of 1. 
Each time the randomGaussian() function is called, it returns a number fitting a Gaussian, 
or normal, distribution. There is theoretically no minimum or maximum value that 
randomGaussian() might return. Rather, there is just a very low probability that values far 
from the mean will be returned; and a higher probability that numbers near the mean will 
be returned.

sort(array) doesn't work correctly

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/
import java.util.Arrays;

void setup(){
  
    size(500,620);  
    background(#574F59);

    float[][] data = new float[3][580];
    
    //randomGaussian method()
    for (int y = 0; y < 580; y++) {
        float x = randomGaussian() * 15;
        stroke(#A3C4D9);
        line(50, 20 + y, 50 + x, 20 + y);
        data[0][y] = x;
    }
    drawRadial(400, 120, 0, data);
    
    //random method()
    for (int y = 0; y < 580; y++) {
        float x = random(-30, 30);
        stroke(#F2E8B6);
        line(150, 20 + y, 150 + x, 20 + y);
        data[1][y] = x;
    }
    drawRadial(400, 320, 1, data);
    
    //randomSeed set the speed for random() method
    randomSeed(500000000);
    for (int y=0; y < 580; y++) {
        float x = random(-30, 30);
        stroke(#F299CA);
        line(250, 20 + y, 250 + x, 20 + y);
        data[2][y] = x;
    }
    drawRadial(400, 500, 2, data);
    
}

void drawRadial(int x_, int y_, int index_, float[][] data_){
  
  //Arrays.sort(data_[index_]);
  
  for(int n = 0; n < 580; n++){
    float x2 = x_ + sin(radians(360.0/580.0 * n)) * data_[index_][n] * 2.0;
    float y2 = y_ + cos(radians(360.0/580.0 * n)) * data_[index_][n] * 2.0;
    line(x_, y_, x2, y2);
  }
  
}


