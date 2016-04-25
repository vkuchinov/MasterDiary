/*

CHLADNI INTERFERENCE 
[Chladni plate interference surfaces]

Chladni plate interference surfaces are defined as positions where 
N harmonics cancel. Instead of restricting this to a line or plane 
as in classical Chladni's plate experiments, a rich set of surfaces 
result from having 3 orthogonal harmonics as follows:

cos(c1 * x) + cos(c2 * y) + cos(c3 * z) = 0

The basic experiment that is given the name "Chladni" consists of 
a plate or drum of some shape, possibly constrained at the edges 
or at a point in the center, and forced to vibrate historically 
with a violin bow or more recently with a speaker. A fine sand or 
powder is sprinkled on the surface and it is allowed to settle. 
It will do so at those parts of the surface that are not vibrating, 
namely at the nodes of vibration.

The equation for the zeros of the standing wave on a square Chladni 
plate (side length L) constrained at the center is given by the following.

cos(n pi x / L) cos(m pi y / L) - cos(m pi x / L) cos(n pi y / L) = 0

where n and m are integers. The Chladni patterns for n,m between 1 and 5 
are shown below, click on the image for a larger version or click on 
the "continuous" link for the standing wave amplitude maps. Note that 
the solution is uninteresting for n = m and the lower half of the table 
is the same as the upper half, namely (n1,m2) = (n2,m1).


REFERENCES:
http://paulbourke.net/geometry/chladni/

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

Chladni plate;

float noiseScale = 0.00005;

void setup(){
  
   size(600, 600);
   background(255); 
   
   plate = new Chladni(10.0, 3.2, width);

}

void draw(){
  
  background(255); 
  
  //noise
  float noiseVal = 16.0 * noise(millis()*noiseScale, second()*noiseScale);
  plate.updateN(noiseVal);
  plate.render();
  
}


