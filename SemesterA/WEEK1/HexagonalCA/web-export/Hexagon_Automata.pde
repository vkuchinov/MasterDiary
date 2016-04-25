int rows = 120;
int cols = 120;
int cell_size = 5;
int margins = 20;
float shift = 2.5;

float speed = 6; //frames per second

Cell[][] grid = new Cell[cols][rows];
boolean[][] transitions = new boolean[cols][rows];

void setup() {
  size(640, 640); 
  smooth();
  frameRate(speed);
  //stroke(128);
  //strokeWeight(0.5);
  noStroke();

  //setup grid
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      grid[x][y] = new Cell(margins + shift + cell_size*x, margins + cell_size*y, false);
      grid[x][y].update();
      transitions[x][y] = false;
    }
  if(y%2 == 1) shift = 2.5; else shift = 0;
  }
  
  //initial  random pattern within canvas
  for(int c = 0; c < random(96, 128); c++)
    {
    int randomX = int(random(44, 76));
    int randomY = int(random(44, 76));
    
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
       
      if(grid[x][y].status == false && aliveNeighbors == 3) transitions[x][y] = true;
      if(grid[x][y].status == true && aliveNeighbors >= 5) transitions[x][y] = false;
      if(grid[x][y].status ==true && aliveNeighbors <= 1) transitions[x][y] = false;
     
      }
    }
  }
  
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      
      if(grid[x][y].status) grid[x][y].resurections++;
      grid[x][y].status = transitions[x][y];
      grid[x][y].update();
   }
  }
} 


class Cell { 
  float ypos, speed, xpos; 
  boolean status;
  
  int resurections;
  
  //add age limit
  //int age = random(20, 40);

  Cell (float x, float y, boolean stat) {  
    ypos = y;  
    xpos = x;
    status = stat;

  } 
  void update() { 

    if (status) { colorMode(HSB); fill(resurections, 255, 255, 128); }
    else fill(255); 
    polygon(6, xpos, ypos, 3);
  }
} 

void polygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)),
      cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}

