/*

SUBSTRATE GROWTH
based on works of J. Tarbell 

The algorithm for substrate is:

      [1] draw some lines
      [2] choose some random points on those lines
      [3] draw lines perpendicular to the lines you drew

      Do it recursively.
     
     
KULER [Firenze]
#468966, #FFF0A5, #FFB03B, #B64926, #8E2800


REFERENCES:
https://en.wikipedia.org/wiki/Substrate_(biology)
http://www.basilsafwat.com/projects/processing.a4/
http://www.complexification.net/gallery/machines/substrate/

GRASSHOPPER
http://www.grasshopper3d.com/forum/topics/substrate-1

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

import java.util.Random;

PImage mask;

Substrate structure;

Random seed = new Random(12345);

void setup() {
  
  size(800, 800, "processing.core.PGraphicsRetina2D");
  smooth(8);
  
  mask = loadImage("mask.png");

  background(255);;
  
  structure = new Substrate();
  structure.build();  
  
}

void draw() {
  
  noFill();
  structure.render();
  
}




