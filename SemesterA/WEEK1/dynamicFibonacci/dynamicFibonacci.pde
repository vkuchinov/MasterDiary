/*

DYNAMIC CODING [FIBONACCI SEQUENCE]

Classical recursion Fibonacci function has performance of 
Q^n or 1.5^n

It's very slow, even if we want to calculate n=32,
so you have to implement dynamic problem solving.

In this case, you have to store results in a array or
arrayList, or even HashMap or Dictionary to increase performance.

REFERENCE:
https://en.wikipedia.org/wiki/Dynamic_programminghttps://en.wikipedia.org/wiki/Dynamic_programming
https://www.youtube.com/watch?v=iKj-xI4enLw

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

void setup(){
  
    println(dynamicFibonacci(32));
  
}

int dynamicFibonacci(int n_){
  
    int fibs[] = new int[n_];
    fibs[0] = 0;
    fibs[1] = fibs[2] = 1;
    
    for(int i = 3; i < n_; i++){
     
       fibs[i] = fibs[i - 1] + fibs[i - 2]; 
      
    }
    return fibs[fibs.length - 1]; 
  
}



