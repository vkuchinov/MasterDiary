class Turmite{
    
    //0: white, 1: black
    PVector location = new PVector();
    int state, maxXY;
    
    //0: N, 1: E, 2: W, 4: S
    int dir = 0;
    PVector[] dirs = { new PVector(0, -1), new PVector(1, 0), new PVector(0, 1), new PVector(-1, 0)}; 
    
    //{a, b, c}, a: the new scene color, b: the direction, c: the new state of the turmite
    color[] colors = {color(255), color(0)};
    char[][][] rule = {{{'1', 'L',  '1'}, {'1', 'L', '1'}}, {{'1', 'R', '1'}, {'0', 'N', '0'}}};

    Turmite(int x_, int y_, int state_){
      
        state = state_;
        location.x = x_; location.y = y_;
        
        maxXY = 0;
      
    }
    
    void moveOn(PImage scene_){
      
        scene_.loadPixels();
        
        int currentSquare;
        //white: -1, black: -16777216
        if(scene_.get((int)this.location.x, (int)this.location.y) == -1) { currentSquare = 0; } else { currentSquare = 1; }
      
               char[] subrule = rule[state][currentSquare];
               //println("rule:", r, "square:", Character.getNumericValue(rule[r][0]), "turn:",rule[r][1], "state:", Character.getNumericValue(rule[r][2]));
               scene_.set((int)this.location.x, (int)this.location.y, colors[Character.getNumericValue(subrule[0])]);
               this.turn(subrule[1]);
               state = Character.getNumericValue(subrule[2]);
               this.location.add(dirs[dir]);
                          
        scene_.updatePixels();
        updateMax();
 
    }
    
    void updateMax(){
     
       int maxx = (int)abs(scene.width/2 - location.x); 
       int maxy = (int)abs(scene.height/2 - location.y); 
       
       if(max(maxx, maxy) > maxXY) maxXY = max(maxx, maxy);
      
    }
    
    void turn(char dir_){
       
        switch(dir_){
         
        case 'R': //left
        if(this.dir > 0) { this.dir -= 1; } else { this.dir = 3; }
        break;
        
        case 'L': //right
        if(this.dir < 3) { this.dir += 1; } else { this.dir = 0; }
        break;
        
        case 'U': //u-turn [180°]
        if(this.dir < 2) this.dir += 2; else { this.dir = this.dir % 2; }
        break;
        
        case 'N': //nothing [no rotation]
        break;
        }
     
    }
   
}
