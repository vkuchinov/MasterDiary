/*

POLYNOMIAL INTERPOLATION
[polynomial regression fitting]

In mathematics, a polynomial is an expression consisting of variables (or indeterminates) 
and coefficients, that involves only the operations of addition, subtraction, multiplication, 
and non-negative integer exponents. An example of a polynomial of a single indeterminate 
x is x2 − 4x + 7. An example in three variables is x3 + 2xyz2 − yz + 1.

Polynomials appear in a wide variety of areas of mathematics and science. 
For example, they are used to form polynomial equations, which encode a wide range of problems, 
from elementary word problems to complicated problems in the sciences; they are used to define 
polynomial functions, which appear in settings ranging from basic chemistry and physics to 
economics and social science; they are used in calculus and numerical analysis to approximate 
other functions. In advanced mathematics, polynomials are used to construct polynomial rings 
and algebraic varieties, central concepts in algebra and algebraic geometry.

    quadratic
    y = a + b * x + c * x²              2nd order
    
    cubic
    y = a + b * x + c * x²  + d * x³    3rd order
    
    ....
    
    and so on...                      (n)th order
    
    EXAMPLE
    
    x = { 1, 2, 3, 4, 5 };
    y = { 1, 1.2, 3, 7, 7 };
    
    
    RESULTS:
    
    R²         0.9815
    aR²        0.926
    P          0.1726
    SE         0.8128
    F          17.69
    
    a          7.24          ±3.998
    b         -10.00476      ±5.226
    c          4.328571      ±1.94
    d         –0.4666667     ±0.2142
    
    y = 7.24 - 10.00476*x + 4.328571*x^2 - 0.4666667*x^3
    
REFERENCES:
https://en.wikipedia.org/wiki/Polynomial
https://en.wikipedia.org/wiki/Polynomial_interpolation
https://en.wikipedia.org/wiki/Newton_polynomial
https://math.okstate.edu/people/binegar/4513-F98/4513-l17.pdf
http://note.sonots.com/SciSoftware/NewtonInterpolation.html#c2ba5e59

https://mycurvefit.com/
https://ece.uwaterloo.ca/~dwharder/aads/Algorithms/Newton_polynomials/

D3.JS
https://bl.ocks.org/mbostock/4342190

NEWTON's ROOT
http://mathworld.wolfram.com/NewtonsMethod.html

https://rosettacode.org/wiki/Polynomial_regression

http://www.bragitoff.com/2015/09/c-program-for-polynomial-fit-least-squares/

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

static int LINEAR = 1;
static int PARABOLIC = 2;
static int CUBIC = 3;
static int QUARTIC = 4;
//...
                   
Polynomial interpolation;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
 
     size(600, 600, "processing.core.PGraphicsRetina2D"); 
     background(49);
     
     points.add(new PVector(1.0, 1.0));
     points.add(new PVector(2.0, 1.2));
     points.add(new PVector(3.0, 3.0));
     points.add(new PVector(4.0, 7.0));
     points.add(new PVector(5.0, 7.0));
     
     for(PVector p : points){
      
        stroke(0, 255, 255);
        strokeWeight(8);
        point(p.x, p.y);
       
     }
     
     interpolation = new Polynomial(points, 3);
  
}
