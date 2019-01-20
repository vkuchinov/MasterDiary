/*

MACHINE EPSILON ε or [EPS]

Machine epsilon gives an upper bound on the relative error due to 
rounding in floating point arithmetic. This value characterizes 
computer arithmetic in the field of numerical analysis, and by 
extension in the subject of computational science. 

For float variable EPS is equal to 1.19e-07

0.5 ULP <= 1.0 EPS <= 1.0 ULP

ULP [Units in Last Place] — another method of evaluating 
relative error due rounding in floating point.

As long as JAVA has ULP in its math tools, Processing was 
inherited the same system, however machine epsilon could be 
set manually.

All these things could be used to calculate percentage of
relative error. 

READINGS:
https://en.wikipedia.org/wiki/Machine_epsilon


@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.lang.Math;

void setup(){
  
  //println(Math.ulp(1.0));
 
  float zero = 1.0/5.0 + 1.0/5.0 - 1.0/10.0 - 1.0/10.0 - 1.0/10.0 - 1.0/10.0; //it should be zero
  println("zero is:", nf(zero, 1, 16));
  println("Using standard method: ", Float.compare(zero, 0.0));
  println("Using bespoke function: ", isEqual(zero, 0.0));
  
}

boolean isEqual(float f1_, float f2_) {
  
        //final double epsilon = Math.ulp(1.0); //returns true
        final double epsilon = Math.ulp(0.2);   //returns false
        return f1_ == f2_ ? true : Math.abs(f1_ - f2_) < epsilon;
}
    
