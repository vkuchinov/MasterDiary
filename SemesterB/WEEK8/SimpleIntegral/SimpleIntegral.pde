/*

∫ INTEGRAL

In mathematics, an integral assigns numbers to functions in a way 
that can describe displacement, area, volume, and other concepts 
that arise by combining infinitesimal data. Integration is one of 
the two main operations of calculus, with its inverse, 
differentiation, being the other. Given a function f of 
a real variable x and an interval [a, b] of the real line, 
the definite integral.

    b
    ∫ f(x) dx
    a

∫:   SINGLE
∬:   DOUBLE
∭:  TRIPLE
∮:   CONTOUR
∱:   CLOCKWISE
⨑:   COUNTER-CLOCKWISE
∯:   CLOSED SURFACE
∰:  CLOSED VOLUME

REFERENCES:
[x] https://en.wikipedia.org/wiki/Integral_symbol
[x] https://en.wikipedia.org/wiki/Trapezoidal_rule
[-] https://en.wikipedia.org/wiki/Rectangle_method

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

//This algorithm calculates the definite integral of a function
//from 0 to 1, adaptively, by choosing smaller steps near
//problematic points.

float trapezoidal(float a_, float b_, float dx_){
  
      float area = 0.0;
      float n = (int)((b_ - a_) / dx_ );
    
      for(int i = 1; i < n + 1; i++){
        
            float x0 = a_ + (i - 1) * dx_;
            float x1 = a_ + i * dx_;
            
            float Ai = dx_ * (func(x0) + func(x1)) / 2.0;
            
            area += Ai;
            
      }
      return area;
      
}

float func(float value_){
  
    return -0.25*(float)Math.pow(value_,2.0) + value_ + 4.0;
    
}  
    
void setup(){
   
     println(trapezoidal(1.0, 5.0, 1)); 
  
}
