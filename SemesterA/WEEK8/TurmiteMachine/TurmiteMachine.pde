/*

Turmite: termite + Turing 

http://en.wikipedia.org/wiki/Turmite

In computer science, a turmite is a Turing machine which has 
an orientation as well as a current state and a "tape" that 
consists of an infinite two-dimensional grid of cells. 
The terms turmite and vturmite are also used. Langton's turmite is 
a well-known type of turmite defined on the cells of 
a square grid. Paterson's worms are a type of turmite 
defined on the edges of an isometric grid.

SPECIFICATION

The following specification is specific to turmites on a two-dimensional 
square grid, the most studied type of turmite. Turmites on other grids 
can be specified in a similar fashion. As with Langton's turmite, turmites 
perform the following operations each timestep:


    [1] turn on the spot (by some multiple of 90°)
    [2] change the color of the square
    [3] move forward one square.
    
As with Turing machines, the actions are specified by a state transition table 
listing the current internal state of the turmite and the color of the cell it 
is currently standing on. For example, the turmite shown in the image at the top 
of this page is specified by the following table:

                      current color
                      [scene]
                      write  turn  next    write  turn  next
    current state
    [turmite] 
                0     1      R     0       1      R     1
                1     0      N     0       1      N     0
                
    The direction to turn is one of L (90° left), R (90° right), N (no turn) 
    and U (180° U-turn).


http://en.wikipedia.org/wiki/Paterson%27s_worms
http://www.mathpuzzle.com/MAA/01-Paterson%27s%20Worms/mathgames_10_24_03.html
http://en.wikipedia.org/wiki/Busy_beaver
http://mathworld.wolfram.com/Turmite.html [!!!!!]

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

final int MAX_STEPS = 51200;

PImage scene;
int count = 0;

Turmite turmite;

//zoom
int[][] zoom = {{-6000, 12800, 20}, {-2800, 6400, 40},  {-1200, 3200, 80}, {-400, 1600, 200}, {0, 800, 800}};
int level = 0;

void setup(){
  
  size(800, 800);
  noSmooth();
  
  //initializing scene
  scene = createImage(800, 800, RGB);
  reset(scene);
  
  //set turmite
  turmite = new Turmite((int)scene.width/2, (int)scene.height/2, 0);

  
}

void draw(){
  
  if(turmite.maxXY > zoom[level][2] && level < 5) level++;
  image(scene, zoom[level][0], zoom[level][0], zoom[level][1], zoom[level][1]);
  turmite.moveOn(scene);

  count++;
  if(count > MAX_STEPS) noLoop();
  
  println(turmite.maxXY);

}

void reset(PImage scene_){
  
  for(int y = 0; y < scene.height; y++){
      for(int x = 0; x < scene.width; x++){
          scene_.set(x, y, color(255));
      }  
  } 

}
