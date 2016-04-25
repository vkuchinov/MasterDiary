/*

APOLLONIAN GASKET
with extended parameters and Soddy's algorithm [based on Descartes theorem]

In mathematics, an Apollonian gasket or Apollonian net is a fractal generated from 
triples of circles, where each circle is tangent to the other two. 
It is named after Greek mathematician Apollonius of Perga.

An Apollonian gasket can be constructed as follows. Start with three circles C1, C2 and C3, 
each one of which is tangent to the other two (in the general construction, these three 
circles can be any size, as long as they have common tangents). Apollonius discovered that 
there are two other non-intersecting circles, C4 and C5, which have the property that 
they are tangent to all three of the original circles – these are called Apollonian 
circles (see Descartes' theorem). Adding the two Apollonian circles to the original three, 
we now have five circles.
       
REFERENCES:
https://en.wikipedia.org/wiki/Apollonian_gasket
http://demonstrations.wolfram.com/ApollonianGasket/
http://www.wikihow.com/Create-an-Apollonian-Gasket
http://paulbourke.net/papers/apollony/apollony.pdf
http://paulbourke.net/fractals/apollony/
http://stackoverflow.com/questions/22118029/recursively-create-apollonian-gaskets-with-solution
http://mathworld.wolfram.com/SoddyCircles.html
http://gogeometry.com/geometry/soddy_descartes_circles.htm


@auhtor   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

//D1, −15, 32, 32, 33
Apollonian gasket;

void setup(){
  
   size(800, 800, "processing.core.PGraphicsRetina2D");
   background(0);
   
   gasket = new Apollonian(new PVector(width/2, height/2), 5, "D1", -15, 32, 32, 33);
   gasket.build();
  
}
