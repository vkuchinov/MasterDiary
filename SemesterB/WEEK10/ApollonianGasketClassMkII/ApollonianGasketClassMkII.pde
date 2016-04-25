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

    D1 symmetry
    Whenever two of the largest five circles in the gasket have the same curvature, that gasket will have 
    D1 symmetry, which corresponds to a reflection along a diameter of the bounding circle, with no 
    rotational symmetry.
    
    D2 symmetry
    If two different curvatures are repeated within the first five, the gasket will have D2 symmetry; 
    such a symmetry consists of two reflections (perpendicular to each other) along diameters of the bounding 
    circle, with a two-fold rotational symmetry of 180°. The gasket described by curvatures (−1, 2, 2, 3) is 
    the only Apollonian gasket (up to a scaling factor) to possess D2 symmetry.
    
    D3 symmetry
    There are no integer gaskets with D3 symmetry.
    
    {−1, 2, 2, 3}
    
       
REFERENCES:
https://en.wikipedia.org/wiki/Apollonian_gasket
http://demonstrations.wolfram.com/ApollonianGasket/
http://www.wikihow.com/Create-an-Apollonian-Gasket
http://paulbourke.net/papers/apollony/apollony.pdf
http://paulbourke.net/fractals/apollony/
http://stackoverflow.com/questions/22118029/recursively-create-apollonian-gaskets-with-solution
http://mathworld.wolfram.com/SoddyCircles.html
http://gogeometry.com/geometry/soddy_descartes_circles.htm
http://lsandig.org/blog/2014/08/apollon-python/en/
https://en.wikipedia.org/wiki/Kleinian_group

@auhtor   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

import processing.pdf.*;

//D1, −15, 32, 32, 33
Apollonian gasket;

int[][] rule = {{-2, 3, 6, 7}, {-3, 4, 12, 13}, {-8, 9, 72, 73}, {-9, 10, 90, 91}};


void setup(){
  
   size(800, 800, "processing.core.PGraphicsRetina2D");
   background(0);
   
   for(int r = 0; r < rule.length; r++){
   gasket = new Apollonian(new PVector(width/2, height/2), 4, rule[r]);
   gasket.build();
   }
  
}
