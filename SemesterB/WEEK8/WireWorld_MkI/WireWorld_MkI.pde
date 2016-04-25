/*

 WIREWORLD DIODE TEST
 http://en.wikipedia.org/wiki/Wireworld
 
 based on Moore Neighborhood or Moor graph
 http://en.wikipedia.org/wiki/Moore_neighborhood
 http://en.wikipedia.org/wiki/Moore_graph
 
 FACTS:
 
 Wireworld is Turing-complete.
 First proposed by Brian Silverman in 1987, as part of his program Phantom Fish Tank.
 
 As in all cellular automata, time proceeds in discrete steps called generations 
 (sometimes "gens" or "ticks"). Cells behave as follows:
 
 Empty → Empty
 Electron head → Electron tail
 Electron tail → Conductor
 Conductor → Electron head if exactly one or two of the neighbouring cells 
 are electron heads, or remains Conductor otherwise.
 
 0x000000 empty       -16777216
 0xFFD700 conductor   -10496
 0x0080FF head        -16744193
 0xFF4000 tail        -49152
 
 DO I NEED EMITTER?
 
 0xFFFFFF emitter?    -1 invisible
 
 with BitWise operators appplication
 
 WIREWORLD EXTENDABLE: REPLICATION
 
 Previous Wireworld Extendable rules. WWE and WWE2 were created by 
 Alan Tennant and WWEJ and WWEJ2 by Mark Jeronimus. Unlike 
 the original WireWorld rule, these rules support universal 
 construction, replication and modification. Includes various 
 examples including a replicator by Adam P. Goucher.
 
 WWE3
 
 WWEJ3 by Mark Jeronimus and Alan Tennant, coded by Mark Jeronimus,
 contains all the functionality of old WWEs with none of 
 the compromises or bugs, and with only 18 states.
 
 WIREWORLD MARKED
 
 A marked version of WireWorld. It supports six extra wire colors 
 but no extra functionality. A marked version of the Quinapalus' 
 Primes Computer is included.  
 
 
 SWITCH CA
 
 WSwitch is a 5-state rule by Alan Tennant. The rule is loosly based 
 on WireWorld. The construction of logic gates is not possible directly. 
 Instead, 3 types of pulse dividers are possible.
 
 PARTICLES
 
 Particles is loosely based on Wireworld, with a few differences: Particles move through open 
 space instead of wires, and they can also collide to create, move, or remove blocks. 
 This means that a Particles system could reproduce itself. A rule by Joel Walker.
 
 BLOCKS AND WALLS
 
 A complex yet simple to use cellular automata that is based loosely off Particles. 
 A rule by Conrad Walden.
 
 FURTHER READINGS:
 
 http://psoup.math.wisc.edu/mcell/pow.html [Digital Inkbots]
 http://karlscherer.com/Wireworld.html
 https://reaktorplayer.wordpress.com/2011/03/19/golly-an-open-source-application-for-exploring-conways-game-of-life/
 hashlife?
 
 Parallel algorithms
 
 The Powder Toy
 
 Langton's Loops are visually richer...
 
 Devor, Codd, Banks are similar CA to WireWorld... In some ways...
 Mixing!!!!
 
 http://www.mathpuzzle.com/MAA/20-WireWorld/mathgames_05_24_04.htmlhttp://www.mathpuzzle.com/MAA/20-WireWorld/mathgames_05_24_04.html
 
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 https://code.google.com/p/ruletablerepository/wiki/TheRules#WireWorld_and_derivatives
 
 http://switchb.org/kpreid/2005/old-wireworld/
 
 @author Vladimir V. KUCHINOV
 @email  helloworld@vkuchinov.co.uk
 
 */

PImage map;

static int pixelSize = 8;
//static int sceneWidth = 16;
//static int sceneHeight = 5;

ArrayList <Block> blocks;

void setup() {

  frameRate(30);

  map = loadImage("wolfram110.png");

  size( pixelSize*map.width/pixelSize, pixelSize*map.height/pixelSize, "processing.core.PGraphicsRetina2D" );
  strokeWeight(0.5);
  stroke(168);

  blocks = new ArrayList();
  //building grid
  for (int y = 0; y < map.height/pixelSize; y++) {
    for (int x = 0; x < map.width/pixelSize; x++) {

      int init = map.get(x*pixelSize, y*pixelSize);

      Block newKidOnTheBlock = new Block(x*pixelSize, y*pixelSize, init);
      newKidOnTheBlock.draw();
      blocks.add(newKidOnTheBlock);
    }
  }

}

void draw() {

  int counter = 0;

  for(int y = 0; y < map.height/pixelSize; y++){
     for(int x = 0; x < map.width/pixelSize; x++){

  Block update = blocks.get(counter);
  update.change();
  counter++;

    }
  } 

  counter = 0;

  for (int y = 0; y < map.height/pixelSize; y++) {
    for (int x = 0; x < map.width/pixelSize; x++) {

      Block update2 = blocks.get(counter);
      update2.update();
      update2.draw();
      counter++;
    }
  }

}

class Block {

  PVector position;
  int state = 0;
  int updatedState;
  int index;

  boolean emitter = false;


  Block(int x, int y, int s) {

    position = new PVector(x, y); 
    if (s != -1 ) { 
      state = s;
    } else { 
      state = -10496; 
      emitter = true;
      println("emitter on");
    }
    updatedState = state;
  }

  private void draw() {

    //0x000000 empty       -16777216
    //0xFFD700 conductor   -10496
    //0x0080FF head        -16744193
    //0xFF4000 tail        -49152
    
    color c = color(255, 255, 255);
    if(state == -16777216 ) { c = color(255, 255, 255); }
    if(state == -10496 ) { c = color(22, 34, 46); }
    if(state == -16744193 ) { c = color(255, 255, 54); }
    if(state == -49152 ) { c = color(31, 160, 219); }
    
    fill(c); 
    rect(position.x, position.y, pixelSize, pixelSize);
  }

  private void update() {

    state = updatedState;
  }

  private void change() {

    //0x000000 empty       -16777216
    //0xFFD700 conductor   -10496
    //0x0080FF head        -16744193
    //0xFF4000 tail        -49152

    if ( state == -16777216 ) {
      updatedState = -16777216;
    } else {

      //println(state);

      if (state == -16744193) { 
        updatedState = -49152;
      }
      if (state == -49152 ) { 
        updatedState = -10496;
      }
      if (state == -10496 && emitter) { 
        updatedState = -16744193; 
        println("emitting");
      }

      if (state == -10496 && !emitter) {

        int heads = 0;

        Block W  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - 1));
        if (W.state ==  -16744193 ) heads++;
        Block E  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + 1));
        if (E.state ==  -16744193 ) heads++;
        Block N  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - map.width/pixelSize));
        if (N.state ==  -16744193 ) heads++;
        Block NW  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - map.width/pixelSize - 1));
        if (NW.state ==  -16744193 ) heads++;
        Block NE  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - map.width/pixelSize + 1));
        if (NE.state ==  -16744193 ) heads++;
        Block S  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + map.width/pixelSize));
        if (S.state ==  -16744193 ) heads++;
        Block SW  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + map.width/pixelSize - 1));
        if (SW.state ==  -16744193 ) heads++;
        Block SE  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + map.width/pixelSize + 1));
        if (SE.state ==  -16744193 ) heads++;

        if (heads == 1 || heads == 2) { 
          updatedState = -16744193;
        }
      }
    }
  }
  }

