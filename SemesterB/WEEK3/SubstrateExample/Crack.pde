class Crack {
  
      color[] colors = {color(70, 137, 102),
                        color(255, 240, 165),
                        color(255, 176, 79),
                        color(182, 73, 38),
                        color(142, 40, 0)};
                        
                     
      int c;
      
      int level = 0;  //level
      float x0, y0;   //start
      float x1, y1;   //end
      float theta;    // direction
      
      float strokeWidth;
      
      Crack() {
      
          strokeWidth = random(0.25, 2.5);
          setOrigin();
          c = seed.nextInt(5);
      
      }
      
      Crack(int level_) {
      
          strokeWidth = random(0.25, 2.5);
          level = level_;
          setOrigin();
          c = seed.nextInt(5);
      
      }
      
      void setOrigin() {
      
      int px = 0;
      int py = 0;
      
      boolean found = false;
      int timeout = 0;
      
      while ((!found) || (timeout++>1000)){
        
            px = int(seed.nextInt(width));
            py = int(seed.nextInt(height));
            if(structure.grid[py * width + px] < 10000) found = true;
            
      }
      
            if(found){
      
            int a = structure.grid[py * width + px];
            
            if(seed.nextInt(100) < 50){ a -= 90 + int(-2 + seed.nextInt(4)); }
            else { a += 90 + int(-2 + seed.nextInt(4)); }
            
            startCrack(px,py,a);
            
            } 
      }
       
      void startCrack(int x_, int y_, int theta_) {
        
            x0 = x_; x1 = x_;
            y0 = y_; y1 = y_;
            
            theta = theta_ % 360;
            x1 += 0.61 * cos(radians(theta));
            y1 += 0.61 * sin(radians(theta));  
      }
       
      void grow() {
       
            x1 += 0.42 * cos(radians(theta));
            y1 += 0.42 * sin(radians(theta)); 
             
            int z = 66;
            int cx = int(x1 + seed.nextInt(z * 2) / 100);  
            int cy = int(y1 + seed.nextInt(z * 2) / 100);
            
            if(red(mask.get((int)x0, (int)y0)) == 0){
            stroke(colors[c]);
            strokeWeight(strokeWidth);
            line(x0, y0, x1, y1);
            }
            
            if (red(mask.get(cx, cy)) == 0) {
            
            if ((structure.grid[cy*width+cx] > 10000) || (abs(structure.grid[cy * width + cx] - theta) < 5)) {
            
            structure.grid[cy * width + cx]= int(theta);
            } else if (abs(structure.grid[cy * width + cx] - theta) > 2) {
            
            setOrigin();
            structure.addCrack(this.level + 1);
            }
            } else {
            
            setOrigin();
            structure.addCrack(this.level + 1);
            }
            
      }

}
