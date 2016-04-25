/*

 Technology Pattern Sketch
 by Vladimir V. Kuchinov
 
 */

import java.util.Random;

color backColor = color(208, 30, 55);
color drawColor = color(255);

int margins = 40;

static int NUM_COLS = 64;
static int NUM_ROWS = 32;

Cluster[] grid = new Cluster[NUM_COLS * NUM_ROWS];
ArrayList <Jumper> joints;

void setup() {

  size(800, 800, "processing.core.PGraphicsRetina2D");
  hint(ENABLE_RETINA_PIXELS);
  background(backColor);
  //smooth();

  float radius = (width - 2f*margins)/(2f*NUM_COLS - 1);

  println("circle radius is", radius);

  Random randSeed = new Random(65645); 

  for (int y = 0; y < NUM_ROWS; y++) {
    for (int x = 0; x < NUM_COLS; x++) {

      int instance = randSeed.nextInt(3);

      grid[y*NUM_COLS + x] = new Cluster(y*NUM_COLS + x, margins + 2f*radius*x, height - margins - 2f*radius*y, radius, instance);
      grid[y*NUM_COLS + x].draw();
    }
  }

  //building horizintal joints
  int jointStart = 0;
  int jointLength = 0;

  for (int y = 0; y < NUM_ROWS; y++) {
    for (int x = 0; x < NUM_COLS; x++) {
      if (grid[y*NUM_COLS + x].state == 0 || grid[y*NUM_COLS + x].state == 1 ) { 

        if (jointLength > 2) { 

          int instance = randSeed.nextInt(2);
          if (instance != 0) {
            int posX = (jointStart)%NUM_COLS;
            int posY = floor((jointStart)/NUM_COLS);
            Jumper newJoint = new Jumper(0, margins + 2f*radius*posX - radius/2, height - margins - 2f*radius*posY - radius/2, jointLength, radius, 0); 
            newJoint.draw();
          }
        }
        jointStart = 0; 
        jointLength = 0;
      }
      if (jointLength == 0 && grid[y*NUM_COLS + x].state == 2) { 
        jointStart = y*NUM_COLS + x; 
        jointLength++;
      }
      if (jointLength > 0 && grid[y*NUM_COLS + x].state == 2) { 
        jointLength++;
      }
    }
    jointLength = 0; 
    jointStart = 0;
  }
}

void draw() {
}

