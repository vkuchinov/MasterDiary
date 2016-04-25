/*
Gray-Scott Model [Algorithm]
[known as Reaction-Diffusion system]

REFERENCES:
https://en.wikipedia.org/wiki/Reaction%E2%80%93diffusion_system
https://pmneila.github.io/jsexp/grayscott/

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

double diffU;
double diffV;
double paramF;
double paramK;
 
boolean randomSettings = true;

final int GRID_SIZE = 312;
final int SKIP = 48;

PImage grid;

double[][] U = new double[GRID_SIZE][GRID_SIZE];
double[][] V = new double[GRID_SIZE][GRID_SIZE];
 
double[][] dU = new double[GRID_SIZE][GRID_SIZE];
double[][] dV = new double[GRID_SIZE][GRID_SIZE];
 
int[][] offset = new int[GRID_SIZE][2];
 

void setup() {
  
   size(750, 750);
   colorMode(HSB, 1.0);
    
   diffU = 0.16;
   diffV = 0.08;
   paramF = 0.035;
   paramK = 0.06;
    
   settingModel();
   settingOffsets();
   
   grid = createImage(GRID_SIZE, GRID_SIZE, HSB);
   
   
}
 
void draw(){

  background(1.0);
  
    for (int g = 0; g < SKIP; g++) {
       nextGeneration(paramF, paramK, diffU, diffV);
    }
    
    for (int i = 0; i < GRID_SIZE; i++) {
      for (int j = 0; j < GRID_SIZE; j++) {
        grid.set(i, j, color(1.0, (float)(1 - U[i][j]), 1.0));
      }
    }
    
  image(grid, 0, 0, 750, 750);
}
 

