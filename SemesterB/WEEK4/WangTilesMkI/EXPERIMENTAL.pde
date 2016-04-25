/*

HEX ONE!!!

EXPERIMENTAL
based on HEXs

*/

class Experimental{

    String[] tilesURLs = { "ExperimentalA1.svg", "ExperimentalA2.svg", "ExperimentalA3.svg",
                           "ExperimentalB1.svg", "ExperimentalB2.svg", "ExperimentalB3.svg", 
                           "ExperimentalC1.svg", "ExperimentalC2.svg", "ExperimentalC3.svg"};
                          
    PShape[] tiles = new PShape[9];
    int[][] sidesData = { {0, 1, 0, 1}, {0, 1, 1, 0}, {1, 0, 0, 1}, 
                          {1, 0, 1, 0}, {0, 0, 0, 0}};
    
    int width_, height_;
    ExperimentalTile[][] grid;
    
    Experimental(int x_, int y_, float scale_, PVector offset_){
      
    width_ = x_; height_ = y_;
    
    for(int t = 0; t < 9; t++){
        tiles[t] = loadShape(tilesURLs[t]);
    }
    
    float yShift = 0.0;
    
    grid = new ExperimentalTile[x_][y_];
    
        for(int y = 0; y < y_; y++){
            for(int x = 0; x < x_; x++){
                if(y % 2 == 1) { yShift = 0.5 * 1.15 * scale_; } else { yShift = 0.0; }
                  int r = seed.nextInt(9);
                  shape(tiles[r], offset_.x + 1.15 * x * scale_ + yShift, offset_.y + y * scale_, scale_, scale_);
                  grid[x][y] = new ExperimentalTile(r, null);   
            }
        }
     
    }
    
    //change a given number of elements randomly
    void changeElements(int num_){
    
          for(int r = 0; r < num_; r++){
              grid[seed.nextInt(width_)][seed.nextInt(height_)].type *= -1;
          }
      
    }
     
    class ExperimentalTile{
     
        int type;
        int[] sides;
        
        ExperimentalTile(int type_, int[] sides_){
            type = type_;
            sides = sides_;
        } 
    }
}
