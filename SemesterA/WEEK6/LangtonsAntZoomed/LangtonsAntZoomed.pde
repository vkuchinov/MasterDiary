/*

Langton's ant is a two-dimensional Turing machine with a very 
simple set of rules but complicated emergent behavior. 
It was invented by Chris Langton in 1986 and runs on a square 
lattice of black and white cells. The universality of Langton's 
ant was proven in 2000.[2] The idea has been generalized 
in several different ways, such as turmites which add more 
colors and more states.

Chris Langton:  an American computer scientist and one of 
the founders of the field of artificial life.
He coined the term in the late 1980s[2] when he organized the 
first "Workshop on the Synthesis and Simulation of Living Systems" 
(otherwise known as Artificial Life I) at 
the Los Alamos National Laboratory in 1987.

Rules:

At a white square, turn 90° right, flip the color of the square, move forward one unit
At a black square, turn 90° left, flip the color of the square, move forward one unit

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

PVector start, ant;
PImage scene;


char direction = 'R';

// zoom levels
int[] zoom = {5, 10, 20, 40, 80, 200, 400};
int level = 0;

void setup(){
size(800, 800);
scene = createImage(800, 800, RGB);

clearScene();

ant = new PVector(scene.width/2, scene.height/2, 0);
place(ant);

}

void draw(){

  background(0);
  
  color black = color(0, 0, 0);
  color white = color(255, 255, 255);
  //next move
  switch(direction){
  case 'L':
  ant.x += 1;
  if(IsItWhite(int(ant.x), int(ant.y))) { scene.set(int(ant.x), int(ant.y), black); direction = 'U'; }
                                   else { scene.set(int(ant.x), int(ant.y), white); direction = 'D'; } 
  break;
  case 'R':
  ant.x -= 1;
  if(IsItWhite(int(ant.x), int(ant.y))) { scene.set(int(ant.x), int(ant.y), black); direction = 'D'; }
                                   else { scene.set(int(ant.x), int(ant.y), white); direction = 'U'; }
  break;
  case 'U':
  ant.y -= 1;
  if(IsItWhite(int(ant.x), int(ant.y))) { scene.set(int(ant.x), int(ant.y), black); direction = 'R'; }
                                   else { scene.set(int(ant.x), int(ant.y), white); direction = 'L'; }
  break;
  case 'D':
  ant.y += 1;
  if(IsItWhite(int(ant.x), int(ant.y))) { scene.set(int(ant.x), int(ant.y), black); direction = 'L'; }
                                   else { scene.set(int(ant.x), int(ant.y), white); direction = 'R'; }
  break;  
    
  }

  if(abs(width/2 - ant.x) >= zoom[level] || abs(width/2 - ant.y) >= zoom[level]) if(level<zoom.length) level++;
 
  scene.updatePixels();
  image(renderZoom(scene, zoom[level]), 0, 0);

}

void clearScene(){
for(int y=0; y < scene.height; y++){
  for(int x=0; x < scene.width; x++){
  color white = color(255, 255, 255);
  scene.set(x, y, white);
  }  
} 
scene.updatePixels();
}

void place(PVector ant){
  
  color black = color(0, 0, 0);
  scene.set(int(ant.x), int(ant.y), black);
  scene.updatePixels();
  
}

boolean IsItWhite(int x, int y){
  
 color white = color(255, 255, 255);
 return (scene.get(x, y) == white);
 
}

PImage renderZoom(PImage src, int z){
  
PImage zoomed = createImage(src.width, src.height, RGB); 

int inc = src.width/ 2 / z; //in case of z=20(x2) inc = 40;

int countX = 0;
int countY = 0;

for(int y = src.height/2 - z; y < src.height/2 + z; y++){
  for(int x = src.width/2 - z; x < src.width/2 + z; x++){
    
        for(int yy = countY*inc; yy < countY*inc + inc; yy++){
          for(int xx = countX*inc; xx < countX*inc + inc; xx++){
          color c = src.get(x, y);
          zoomed.set(xx, yy, c);
          }
        }
 countX++;      
  }
 countX = 0;
 countY++;
} 
println(countX, countY);
zoomed.updatePixels();
return zoomed; 
}
