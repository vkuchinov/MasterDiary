/*

Collatz Conjecture*
[hailstone numbers]

is a conjecture in mathematics named after Lothar Collatz, who first proposed it in 1937. 
The conjecture is also known as the 3n + 1 conjecture, the Ulam conjecture (after Stanisław Ulam), 
Kakutani's problem (after Shizuo Kakutani), the Thwaites conjecture (after Sir Bryan Thwaites), 
Hasse's algorithm (after Helmut Hasse), or the Syracuse problem;[1][2] the sequence of numbers involved 
is referred to as the hailstone sequence or hailstone numbers (because the values are usually subject to 
multiple descents and ascents like hailstones in a cloud),[3][4] or as wondrous numbers.

Basis for Hailstone Sequence and different pseudo-random numbers algorithms.

REFERENCES:
https://en.wikipedia.org/wiki/Collatz_conjecture

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

* this sketch has an additional version in JAVA/Processing built in Eclipse.

FURTHER READINGS:
http://maltego.blogspot.ru/2012/09/hailstone-sequences-visualized-in.html [Maltego Radium machines]


*/

//int n = 27;

final int MAX_NUMBERS = 5000;

void setup(){
  
 size(900, 500, "processing.core.PGraphicsRetina2D");
 background(32);
 
 stroke(255);
 strokeWeight(1.5);
         
 for(int i = 1; i < MAX_NUMBERS; i++){
   
    IntList current = hailstone(i);
    float max = max(current.array());
    float plotLength = current.size();
    
      for(int n = 0; n < current.size(); n++){

         point(map(i, 0, MAX_NUMBERS, 50, 850), height - 50 - map(current.get(n), 1, max, 0, plotLength) * 2.0);
        
      } 
   
 }

 
}

IntList hailstone( int n_ ){
 
   IntList sequence = new IntList();
   sequence.append(n_);
  
   while( n_ > 1 ) {

     n_ = n_ % 2 != 0 ? 3 * n_ + 1 : n_ / 2;
     sequence.append(n_);
     
   } 
  
  return sequence;
  
}

