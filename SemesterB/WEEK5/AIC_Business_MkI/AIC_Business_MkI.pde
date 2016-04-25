/*

 Business Pattern Sketch
 by Vladimir V. Kuchinov
 
 Sine wave:
 
 A = cos(2*PI*f*t + theta)
 
 */

import java.util.Random;

color backColor = color(0, 155, 65);
color drawColor = color(255);

int margins = 40;

static int NUM_COLS = 96;
static int NUM_ROWS = 4;

Cluster[] grid = new Cluster[NUM_COLS * NUM_ROWS];

void setup() {

  size(800, 800, "processing.core.PGraphicsRetina2D");
  //hint(ENABLE_RETINA_PIXELS);
  background(backColor);
  //smooth();

  float radius = (width - 2f*margins)/(2f*NUM_COLS - 1);

  println("cluster radius is", radius);

  Random randSeed = new Random(4949); 

  int shift = 6;
  
  for (int y = 0; y < NUM_ROWS; y++) {
    for (int x = 0; x < NUM_COLS; x++) {

      float instance = Math.round(randSeed.nextGaussian()*15);
      float mult = 0.75 + 0.05*randSeed.nextInt(20);

      grid[y*NUM_COLS + x] = new Cluster(y*NUM_COLS + x, margins + 2f*radius*x, height - margins - 2f*radius*y*12, radius, shift, mult);
      grid[y*NUM_COLS + x].draw();
      //if((y*NUM_COLS + x )% 2 == 0 ) shift *= -1;
    }
    shift *= -1;
  }

}

void draw() {
}

