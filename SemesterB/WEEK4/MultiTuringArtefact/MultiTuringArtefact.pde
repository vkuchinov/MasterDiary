/*

MULTI-SCALE TURING PATTERSNS
[Cyclic Symmetric Multi-Scale Turing Patterns]

A different way of combining Turing patterns of multiple scales (rather than simply 
adding them together)is to switch between Turing instabilities of different scales 
at different time steps. In figure 7 below, for each pixel and at each time step 
a decision about what scale Turing instability to deploy is made based on
the amount of variation in the image around the pixel at that scale. 

The Turing instability of the scale withthe least variation “wins” and “fires”, 
increasing slightly the variation at that scale. The resulting image
has variation at multiple scales in a fractal-like manner, and strangely resembles 
an electron microscope image. 

Lighter areas appear raised, and darker areas recessed. The 3D shading effect is 
an accident of the purely 2D algorithm.

In figures 8 to 12 below a cyclic symmetry is imposed by averaging the concentrations 
of "activator" and “inhibitor” at each point with its counterpart points 

at 1/n, 2/n... (n-1) / n times 2π radians around the circle. 

There is an interesting juxtaposition of a strict symmetry and a complex organic 
looking surface.

The images are somewhat reminiscent of electron microscope pictures 
of diatoms.


REFERENCES:
see TuringPatterns sketch from previous week
http://www.jonathanmccabe.com/Cyclic_Symmetric_Multi-Scale_Turing_Patterns.pdf

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

MultiscaleTuring pattern;

void setup(){
  
   size(512, 512); 
   pattern = new MultiscaleTuring(2, 256, 256, 9, 2.8, 0.08, 0.25);
  
}

void draw(){
 
  pattern.next();
  pattern.draw(); 

}
