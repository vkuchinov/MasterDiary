int rows = 120;
int cols = 120;
int cell_size = 5;
int margins = 20;

Cell[][] grid = new Cell[cols][rows];
boolean[][] transitions = new boolean[cols][rows];

void setup() {
  size(640, 640, "processing.core.PGraphicsRetina2D"); 
  frameRate(12);
  stroke(128);
  strokeWeight(0.5);

  //setup grid
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      grid[x][y] = new Cell(margins + cell_size*x, margins + cell_size*y, false);
      grid[x][y].update();
      transitions[x][y] = true;
    }
  }
  
  //initial pattern
  grid[60][58].status = true; grid[60][58].update(); transitions[60][58] = true;
  grid[60][59].status = true; grid[60][59].update(); transitions[60][59] = true;
  grid[60][60].status = true; grid[60][60].update(); transitions[60][60] = true;
  grid[61][60].status = true; grid[61][60].update(); transitions[61][60] = true;
  grid[62][60].status = true; grid[62][60].update(); transitions[62][60] = true;
  
}

void draw() { 
  
   for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
      // >= 1 > > 1
      if(x >= 1 && y >= 1 && x < 119 && y < 119)
      {
      int aliveNeighbors = 0;
      
      //check top neighbors
      if(grid[x-1][y-1].status) aliveNeighbors++;
      if(grid[x][y-1].status) aliveNeighbors++;
      if(grid[x+1][y-1].status) aliveNeighbors++;
      
      //check middle neigbors
      if(grid[x-1][y].status) aliveNeighbors++;
      if(grid[x+1][y].status) aliveNeighbors++;
      
      //check bottom neigbors
      if(grid[x-1][y+1].status) aliveNeighbors++;
      if(grid[x][y+1].status) aliveNeighbors++;
      if(grid[x+1][y+1].status) aliveNeighbors++;
       
      if(grid[x][y].status == false && aliveNeighbors == 3) transitions[x][y] = true;
      if(grid[x][y].status == true && aliveNeighbors >= 4) transitions[x][y] = false;
      if(grid[x][y].status ==true && aliveNeighbors <= 1) transitions[x][y] = false;
     
      }
    }
  }
  
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
      grid[x][y].status = transitions[x][y];
      grid[x][y].update();
   }
  }
} 


class Cell { 
  float ypos, speed, xpos; 
  boolean status;

  Cell (float x, float y, boolean stat) {  
    ypos = y;  
    xpos = x;
    status = stat;
  } 
  void update() { 

    if (status) fill(0); 
    else fill(255);
    rect(xpos, ypos, cell_size, cell_size);
  }
} 

