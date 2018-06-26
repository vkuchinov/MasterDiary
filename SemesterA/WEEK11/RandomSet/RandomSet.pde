/*

RANDOM SET

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Collections;

void setup(){
  
    Set random = new Set(256, new int[]{1, 2, 3, 4}, new float[]{ 0.625, 0.3, 0.05, 0.025 });
    println("ArrayList with given length");
    println(random.get());
    
    random = new Set(1056.0, new int[]{1, 2, 3, 4}, new float[]{ 0.625, 0.3, 0.05, 0.025 });
    println("ArrayList with n-elements with pre-defined sum");
    println(random.get());
  
}


