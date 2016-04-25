/*

HEX ONE!!!

Simple Wang Tiling with just set of 5 tiles and random distribution with a little rule.
Dimensions ratio 1.0 : 0.866
Radius between centers is 0.433

    bottom: 0, top: 1, straight: 2

         1  2  3  4  5  6
         
    A:   
    B:
    C:
    D:
    E:

*/

class Wang5HEX{

    String[] tilesURLs = { "WANG5HEXA.svg", "WANG5HEXB.svg", "WANG5HEXC.svg", 
                           "WANG5HEXD.svg", "WANG5HEXE.svg" };
                           
    PShape[] tiles = new PShape[5];
    int[][] sidesData = { {0, 1, 0, 1}, {0, 1, 1, 0}, {1, 0, 0, 1}, 
                          {1, 0, 1, 0}, {0, 0, 0, 0}};
    
    int width_, height_;
    Wang5HEXTile[][] grid;
    
    Wang5HEX(int x_, int y_, float scale_, PVector offset_){
      
    width_ = x_; height_ = y_;
    
    for(int t = 0; t < 5; t++){
        tiles[t] = loadShape(tilesURLs[t]);
    }
    
    float yShift = 0.0;
    
    grid = new Wang5HEXTile[x_][y_];
    
        for(int y = 0; y < y_; y++){
            for(int x = 0; x < x_; x++){
                if(y % 2 == 1) { yShift = 0.5 * 1.15 * scale_; } else { yShift = 0.0; }
                  int r = seed.nextInt(5);
                  shape(tiles[r], offset_.x + 1.15 * x * scale_ + yShift, offset_.y + y * scale_, scale_, scale_);
                  grid[x][y] = new Wang5HEXTile(r, null);   
            }
        }
     
    }
    
    //change a given number of elements randomly
    void changeElements(int num_){
    
          for(int r = 0; r < num_; r++){
              grid[seed.nextInt(width_)][seed.nextInt(height_)].type *= -1;
          }
      
    }
     
    class Wang5HEXTile{
     
        int type;
        int[] sides;
        
        Wang5HEXTile(int type_, int[] sides_){
            type = type_;
            sides = sides_;
        } 
    }
}
