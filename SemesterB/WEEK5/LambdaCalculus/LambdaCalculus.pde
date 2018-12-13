/*

LAMBDA-CALCULUS [λ-calculus]

Lambda calculus (also written as λ-calculus) is a formal system in mathematical 
logic for expressing computation based on function abstraction and application 
using variable binding and substitution. 

It is a universal model of computation that can be used to simulate any 
Turing machine. It was first introduced by mathematician Alonzo Church 
in the 1930s as part of his research of the foundations of mathematics.

 [in] x -? functionA -> x + 1 [out]

 λx.x+1 where x is an input, x + 1 result
 
 [in1] x ->
              functionB -> x + y [out]
 [in2] y -> 
 
 λx.λy.x+y where x,y are inputs, x + y - the result.

 TRUE   λx.λy.x
 FALSE  λx.λy.y

 Y = λf.(λx.f(xx))(λx.f(xx));
 
 Y combinator [recursion], invented by Haskell B.  
 
 Examples:
 
 (λx.x+1) apply to 5, result 6
 
 
 variables, ways of building function, ways of applying function

 1. ANY computation could be encoded in λ-calculus notation 
 2. Basis for functional programming, like Haskell and etc.
 3. Now in most programming languages:
 
    any variable -> any function ...


Functions are pure and as 'black box', no internal state, like in Turing machines,
just pure function.


REFERENCES:
https://en.wikipedia.org/wiki/Lambda_calculus
http://pages.cs.wisc.edu/~horwitz/CS704-NOTES/1.LAMBDA-CALCULUS.html
https://www.ics.uci.edu/~lopes/teaching/inf212W12/readings/lambda-calculus-handout.pdf

UPDATED [2017]:
https://www.youtube.com/watch?v=eis11j_iGMs
Church-Turing hypothesis [function vs. state]


@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Lambda calculus;

void setup(){
  
   calculus = new Lambda();

}
