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

import java.util.Arrays;
import java.util.Random;

Multiscale pattern;
int count = 0;
int n = 400;
Random seed = new Random(1234567);

void setup(){
  
   size(400, 400); 

   pattern = new Multiscale(
     
       1, 
       new ArrayList<Turing>(
 
           Arrays.asList(
         
               new Turing(new PVector(50, 50), new PVector(100, 100), 1, 0.025),
               new Turing(new PVector(25, 25), new PVector(50, 50), 1, 0.04)
               //new Turing(new PVector(5, 5), new PVector(10, 10), 1, 0.03)
               //new Turing(new PVector(2, 2), new PVector(5, 5), 1, 0.02)
               //new Turing(new PVector(1, 1), new PVector(2, 2), 1, 0.01)
         
           )
       )
       
   );

}

void draw(){
 
    if(count < 64) pattern.next();
    pattern.draw();
    count++;
    
}
