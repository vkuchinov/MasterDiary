/*

 BANKS DEMO TESTS
 
 READINGS:
 http://www.bottomlayer.com/bottom/banks/banks_thesis_1971.pdf
 http://www.bottomlayer.com/bottom/banks/banks_commentary.htm
 
 Rules description: http://www.bottomlayer.com/bottom/banks/banks_commentary_03.htm
 
 Inreversable CA
 
 dark grey   0x3F3F3F : empty   0 ZERO
 light grey  0xD2D2D2 : cluster
 red         0xFF2600 : active  1 ONE
 
 BANKS I [test01.png]
 Two-state, five-neighbor CA for a universal computer [Appendix I] [p. 54]
 
 Format: C,N,E,S,W,C
 n_states:      2
 neighborhood:  vonNeumann
 symmetries:    rotate4reflect
 
 111000
 011101
 011111

 BANKS II [test02.png]
 Three-state, five-neighbor CA for a universal computer [Appendix II] [p. 72]
 
 Format: C,N,E,S,W,C
 n_states:      3
 neighborhood:  vonNeumann
 symmetries:    rotate4reflect
 
 010002
 011122
 011202
 012002
 012022
 012222
 022201
 022222
 021012
 110002
 112220
 122200
 122000
 200001
 211120
 211221
 212221
 
 BANKS III [test03.png] 
 Two-state, nine-neighbor CA for a universal computer [Appendix III] [p. 80]
 
 NOTE: The rules listed in the thesis start at the corner, not 
 at N,S,E or W. We have converted them to Golly's format.
 
 Format: C,N,NE,E,SE,S,SW,W,NW,C
 n_states:      2
 neighborhood:  Moore
 symmetries:    rotate4reflect
 
 # transitions for signal propagation:
 1111111010
 1011000010
 0111010111
 0101000111
 # transitions for echo:
 0010000011
 0111010011
 0111110011
 1101010100
 1011000010
 1010000010
 0101010111
 1100000010
 0111110001
 1110100010
 0101000001
 0101010001
 1011010010
 0101010011
 # transitions for junction properties:
 0111111111
 0111111101
 1010011010
 1011001010
 0101010111
 1110110010
 1111101011
 0101010111
 1100011010
 1101101010
 1010100010
 0110110111
 0111011011
 0110111011
 
 BANKS IV [test04.png] 
 Four-state, five-neighbor universal constructor [Appendix IV] [p. 87]
 
 Format: C,N,E,S,W,C
 n_states:4
 neighborhood:vonNeumann
 symmetries:rotate4reflect
 031301
 132302
 231300
 013331
 310002
 220001
 120002
 123332
 211103
 213330
 233300
 311001
 122002
 211003
 310301
 100000
 130000
 011001
 310002
 020003
 200000
 012131
 010303
 033203
 020303
 023003
 013102
 230000
 033331
 331001
 113000
 121313
 313132
 230301
 133333
 130303
 011301
 321311
 133000
 013133
 011132
 320101
 113330
 133303
 123003
 120303
 021332
 020201
 120202
 210100
 213300
 210001
 213130
 320000
 223230
 010101
 
 */

PImage map;

static int pixelSize = 8;
//static int sceneWidth = 16;
//static int sceneHeight = 5;

ArrayList <Block> blocks;

void setup() {

  frameRate(3);

  map = loadImage("test01.png");

  size( pixelSize*map.width/pixelSize, pixelSize*map.height/pixelSize, "processing.core.PGraphicsRetina2D" );
  strokeWeight(0.5);
  stroke(128);

  blocks = new ArrayList();
  //building grid
  for (int y = 0; y < map.height/pixelSize; y++) {
    for (int x = 0; x < map.width/pixelSize; x++) {

      int init = map.get(x*pixelSize, y*pixelSize);

      boolean m = false;
      
      if(x < 2 || y < 2) { m = true; }
      if(x < 2 || y > map.height/pixelSize - 2) { m = true; }
      if(x > map.height/pixelSize - 2  || y < 2) { m = true; }
      if(x > map.height/pixelSize - 2 || y > map.height/pixelSize - 2) { m = true; }

      Block newKidOnTheBlock = new Block(x*pixelSize, y*pixelSize, init, m);
      newKidOnTheBlock.draw();
      blocks.add(newKidOnTheBlock);
    }
  }
}

void draw() {

  int counter = 0;

  for (int y = 0; y < map.height/pixelSize; y++) {
    for (int x = 0; x < map.width/pixelSize; x++) {

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

