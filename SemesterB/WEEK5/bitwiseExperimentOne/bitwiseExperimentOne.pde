/*

BITWISE EXPERIMENT ONE

    & (bitwise AND)
    | (bitwise OR)
    ~ (bitwise NOT)
    ^ (bitwise XOR)
    << (bitwise left shift)
    >> (bitwise right shift)
    >>> (bitwise unsigned right shift)
    &= (bitwise AND assignment)
    |= (bitwise OR assignment)
    ^= (bitwise XOR assignment)
    <<= (bitwise left shift and assignment)
    >>= (bitwise right shift and assignment)
    >>>= (bitwise unsigned right shift and assignment)
    
REFERENCES:
https://en.wikipedia.org/wiki/Bitwise_operation
https://docs.oracle.com/javase/tutorial/java/nutsandbolts/op3.html


@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/


void setup(){
  
size(800, 800);
noStroke();
background(0);
fill(255);

for(int y = 0; y < height; y++){
   for(int x = 0; x < width; x++){ 
  
   //int currentX = int(log(x>>3)); right
   int currentX = int(x>>3);
   int currentY = int(y>>4);
   
   int composite = int(sin((x>>2)^(y>>2))*97);
   float a;
   
   a = int(composite%2 == 0); //a = 1; else a = 0;

   if( a == 0) rect(x,y, 1, 1);
     
   }
  }
  
  save("screenshot.png");
  
}
