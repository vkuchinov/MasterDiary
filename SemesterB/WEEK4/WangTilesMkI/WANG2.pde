/*

Simple Wang Tiling with just set of 2 tiles and random distribution.
There is no any rules here.

*/

class Wang2{

    String[] tilesURLs = { "WANG2A.svg", "WANG2B.svg" };
    PShape[] tiles = new PShape[2];
    
    int width_, height_;
    Wang2Tile[][] grid;
    
    Wang2(int x_, int y_, float scale_){
    
    width_ = x_; height_ = y_;
      
    tiles[0] = loadShape(tilesURLs[0]);
    tiles[1] = loadShape(tilesURLs[1]);
    
    grid = new Wang2Tile[x_][y_];
    
        for(int y = 0; y < y_; y++){
            for(int x = 0; x < x_; x++){
                if(seed.nextBoolean()){  
                    shape(tiles[0], x * scale_, y * scale_, scale_, scale_); 
                    grid[x][y] = new Wang2Tile(1); 
                }
                else{
                    shape(tiles[1], x * scale_, y * scale_, scale_, scale_); 
                    grid[x][y] = new Wang2Tile(-1);
                }
            }
        }
     
    }
    
    Wang2(int x_, int y_, float scale_, PVector offset_){
      
    width_ = x_; height_ = y_;
    
    tiles[0] = loadShape(tilesURLs[0]);
    tiles[1] = loadShape(tilesURLs[1]);
    
    grid = new Wang2Tile[x_][y_];
    
        for(int y = 0; y < y_; y++){
            for(int x = 0; x < x_; x++){
                if(seed.nextBoolean()) {  
                    shape(tiles[0], offset_.x + x * scale_, offset_.y + y * scale_, scale_, scale_);
                    grid[x][y] = new Wang2Tile(1);  
                }
                else{
                    shape(tiles[1], offset_.x + x * scale_, offset_.y + y * scale_, scale_, scale_); 
                    grid[x][y] = new Wang2Tile(-1); 
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
     
    class Wang2Tile{
     
        int type;
        
        Wang2Tile(int type_){
            type = type_;
        } 
    }
}
