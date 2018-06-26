/*

SIMPLEX NOISE [2D]

Simplex noise is a method for constructing an n-dimensional noise function 
comparable to Perlin noise ("classic" noise) but with FEWER DIRECTIONAL 
ARTIFACTS and, in higher dimensions, A LOWER COMPUTATIONAL OVERHEAD. 

Ken Perlin designed the algorithm in 2001 to address the limitations of 
his classic noise function, especially in higher dimensions.

REFERENCES:
https://en.wikipedia.org/wiki/Simplex_noise
https://en.wikipedia.org/wiki/OpenSimplex_noise

https://en.wikipedia.org/wiki/Hypercubic_honeycomb

http://lencinhaus.github.io/canvas-noise/#seed=noize&color=greyscale&independent=false&gradientStart=ff0000&gradientEnd=00ff00&noiseFunction=simplex&smoothing=quintic&scale=75&size=256&octaves=1&persistence=0.5&lacunarity=2&octaveFunction=absolute&customOctaveFunction=return+n%3B&sumFunction=modular&customSumFunction=return+n%3B&sineFrequencyCoeff=1&modularAmplitude=5

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Simplex noise;

void setup(){
  
   size(512, 512); 
   noise = new Simplex(12345);
  
}
