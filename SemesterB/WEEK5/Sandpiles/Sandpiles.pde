/*

 SANDPILES

 based on chapter from "Algorithms", 4th edition.
 Excellent alternative to random generator.
 
 GRID:        64 x 64
 STARTING #:  ~12 400
 
 @author Vladimir V. KUCHINOV
 @email  helloworld@vkuchinov.co.uk
 
 */

static int pixelSize = 4;
static int dim = 128;

static int drops = 1;

ArrayList <Grain> sand;
int counter = 0;
void setup() {

  size(dim*pixelSize, dim*pixelSize, "processing.core.PGraphicsRetina2D");

  strokeWeight(0.5);
  stroke(200);

  sand = new ArrayList();

  for (int y = 0; y < dim; y++) {
    for (int x = 0; x < dim; x++) {

      Grain g = new Grain(y*dim + x, x*pixelSize, y*pixelSize, 0);
      g.draw(false);
      sand.add((Grain) g);
    }
  }

  for (int d = 0; d < 75000; d++) {

    Grain updateGrain = sand.get(int(random(pow(dim, 2))));
    updateGrain.inits();
  }
}

void draw() {

  for (int y = 0; y < dim; y++) {
    for (int x = 0; x < dim; x++) {

      Grain g = sand.get(y*dim + x);
      g.draw(false);
    }
  }

  for (int d = 0; d < drops; d++) {

    Grain updateGrain = sand.get(int(random(pow(dim, 2))));
    updateGrain.update(false);
  }
  println(counter);
  counter++;
}

class Grain {

  int index;
  PVector pos;
  int state;

  Grain (int i, int x, int y, int s) {

    index = i;
    pos = new PVector( x, y);
    state = s;
  } 

  void update(boolean t) {

    if (state < 5) { 
      state++;
      draw(t);
    } else
    {

      draw(true);
      state = 0;

      //neighbors
      if ( index - 1 >=0 && index - 1 < sand.size() ) { 
        Grain W = sand.get(index - 1);
        W.update(true);
      }
      if ( index - 1 >=0 && index + 1 < sand.size() ) {
        Grain E = sand.get(index + 1);
        E.update(true);
      }
      if ( index - dim >=0 && index - dim < sand.size() ) { 
        Grain N = sand.get(index - dim);
        N.update(true);
      }
      if ( index + dim >=0 && index + dim < sand.size() ) { 
        Grain S = sand.get(index + dim);
        S.update(true);
      }
    }
  }

  void inits() {

    state++;
  }

  void draw(boolean a) {

    strokeWeight(0.5);
    stroke(200);
    //fill(48*state);
    color c;
    if (a) { 
      c = color(0, 255, 0);
    } else { 
      c = color(0);
    }
    fill(c);
    rect(pos.x, pos.y, pixelSize, pixelSize);
  }
}

