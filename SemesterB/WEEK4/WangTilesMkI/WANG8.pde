/*

Simple Wang Tiling with just set of 8 tiles and random distribution.
There is no any rules here, but should be actually...

Have to figure out it.

There are eight [8] tiles with two side types [0] and [1], which are not compatible 
between each other. [0]: false, [1]: true

Eight tiles have [1] types: 4 x top, 4 x right, 4 x bottom, 4 x left
                 [2] types: 4 x top, 4 x right, 4 x bottom, 4 x left
                 
So, I have to look to the left and top neighbour and match their sides:
      
                 [right]  for left neighbour
                 [bottom] for top member

                 T R B L
              A: 1 2 1 2
              B: 1 2 2 1
              C: 2 1 1 2
              D: 2 1 2 1
              E: 1 1 1 1
              F: 2 2 1 1
              G: 1 1 2 2
              H: 2 2 2 2 

*/

class Wang8{

    String[] tilesURLs = { "WANG8A.svg", "WANG8B.svg", "WANG8C.svg", "WANG8D.svg",
                           "WANG8E.svg", "WANG8F.svg", "WANG8G.svg", "WANG8H.svg" };
    
    int[][] sidesData = { {0, 1, 0, 1}, {0, 1, 1, 0}, {1, 0, 0, 1}, {1, 0, 1, 0},
                          {0, 0, 0, 0}, {1, 1, 0, 0}, {0, 0, 1, 1}, {1, 1, 1, 1}};
                          
    PShape[] tiles = new PShape[8];
    
    int width_, height_;
    Wang8Tile[][] grid;
    
    Wang8(int x_, int y_, float scale_, PVector offset_){
      
    width_ = x_; height_ = y_;
      
    for(int t = 0; t < 8; t++){
        tiles[t] = loadShape(tilesURLs[t]);
    }
    
    grid = new Wang8Tile[x_][y_];
    
    int r = 0; 
    
        for(int y = 0; y < y_; y++){
            for(int x = 0; x < x_; x++){
                    boolean matched = false;
                    if(x > 0 && y > 0){
                        while(!matched){
                            r = seed.nextInt(8);
                            int[] currentSides = sidesData[r];
                            grid[x][y] = new Wang8Tile(r, currentSides);
                            if(grid[x - 1][y].sides[1] == currentSides[3] && grid[x][y - 1].sides[2] == currentSides[0]) { matched = true; }
                        }
                        shape(tiles[r], offset_.x + x * scale_, offset_.y + y * scale_, scale_, scale_); 
                    }
                    else if(x != 0 && y == 0){
                            while(!matched){
                            r = seed.nextInt(8);
                            int[] currentSides = sidesData[r];
                            grid[x][y] = new Wang8Tile(r, currentSides);
                            if(grid[x - 1][y].sides[1] == currentSides[3]) { matched = true; }
                        }
                        shape(tiles[r], offset_.x + x * scale_, offset_.y + y * scale_, scale_, scale_);
                    }
                    else if(x == 0 && y != 0){
                            while(!matched){
                            r = seed.nextInt(8);
                            int[] currentSides = sidesData[r];
                            grid[x][y] = new Wang8Tile(r, currentSides);
                            if(grid[x][y - 1].sides[2] == currentSides[0]) { matched = true; }
                        }
                        shape(tiles[r], offset_.x + x * scale_, offset_.y + y * scale_, scale_, scale_);
                    }
                    else{
                            r = seed.nextInt(8);
                            int[] currentSides = sidesData[r];
                            shape(tiles[r], offset_.x + x * scale_, offset_.y + y * scale_, scale_, scale_); 
                            grid[x][y] = new Wang8Tile(r, currentSides); 
                    }
            }
        }
    }
    
    //change a given number of elements randomly
    void changeElements(int num_){
    
          for(int r = 0; r < num_; r++){
              grid[seed.nextInt(width_)][seed.nextInt(height_)].type *= -1;
          }
      
    }
     
    class Wang8Tile{
     
        int type;
        int[] sides;
        
        Wang8Tile(int type_, int[] sides_){
            type = type_;
            sides = sides_;
        } 
    }
}
