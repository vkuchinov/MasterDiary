/*

SUPERELLIPSE PATTERN
[known as well as Lamé curve, after Gabriel Lamé]

 |x/a|^r+|y/b|^r = 1 
 
 or
 
 x  =  a * cos^(2/r)t  
 y  =  b * sin^(2/r)t.
 
 a = b
 r = 1 //square
 r = 2 //circle
REFERENCES:
https://en.wikipedia.org/wiki/Superellipse
http://mathworld.wolfram.com/Superellipse.html
https://rosettacode.org/wiki/Superellipse

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int count = 0;

void setup(){
  
     size(600, 600, "processing.core.PGraphicsRetina2D");
     translate(width/2, height/2);
     
     for(float r = 2.0; r >= 1.0; r -= 0.08){
       
           float a, b;
           a = map(r, 2.0, 1.0, 250.0, 25.0);
           b = a;
           
           if(count % 2 == 0) { fill(0); } else { fill(255); }
           noStroke();
           
           beginShape();
           for(float t = -PI; t < PI; t += 0.01){
            
             //sin^n(x) is mathematically the same as (sin(x))^n...
   
             float x = pow(abs(cos(t)), 2.0 / r) * a * Math.signum(cos(t));
             float y = pow(abs(sin(t)), 2.0 / r) * b * Math.signum(sin(t));
             
             vertex(x, y);
             
           }
           endShape(CLOSE);
           
           count++;
     }

  
}
