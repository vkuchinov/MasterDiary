/*
HEAVISIDE STEP FUNCTION θ, uppercased theta
[unit step function]

    SIMPLEST DEFINITION
    θ(x) := d / d max { x, 0 }
    
    
    INTEGRAL DEFINITION [DIRAC DELTA FUNCTION]
    
            ⎧x
    θ(x) := ⎥    δ(s)ds
            ⎭-∞

    Nowadays, it used in neural network algorithms.
    
REFERENCES:
https://en.wikipedia.org/wiki/Heaviside_step_function

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Heaviside step;

void setup(){
  
  size(500, 500, "processing.core.PGraphicsRetina2D");
  background(255);
  
  step = new Heaviside(0);
  
  println(step.get());
  
  
}
