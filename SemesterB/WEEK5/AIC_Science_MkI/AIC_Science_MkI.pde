/*

 Science Pattern Sketch
 by Vladimir V. Kuchinov
 
 */

import java.util.Random;

color backColor = color(0, 30, 170);
color drawColor = color(255);

int margins = 40;

static int NUM_COLS = 64;
static int NUM_ROWS = 16;

Cluster[] grid = new Cluster[NUM_COLS * NUM_ROWS];

void setup() {

  size(800, 800, "processing.core.PGraphicsRetina2D");
  //hint(ENABLE_RETINA_PIXELS);
  background(backColor);
  //smooth();

  float radius = (width - 2f*margins)/(2f*NUM_COLS - 1);

  println("cluster radius is", radius);

  Random randSeed = new Random(4949); 

  for (int y = 0; y < NUM_ROWS; y++) {
    for (int x = 0; x < NUM_COLS; x++) {

      float instance = Math.round(randSeed.nextGaussian()*15);
      float mult = -3 + randSeed.nextInt(6);

      grid[y*NUM_COLS + x] = new Cluster(y*NUM_COLS + x, margins + 2f*radius*x, height - margins - 2f*radius*y*2, radius, instance, mult);
      grid[y*NUM_COLS + x].draw();
    }
  }

}

void draw() {
}

