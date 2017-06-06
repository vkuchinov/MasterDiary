/*

BUILDING CHAINS OUT OF INTEGER PAIRS

     [4, 3], [0, 1], [0, 4], [2, 3], [2, 1]
     
     to
     
     [0, 1], [1, 2], [2, 3], [3, 4], [4, 0]
     
     step 1: sorting min/max within every pair


For sorting 3D polygons and finding edges

SOLVE #1

Have to put all the pairs into a hashmap, i.e. for pair (a,b) put 
both (a,b) and (b,a) and start building sequence by getting 
a pair that has key = 0. 

Then just get and remove chaining pairs but removing both (a,b) 
and (b,a) afterwards.

SOLVE #2

To make a graph where numbers are vertices and pairs are edges.

Check whether Eulerian path exists (all vertex degrees are even 
(perhaps except for two vertices)) Yes/No

If yes, build Eulerian path


REFERENCES:
http://algs4.cs.princeton.edu/34hash/
https://en.wikipedia.org/wiki/Nearest-neighbor_chain_algorithm
https://en.wikipedia.org/wiki/Eulerian_path

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

HashMap<Integer, Integer> ab = new HashMap<Integer, Integer>();
HashMap<Integer, Integer> ba = new HashMap<Integer, Integer>();

void setup(){
  
     Pair[] pairs = { 
         
         new Pair(4, 3),
         new Pair(1, 0),
         new Pair(0, 4),
         new Pair(2, 3),
         new Pair(2, 1),
         
//         new Pair(8, 9),
//         new Pair(11, 10),
//         new Pair(9, 10),
//         new Pair(12, 8),
//         new Pair(12, 11) 
     
     };
     
     Pair[] sorted = new Pair[10];
     
     for(Pair p : pairs) { ab.put(p.a, p.b); ba.put(p.b, p.a); println(p.a, p.b); }
     
     println(ab);
     println(ba);
     
//     Integer[] ab_array = ab.keySet().toArray(new Integer[0]);
//     Integer[] ba_array = ba.keySet().toArray(new Integer[0]);
//     
//     for(int i = 0; i < 8; i++){
//     sorted[i] = new Pair(ab_array[i], ba_array[i]); 
//     }
//
//     sorted[8] = new Pair(99, 99); 
//     sorted[9] = new Pair(99, 99); 
//
//     for(Pair p : sorted) { p.display(); }
  
}
