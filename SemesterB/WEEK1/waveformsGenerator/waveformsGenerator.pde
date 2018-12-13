/*

WAVEFORM GENERATOR

a : an amplitude
omega (w) : the angular frequency
phi (p) : a phase

SINE: a * cos(2*PI*omega + phase);

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float a = 32.0;
float omega = 16.0;

void setup(){
  
   size(800, 600); 
   
   for(float x = 50; x <= 750; x += 0.01){
     
      //sine
      float y = 50 + a * cos(x / omega);
      point(x, y);
      
      //square
      y = 150 + -a;
      if(x % a > a / 2 && x % a != 0) y = 150 + a;
      point(x, y);
      
      //triangle
      y = 250 + x%a*2;
      point(x, y);
      
      //sawtooth
      y = 350 + x%a*2;
      point(x, y);
     
   }
  
  
}
