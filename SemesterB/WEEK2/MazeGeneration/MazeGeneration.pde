/*

GENERATING MAZE
[Depth-First Search]

This algorithm is a randomized version of the depth-first search algorithm. 
Frequently implemented with a stack, this approach is one of the simplest ways 
to generate a maze using a computer. Consider the space for a maze being a large 
grid of cells (like a large chess board), each cell starting with four walls. 

Starting from a random cell, the computer then selects a random neighbouring cell 
that has not yet been visited. The computer removes the wall between the two cells 
and marks the new cell as visited, and adds it to the stack to facilitate backtracking. 

The computer continues this process, with a cell that has no unvisited neighbours being 
considered a dead-end. When at a dead-end it backtracks through the path until it reaches 
a cell with an unvisited neighbour, continuing the path generation by visiting this new, 
unvisited cell (creating a new junction). This process continues until every cell has 
been visited, causing the computer to backtrack all the way back to the beginning cell. 

We can be sure every cell is visited.

REFERENCES:
https://en.wikipedia.org/wiki/Maze_generation_algorithm#Depth-first_search
https://en.wikipedia.org/wiki/Prim%27s_algorithm
https://rosettacode.org/wiki/Maze_generation

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int path = 5, wall = 1;      
int w = 32, h = 24 ;

boolean[][] map = new boolean[h * 2][w * 2];
ArrayList<int[]> route = new ArrayList<int[]>();

void setup(){
  
   size(w * 2 * 4, h * 2 * 4);
   noStroke();
   
   int x = w / 2; 
   int y = h / 2;
   
   int offset = path / 2 + wall;
   
   for(int  i = 0; i < h * 2; i++){
    for(int j = 0; j < w * 2; j++){
      map[i][j] = false;
    }
   }
   
   map[y * 2][x * 2] = true;
   route.add(new int[]{x, y});
   
   loop();
  
}

void loop(){
  
    int x = route.get(route.size() - 1)[0];
    int y = route.get(route.size() - 1)[1];
  
    int[][] directions = new int[][]{new int[]{1, 0}, new int[]{-1, 0}, new int[]{0, 1},new int[]{0, -1}};
    ArrayList<int[]> alternatives = new ArrayList<int[]>();
    
    for(int i = 0 ; i < directions.length; i++){
      
        int dy = (directions[i][1] + y) * 2;
        int dx = (directions[i][0] + x) * 2;
        
        if(dy < 0) dy = 0;
        if(dx < 0) dx = 0;
      
        if(dy > h * 2 - 1) dy = h * 2 - 2;
        if(dx > w * 2 - 1) dx = w * 2 - 2;

        if((dy > -1 && dy < h * 2 - 1) && map[dy][dx] == false){
          
            alternatives.add(directions[i]);
        }
  
    }
    
    if(alternatives.size() == 0){
      
      route.remove(route.size() - 1);
      if(route.size() > 0){ loop(); }
      return;
    
    }
    
    int[] direction = alternatives.get(floor(random(1.0) * alternatives.size()));
    route.add(new int[]{direction[0] + x, direction[1] + y});
    map[(direction[1] + y) * 2][(direction[0] + x) * 2] = true;
    map[direction[1] + y * 2][direction[0] + x * 2] = true;
    loop();

}

void draw(){
  
    for(int  i = 0; i < h * 2; i++){
      for(int j = 0; j < w * 2; j++){
      
      fill(255);
      if(map[i][j] == false) { fill(0); }
      rect(j * 4, i * 4, 4, 4);
      
    }
   }
  
}

