/*

ROTATE ARRAYLIST

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

ArrayList<Integer> list = new ArrayList();

void setup() {

  for (int a = 0; a < 16; a++) {

    list.add((int)a);
  }

  println(list);
  
  Collections.rotate(list, -2);
  
  println(list);
  
}

