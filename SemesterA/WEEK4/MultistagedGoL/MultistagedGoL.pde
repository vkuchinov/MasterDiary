/*
Multi-stage Game of Life: 2,3 different algorithms changing frequently
Black & White algorithm together...

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int rows = 120;
int cols = 120;
int cell_size = 5;
int margins = 20;

float speed = 12; //frames per second

Cell[][] grid = new Cell[cols][rows];
boolean[][] transitions = new boolean[cols][rows];

int counter = 0;
int rules = 0;
int life = 50;

String caption = "set of rules #1: ";

void setup() {
  size(640, 640); 
  frameRate(speed);
  //stroke(128);
  //strokeWeight(0.5);
  noStroke();

  //setup grid
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      grid[x][y] = new Cell(margins + cell_size*x, margins + cell_size*y, false);
      grid[x][y].update();
      transitions[x][y] = false;
    }
  }
  
  //initial  random pattern within centre 12x12
  for(int c = 0; c < random(48, 96); c++)
    {
    int randomX = int(random(54, 66));
    int randomY = int(random(54, 66));
    
    grid[randomX][randomY].status = true;
    grid[randomX][randomY].update();
    transitions[randomX][randomY] = true;
    
    }
  
}

void draw() { 
  
   for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
      if(x >= 1 && y >= 1 && x < 119 && y < 119)
      {
      int aliveNeighbors = 0;
      
      //int[][] neigbors = {{-1, -1}, {0, -1}, {1, -1}, {-1, 0}, {1, 0}, {-1, 1}, {0, 1}, {1, 1}}; 
      
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
       
      //set of rules #1
      switch(rules){
      
      case 0:  
      if(grid[x][y].status == false && aliveNeighbors == 3) transitions[x][y] = true;
      if(grid[x][y].status == true && aliveNeighbors >= 4) transitions[x][y] = false;
      if(grid[x][y].status ==true && aliveNeighbors <= 1) transitions[x][y] = false;
      caption = "set of rules #1: ";
      life = 100;
      break;
      
      case 1:  
      if(grid[x][y].status == false && aliveNeighbors == 2) transitions[x][y] = true;
      if(grid[x][y].status == true && aliveNeighbors >= 6) transitions[x][y] = false;
      if(grid[x][y].status ==true && aliveNeighbors <= 1) transitions[x][y] = false;
      caption = "set of rules #2: ";
      life = 5;
      break;
      
      
      }
      }
    }
  }
  
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
      grid[x][y].status = transitions[x][y];
      grid[x][y].update();
   }
  }
  
  fill(0);
  text(caption + counter, 50, 50);
  
  if(counter != 0 && counter%life == 0) { if(rules == 0) { rules = 1; } else {rules = 0; }}
  counter++;
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

    if (status) if(rules == 0) { fill(0); } else { fill(255, 0, 255); }
    else fill(255);
    rect(xpos, ypos, cell_size, cell_size);
  }
} 

