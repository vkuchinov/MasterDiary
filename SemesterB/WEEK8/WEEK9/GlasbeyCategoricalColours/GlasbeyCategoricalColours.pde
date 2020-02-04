/*

CATEGORICAL COLOURS [glasbey algorithm]

A method, proposed by Chris Glasbey, for identifying a set of 
colours for displaying 2D and 3D categorical images when the 
categories are unordered labels. The principle is to find maximally 
distinct sets of colours. We either generate colours sequentially, 
to maximize the dissimilarity or distance between a new colour 
and the set of colours already chosen, or use a simulated annealing 
algorithm to find a set of colours of specified size.

The results from the Glasbey algorithm depend on two factors: 

1. The initial starting set of colors, and the color space used. 
2. The default color space is the full CIELAB gamut, which results 
in colors of all the different available saturations, 
brightnesses and hues.

CIE L*u*v

LUT [Look Up Table]

A LUT, or 'Look Up Table,' holds a set of numbers which are looked 
up by the software or hardware you are using in order to deliberately 
change the colours of an image. LUTs can be technical, creative 
(usually generated within software) or camera specific.


REFERENCE:
https://onlinelibrary.wiley.com/doi/abs/10.1002/col.20327
https://en.wikipedia.org/wiki/CIELAB_color_space

@author Vladimir V. KUCHINOV  
@email  helloworld@vkuchinov.co.uk

*/

Glasbey p = new Glasbey();
int dims = 16;
void setup(){
 
   size(768, 64);
   background(0);
  
   noStroke();
   for(int i = 0; i < 256; i++) { fill(p.getColor(i)); rect(i * 3, 0, 3, 64); }
//   int count = 0;
//   for(int y = 0; y < dims; y++){
//     for(int x = 0; x < dims; x++){
//       
//         float dx = 48 + x * 512/dims;
//         float dy = 48 + y * 512/dims;
//         
//         fill(p.r[count], p.g[count], p.b[count]);
//         ellipse(dx, dy, 24, 24);
//         count++;
//       
//     }
//   }
  
}
