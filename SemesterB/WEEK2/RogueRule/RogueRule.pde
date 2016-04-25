/*

ROGUE RULE [Cellular Automata]

REFERENCES:
https://www.youtube.com/watch?v=lyZUzakG3bE
http://www.roguebasin.com/index.php?title=Cellular_Automata_Method_for_Generating_Random_Cave-Like_Levels

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

final int GRID = 128;
final int CELL = 3;

ArrayList <Cell> cells = new ArrayList();

void setup() {
  
  frameRate(20);
  
  size(GRID*CELL, GRID*CELL);

  int count = 0;
  
  for (int y = 0; y < GRID; y++) {
    for (int x = 0; x < GRID; x++) {
      
      //println(x, y);
      Cell newCell = new Cell(count, x, y, (int)random(128));
      cells.add(newCell);
      count++;
    }
  }
}

  
void draw() {

  for (int c = 0; c < cells.size (); c++) {
    Cell newCell = cells.get(c);
    newCell.update();
  }
  
  for (int c = 0; c < cells.size (); c++) {
    Cell newCell = cells.get(c);
    newCell.draw();
  }
  
  //filter(GRAY);
  filter(POSTERIZE, 8);
  filter(BLUR, 6);
}
