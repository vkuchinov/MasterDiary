/*

∑: SIGMA [a sum of all values in range of series]

∑ xi = x1 + x2 + ... + xn
  
SAMPLES:

   100
   ∑  i = 1 + 2 + 3 + ... + 100 = 5050;
   i=1
   
   6
   ∑ i² = 3² + 4² + 5² + 6² = 86
   i=3
   
REFERENCE:
https://en.wikipedia.org/wiki/Summation
https://en.wikipedia.org/wiki/Analytical_hierarchy
https://en.wikipedia.org/wiki/Polynomial_hierarchy

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

float sqrtSigma(int i_, int n_){
  
     float output = 0;
     
     for(int x = i_; x <= n_; x++){
           output += pow(x, 2);
     }
     
     return output;
  
}

float sigma(int i_, int n_){
  
     float output = 0;
     
     for(int x = i_; x <= n_; x++){
           output += x;
     }
     
     return output;
  
}

void setup(){
  
     println(sqrtSigma(3, 6));
     println(sigma(1, 100));

}
