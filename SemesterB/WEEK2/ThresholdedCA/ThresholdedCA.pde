/*

Thresholded CA [Conway's Game of Life]*
on a random generated field + lifetime feature

predetermined by java.util.Random seed

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

final int NUM_CELLS = 3200;
ArrayList<Node> nodes = new ArrayList();

Random seed = new Random(4949);

void setup(){
  
  size(800, 800);
  //frameRate(12);
  
  for(int n = 0; n < NUM_CELLS; n++){
     nodes.add(new Node(n, 20 + seed.nextInt(760), 20 + seed.nextInt(760)));
  }

  setScene(256, 0.1);
  
}

void draw(){
  
  background(0);
  
  for(int n = 0; n < NUM_CELLS; n++){
     nodes.get(n).update();
  }
  
  for(int n = 0; n < NUM_CELLS; n++){
     nodes.get(n).draw();
  }
  
  filter(BLUR, 4);
  filter(POSTERIZE, 5);

}

void setScene(int num_, float perc_){
  
  for(int n = 0; n < nodes.size(); n++){
     nodes.get(n).setNeighbours();
  }
  
  HashMap<Integer, Float> all = new HashMap<Integer, Float>();
  for(int n = 0; n < nodes.size(); n++){
    all.put(nodes.get(n).id, new PVector(width/2, height/2).dist(nodes.get(n).location));
  }
  
  int[] selected = sortByValue(all, num_);
  shuffleArray(selected);
  
  for(int s = 0; s < floor(selected.length * perc_); s++){
      nodes.get(selected[s]).alive = true;
  }
 
}

void shuffleArray(int[] array) {

  for (int i = array.length; i > 1; i--) {
 
    int j = seed.nextInt(i);  

    int tmp = array[j];
    array[j] = array[i-1];
    array[i-1] = tmp;
  }
}
