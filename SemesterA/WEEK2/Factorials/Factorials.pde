/*

FACTORIALS
for combinatorics & permutations

n! is the product of all non-negative integers from 1 to n

Task:

There are 7  hamsters and 7 cells. How many combinations we could have?
The answer is 7! or 5040 variations.

n!! is double factorial — a product of non-negative integers from 1 to n,
but not all, just integers with the same type of n (odd/even)

Sf(n) is a super-factorial, is a product of all factorials from all integers from 1 to n

REFERENCES:
https://en.wikipedia.org/wiki/Factorial
https://en.wikipedia.org/wiki/Factorial#/media/File:Factorial05.jpg

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

void setup(){
  
  size(800, 500);
  println(factorial(10));
  println(doubleFactorial(10));
  println(superFactorial(5));
  
  complexArgumentAmplitude();
  
}

long factorial(int n_){
  
  long output = 1;
 
  for(int i = 2; i <= n_; i++){
    
    output *= i;
    
  }
  
  return output;
}

long doubleFactorial(int n_){
  
  long output = 1;
 
  for(int i = 2; i <= n_; i++){
    
    if(n_ % 2 == i % 2) { output *= i; }
    
  }
  
  return output;
}

long superFactorial(int n_){
  
  long output = 1;
  
  for(int i = 2; i <= n_; i++){
    
    output *= factorial(i);
    
  }
  return output;
  
}

void complexArgumentAmplitude(){
  
  pushMatrix();
  translate(width/2, height/2);
  
  //x: -3, 3, y: -2, 2
  //x: 1/eⁿ, y:  ϕ {-PI, PI}

}
