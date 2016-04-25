/*

 Art Pattern Sketch
 by Vladimir V. Kuchinov
 
 */

import java.util.Random;

color backColor = color(200, 158, 0);
color drawColor = color(255);

int margins = 40;

static int NUM_COLS = 1;
static int NUM_ROWS = 9;

Cluster[] grid = new Cluster[NUM_COLS * NUM_ROWS];

void setup() {

  size(800, 800, "processing.core.PGraphicsRetina2D");
  //hint(ENABLE_RETINA_PIXELS);
  background(backColor);
  //smooth();

  float radius = 10; //(width - 2f*margins)/(2f*NUM_COLS - 1);

  println("cluster radius is", radius);

  Random randSeed = new Random(46756); 

  for (int y = 0; y < NUM_ROWS; y++) {
    for (int x = 0; x < NUM_COLS; x++) {

      float instance = 2 + Math.round(randSeed.nextGaussian()* 4);
      float mult = 20 + randSeed.nextInt(300);
      float s = 0.25 + 0.25*randSeed.nextInt(8);
      int off = randSeed.nextInt(6);
      grid[y*NUM_COLS + x] = new Cluster(y*NUM_COLS + x, margins, height - margins - radius*y, radius, instance, mult, width - 2f*margins, s, off);
      grid[y*NUM_COLS + x].draw();
    }
  }

}

void draw() {
}

