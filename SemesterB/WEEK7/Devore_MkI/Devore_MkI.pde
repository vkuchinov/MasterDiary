/*

 DEVORE CA
 Taken from Golly

 John Devore, in his 1973 masters thesis, tweaked Codd's rules to 
 greatly reduce the size of Codd's design, to the extent that it 
 could be implemented in the computers of that time.
 
 !!!!!!!!!!!!!!!!
 
 John Devore altered Codd's ruleset to allow for more compact 
 machines. The main difference between Devore's and Codd's 
 cellular automata is that Devore's allows 2x2 blocks of cells to 
 behave like split devices, merge units or one-way diodes. 
 
 With this rule, a much simpler crossing can be created.
 
 !!!!!!!!!!!!!!!!
 
 8 STATES
 symmetry: rotations
 computation- & construction- universal
 self-reproducing machine size: 94,794 cells
 
 dark grey 0x3F3F3F     empty
 green     0x00DE00     wall
 
 blue      0x0433FF     wire
 
 white     0xFFFFFF     head 1
 red       0xFF2600     head 2
 yellow    0xFFFB00     head 3
 
 
 COLOURS
 1 blue
 2 green
 3 yellow
 4 cyan
 5 magenta
 6 red
 7 white
 
 */

String[] rules;

PImage map;

static int pixelSize = 8;
//static int sceneWidth = 16;
//static int sceneHeight = 5;

ArrayList <Block> blocks;

void setup() {

  frameRate(90);

  rules = loadStrings("rules.txt");
  
  map = loadImage("discriminator.png");

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


