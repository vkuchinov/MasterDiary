/*

SORTING CHAINED INTEGER PAIRS

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

import java.util.Map;
import java.util.Map.Entry;


Map<Integer, Pair> pairs = new HashMap<Integer, Pair>();
Map<Integer, Boolean> used = new HashMap<Integer, Boolean>();

ArrayList<ArrayList> chains = new ArrayList<ArrayList>();
int counter = 0;

void setup(){
  
      Integer[][] inputs = { {3, 7}, {6, 7}, {8, 5}, {2, 6}, {4, 2}, {0, 5}, {3, 4}, {8, 1}, {0, 1} };
   
      for(int i = 0; i < inputs.length; i++){
        
          int a = inputs[i][0]; int b = inputs[i][1];
        
          if(pairs.get(a) == null) { pairs.put(a, new Pair(b, 0)); }
          else { pairs.put(a, new Pair( pairs.get(a).a,  b)); }
          
          if(pairs.get(b) == null) { pairs.put(b, new Pair(a, 0)); }
          else { pairs.put(b, new Pair( pairs.get(b).a,  a)); }
        
      }
      
      for(Entry<Integer, Pair> pair : pairs.entrySet()) { used.put(pair.getKey(), false); }
      
      chains.add(new ArrayList());
      
      for(Entry<Integer, Pair> pair : pairs.entrySet()) { 
      
      int R = pair.getValue().a;
     
          while(!used.get(R)){
           
                used.put(R, true);
                chains.get(counter).add(R);
                
                if(!used.get(pairs.get(R).a)) { R = pairs.get(R).a; }
                else { R = pairs.get(R).b; }
           
          }
      
      chains.add(new ArrayList());
      counter++;
    
      }
      
      cleanChains();
      println(chains);
  
}

void cleanChains(){
  
      ArrayList<Integer> toBeDeleted = new ArrayList();
      
      for(int i = 0; i < chains.size(); i++){
       
           if(chains.get(i).size() == 0) { toBeDeleted.add(i); } 
        
      }
      
      for (int i = 0; i < toBeDeleted.size(); i++){ chains.remove(toBeDeleted.get(i) - i); }
  
}

