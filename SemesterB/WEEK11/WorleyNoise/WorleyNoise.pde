/*

WORLEY NOISE

Worley noise is a noise function introduced by Steven Worley in 1996. 
In computer graphics it is used to create procedural textures, that is 
textures that are created automatically in arbitrary precision and 
don't have to be drawn by hand. Worley noise comes close to simulating 
textures of stone, water, or cell noise.

Looks like Vorono diagram, cause it has the same math:
Noise Fn(x) is distance to nth-closest point to x.

Perlin noise is lattice based, while Worley—point based.
Both are gradient noises.


REFERENCES:
https://en.wikipedia.org/wiki/Worley_noise

@author Vladimir V KUCHINNOV  
@email  helloworld@vkuchinov.co.uk

*/

void setup(){
  
   size(512, 512)
    
  
}
