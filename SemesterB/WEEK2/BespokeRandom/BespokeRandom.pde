/*

BESPOKE RANDOM

an alternative to java.util.Random

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

import java.util.Random;

int seed = 12345;

void setup(){
  
   size(700, 280);
   
   for(int n = 0; n < 600; n++){
    
       double sin = Math.sin(seed++)*50.0;
       line(50 + n, height/4, 50 + n, height/4 + (float)sin);
       
       double random = sin - Math.floor(sin);
       line(50 + n, height/2, 50 + n, height/2 + (float)random*100.0);
     
   }
  
}
