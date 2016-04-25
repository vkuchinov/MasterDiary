class Substrate{
    
      final int MAX_NUM = 32;
      int num = 0;
     
      int[] grid;
      Crack[] cracks;

      Substrate(){
        
          grid = new int[width * height];
          cracks = new Crack[MAX_NUM];
        
      }
      
      void build() {
      
          for (int y = 0; y < height; y++){
             for (int x = 0; x < width; x++) structure.grid[y * width + x] = 10001;
          }
      
          for (int k = 0; k < 16; k++){
          int i = int(seed.nextInt(width * height - 1));
          structure.grid[i]=int(seed.nextInt(3600) / 10.0);
          }
          
          num = 0;
          for (int k = 0; k < 3; k++) addCrack(0);
          background(0);
          
      }

      void addCrack(int level_) { if(num < MAX_NUM) { cracks[num] = new Crack(level_); num++; } }
      void render(){ for (int n = 0; n < num; n++) { cracks[n].grow(); } }
  
}
