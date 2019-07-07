/*

SPACE INVADERS MATRIX 7x7 
with PDF output

default settings are 36 x 45 species: 1 620 in total

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;
import processing.pdf.*;

Random seed;
int seedNum = 0;

void setup(){
  
size(6540, 8700, PDF, "36x45.pdf");
background(200);
noStroke();

println(seedNum);

//beginRaw(DXF, "output.dxf");
//beginRecord(PDF, "36x45.pdf"); 

for(int y = 0; y < 48; y++){
  for(int x = 0; x < 36; x++){
    
 seed = new Random(seedNum); 
 Invader evilOne = new Invader(new PVector(30 + x*180, 30 + y*180), getSpine(seed), getSides(seed));
 evilOne.draw();
 seedNum++;

 println(seedNum, "of 1 620 is completed");
 
  }
 }
 
 //endRecord();
 
}

boolean[] getSides(Random src){
boolean[] sides = new boolean[21]; 
for(int b = 0; b < sides.length; b++)
  {
  float mapped = map(src.nextInt()/1e7, -255, 255, -0.5, 0.5);
  sides[b] = ( mapped >= 0) ? true:false;
  }
return sides;  
}

boolean[] getSpine(Random src){
boolean[] spine = new boolean[7]; 
for(int b = 0; b < spine.length; b++)
  {
  float mapped = map(src.nextInt()/1e7, -255, 255, -0.5, 0.5);
  spine[b] = ( mapped >= 0) ? true:false;
  }
return spine;  
}
