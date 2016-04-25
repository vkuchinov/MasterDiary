/*

Modified Conway's Game of Life 3D with lifetime parameter

@auhtor Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int dimension = 60;
int cell_size = 8;
int margins = 100;

int maxage = 3; //2-4 is also good
float speed = 12; //frames per second

Cell[][][] grid = new Cell[dimension][dimension][dimension];
boolean[][][] transitions = new boolean[dimension][dimension][dimension];
import processing.opengl.*;

float theta = 0.01;

void setup() {
  
  size(750, 750, P3D); 
  frameRate(speed);
  translate(102, 102);
  lights();
  
  //float fov = PI/3;
  //float cameraZ = (height/2.0) / tan(fov/2.0);
  //perspective(fov, float(width)/float(height), cameraZ/10.0, cameraZ*10.0);

  //setup grid
  for(int z = 0; z < dimension; z++){
    for (int y = 0; y < dimension; y++) {
       for (int x = 0; x < dimension; x++) {
      grid[x][y][z] = new Cell(-dimension/2*cell_size + cell_size*x, -dimension/2*cell_size + cell_size*y, -dimension/2*cell_size + cell_size*z, false);
      grid[x][y][z].update();
      transitions[x][y][z] = false;
       }
     }
  }
 
 //initial  random pattern within centre 12x12
  for(int c = 0; c < random(128, 196); c++)
    {
    int randomX = int(random(25, 35));
    int randomY = int(random(25, 35));
    int randomZ = int(random(25, 35));
    
    grid[randomX][randomY][randomZ].status = true;
    grid[randomX][randomY][randomZ].update();
    transitions[randomX][randomY][randomZ] = true;
    
    }
  
}

void draw() { 

theta += 0.05;

background(32);
//camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
   
translate(width/2, height/2);
rotateY(0.25 * theta);
rotateX(-0.3 * theta);
rotateZ(0.02 * theta);

for (int z = 0; z < dimension; z++){
for (int y = 0; y < dimension; y++) {
    for (int x = 0; x < dimension; x++) {
      
      if(x >= 1 && y >= 1 && x < 59 && y < 59 && z >= 1 && z < 59)
      {
      int aliveNeighbors = 0;
      
      //int[][] neigbors = {{-1, -1}, {0, -1}, {1, -1}, {-1, 0}, {1, 0}, {-1, 1}, {0, 1}, {1, 1}}; 
      
      //check top neighbors
      if(grid[x-1][y-1][z-1].status) aliveNeighbors++;
      if(grid[x][y-1][z-1].status) aliveNeighbors++;
      if(grid[x+1][y-1][z-1].status) aliveNeighbors++;
      if(grid[x-1][y-1][z].status) aliveNeighbors++;
      if(grid[x][y-1][z].status) aliveNeighbors++;
      if(grid[x+1][y-1][z].status) aliveNeighbors++;
      if(grid[x-1][y-1][z+1].status) aliveNeighbors++;
      if(grid[x][y-1][z+1].status) aliveNeighbors++;
      if(grid[x+1][y-1][z+1].status) aliveNeighbors++;
      
      //check middle neigbors
      if(grid[x-1][y][z].status) aliveNeighbors++;
      if(grid[x+1][y][z].status) aliveNeighbors++;
      
      if(grid[x-1][y][z-1].status) aliveNeighbors++;
      if(grid[x][y][z-1].status) aliveNeighbors++;
      if(grid[x+1][y][z-1].status) aliveNeighbors++;
      
      if(grid[x-1][y][z+1].status) aliveNeighbors++;
      if(grid[x][y][z+1].status) aliveNeighbors++;
      if(grid[x+1][y][z+1].status) aliveNeighbors++;
      
      //check bottom neigbors
      if(grid[x-1][y+1][z+1].status) aliveNeighbors++;
      if(grid[x][y+1][z+1].status) aliveNeighbors++;
      if(grid[x+1][y+1][z+1].status) aliveNeighbors++;
      if(grid[x-1][y+1][z].status) aliveNeighbors++;
      if(grid[x][y+1][z].status) aliveNeighbors++;
      if(grid[x+1][y+1][z].status) aliveNeighbors++;
      if(grid[x-1][y+1][z-1].status) aliveNeighbors++;
      if(grid[x][y+1][z-1].status) aliveNeighbors++;
      if(grid[x+1][y+1][z-1].status) aliveNeighbors++;
       
      if(grid[x][y][z].status == false && aliveNeighbors == 5) transitions[x][y][z] = true;
      if(grid[x][y][z].status == true && aliveNeighbors >= 6) transitions[x][y][z] = false;
      if(grid[x][y][z].status ==true && aliveNeighbors <= 2) transitions[x][y][z] = false;
     
      if(grid[x-1][y-1][z-1].status) grid[x-1][y-1][z-1].lifetime++;
      if(grid[x-1][y-1][z-1].lifetime > maxage) { transitions[x][y][z] = false; grid[x-1][y-1][z-1].lifetime = 0; grid[x-1][y-1][z-1].bornAndDead = 2; }
      }
    }
  }
}
  
    for(int z =0; z < dimension; z++)
  {
  for (int y = 0; y < dimension; y++) {
    for (int x = 0; x < dimension; x++) {
      
      grid[x][y][z].status = transitions[x][y][z];
      grid[x][y][z].update();
   }
  }
  }

} 


class Cell { 
  float xpos, ypos, zpos; 
  boolean status;
  int lifetime;
  int bornAndDead = 0;
  int spirit = 64;
  
  Cell (float x, float y, float z, boolean stat) {  
    ypos = y;  
    xpos = x;
    zpos = z;
    status = stat;
  } 
  void update() { 

    if(bornAndDead == 0 || bornAndDead == 1 ) {
    //println(zpos);
    colorMode(HSB);
    if (status) { fill(map(zpos, -240, 240, 0, 96) + int(random(-30, 30)), 255, 255);}
    else { noFill(); noStroke(); }
    pushMatrix();
    translate(xpos, ypos, zpos);
    box(5, 5, 5);
    popMatrix();
    }
    
    else
    
    {
   
    //println(zpos);
    colorMode(HSB);
    noFill();
    stroke(128, spirit);
    strokeWeight(0.25);
    pushMatrix();
    translate(xpos, ypos, zpos);
    box(5, 5, 5);
    popMatrix();
    if(spirit > 5) spirit--;
    }
    
  }
} 

