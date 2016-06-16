class BZ{
  
      PImage bitmap;
      float [][][] a, b, c;
      int p = 0, q = 1;
  
      BZ(){
        
      colorMode(RGB, 1.0);
      
      bitmap = createImage(width, height, RGB);
      a = new float [width][height][2];
      b = new float [width][height][2];
      c = new float [width][height][2];
       
      for (int x = 0; x < width; x++) {
          for (int y = 0; y < height; y++) {
            
          a[x][y][p] = random(0.0,1.0);
          b[x][y][p] = random(0.0,1.0);
          c[x][y][p] = random(0.0,1.0);
          bitmap.set(x, y, color(a[x][y][p], b[x][y][p], c[x][y][p]));
      
          }
      }
  
      }
     
      void update(){
        
          for (int x = 0; x < width; x++){
              for (int y = 0; y < height; y++){
                
              float a1 = 0.0;
              float b1 = 0.0;
              float c1 = 0.0;
              
              for (int i = x - 1; i <= x+1; i++) {
                  for (int j = y - 1; j <= y+1; j++) {
                    
                  a1 += a[(i+width)%width][(j+height)%height][p];
                  b1 += b[(i+width)%width][(j+height)%height][p];
                  c1 += c[(i+width)%width][(j+height)%height][p];
                  
                  }
              }
          
              a1 /= 9.0;
              b1 /= 9.0;
              c1 /= 9.0;
              
              float mina = constrain(a1 + a1 * (1.2 * b1 - c1), 0, 1);
              float minb = constrain(b1 + b1 * (c1 - 1.2 * a1), 0, 1);
              float minc = constrain(c1 + c1 * (a1 - b1), 0, 1);
              
              float maxa = constrain(a1 + a1 * (b1 - c1), 0, 1);
              float maxb = constrain(b1 + b1 * (c1 - a1), 0, 1);
              float maxc = constrain(c1 + c1 * (a1 - b1), 0, 1);
  
              
              a[x][y][q] = map(mouseX, 0, width, mina, maxa);
              b[x][y][q] = map(mouseX, 0, width, minb, maxb);
              c[x][y][q] = map(mouseX, 0, width, minc, maxc);
      
              bitmap.set(x, y, color(a[x][y][q], b[x][y][p], c[x][y][p]));
              
              }
              
          }
          
          if (p == 0) { p = 1; q = 0; } else { p = 0; q = 1; }
        
      }
      
      void draw(){ image(bitmap, 0, 0); } 
  
}
