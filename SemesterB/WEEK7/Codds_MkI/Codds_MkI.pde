/*

  CODD SIGNALS TEST
 
  Codd's cellular automaton is a cellular automaton (CA) devised by 
  the British computer scientist Edgar F. Codd in 1968. 
  
  It was designed to recreate the computation- and construction-universality 
  of von Neumann's CA but with fewer states: 8 instead of 29.
  
  
  CA  number of states  symmetries  computation- and construction-universal  size of self-reproducing machine
  von Neumann      29    none  yes  130,622 cells
  Codd              8    rotations  yes  283,126,588 cells
  Devore            8    rotations  yes  94,794 cells
  Banks-IV          4    rotations  and reflections  yes  unknown
  Langton's loops   8    rotations  no  86 cells

  http://en.wikipedia.org/wiki/Codd%27s_cellular_automaton
  
  A simple configuration in Codd's cellular automaton. Signals pass along wire made of cells in state 
  1. BLUE: sheathed by cells in state 
  2. RED: Two signal trains circulate around a loop and are duplicated at a T-junction onto 
     an open-ended section of wire. The first (7-0) causes the sheathed end of the wire to 
     become exposed. The second (6-0) re-sheathes the exposed end, leaving the wire one cell 
     longer than before.
     
 CA  number of states  symmetries  computation- and construction-universal  size of self-reproducing machine
 von Neumann     29  none       yes  130,622 cells
 Codd             8  rotations  yes  283,126,588 cells[5]
 Devore           8  rotations  yes  94,794 cells
 Banks-IV         4  rotations and reflections  yes  unknown
 Langton's loops  8  rotations  no  86 cells
 
 PDF PAPER:
 http://www.sq3.org.uk/papers/Hutton_CoddsSelfReplicatingComputer_2010.pdf
 http://sourceforge.net/p/golly/code/ci/master/tree/Rules/Codd.rule
 
 empty       0x3F3F3F     -12632257
 wall        0xFF2600     -55808
 
 blue        0x0433FF     -16501761
 cyan        0x00FDFF     -16712193
 magenta     0xFF40FF     -48897
 green       0x00F900     -16713472
 white       0xFFFFFF     -1
 yellow      0xFFFB00     -1280

Further readings:
http://en.wikipedia.org/wiki/Byl%27s_loop

 */

String[] rules;
PImage map;

static int pixelSize = 8;
//static int sceneWidth = 16;
//static int sceneHeight = 5;

ArrayList <Block> blocks;

void setup() {

  frameRate(30);

  rules = loadStrings("rules.txt");
  
  map = loadImage("test2.png");

  size( pixelSize*map.width/pixelSize, pixelSize*map.height/pixelSize, "processing.core.PGraphicsRetina2D" );
  strokeWeight(0.5);
  stroke(128);

  blocks = new ArrayList();
  //building grid
  for (int y = 0; y < map.height/pixelSize; y++) {
    for (int x = 0; x < map.width/pixelSize; x++) {

      int init = map.get(x*pixelSize, y*pixelSize);

      Block newKidOnTheBlock = new Block(x*pixelSize, y*pixelSize, init);
      
      //setting margins
      if(x < 2 || y < 2 || x > map.width/pixelSize -3 || y > map.height/pixelSize - 3) { newKidOnTheBlock.margins = true; }
      
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


