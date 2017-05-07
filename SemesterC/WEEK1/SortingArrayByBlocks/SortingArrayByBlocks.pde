/*

SORTING XY/XYZ POSITIONING ARRAY 
where all values are places sequentially

0.5, 0.6, -0.1, 1.1, -1.1, 0.4 ...

p0: x: 0.5, y:  0.6,  z: -0.1
p1: x: 1.1, y: -1.1,  z:  0.4
...

Sorting should be done by 2d / 3d distances
Probably without calculating sqrt() for a better performance

[a] classical Bubble sort https://en.wikipedia.org/wiki/Bubble_sort

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;

Random seed = new Random(12345);
PVector topleft = new PVector(-1.0, -1.0, -1.0);

float[] positions = new float[384]; //128 values

void setup(){
  
for(int i = 0; i < 384; i++){ positions[i] = (-10000 + seed.nextInt(20000)) / 10000f; } //filling array

printPositions(positions);

bubbleSort(positions);

printPositions(positions);


}

void bubbleSort(float[] array_) 

{ 
    Composite j; 
    boolean sorted = false; 

    while (!sorted) { 
      
        sorted = true; 
    
        for (int i = 0; i < array_.length - 4; i += 3) { 
          
             if (distance(array_, i) > distance(array_, i + 3)) { 
    
             j = new Composite(i, array_[i], array_[i + 1], array_[i + 2]); 
             
             array_[i] = array_[i + 3]; array_[i + 1] = array_[i + 4]; array_[i + 2] = array_[i + 5];
             array_[ i + 3] = j.x; array_[ i + 4] = j.y; array_[ i + 5] = j.z; 
             
             sorted = false;
             
             } 
         
        } 
        
    } 

} 

float distance(float[] array_, int index_){
  
     return PVector.dist(topleft, new PVector(array_[index_], array_[index_ + 1], array_[index_ + 2]));
  
}

void printPositions(float[] array_){
 
     println("\nPOSITIONS:");
     for(int i = 0; i < array_.length; i += 3){ getPosition(array_, i / 3); } 
  
}

void getPosition(float[] array_, int index_){ println("point #" + index_ + " x:" + array_[index_] + ", y:" + array_[index_ + 1] + ", z:" + array_[index_ + 2]);  }

class Composite extends PVector{
  
      int i;
      
      Composite(int i_, float x_, float y_, float z_) {
        
            x = x_; y = y_; z = z_;
            i = i_;
        
      }
  
}
