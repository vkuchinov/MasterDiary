class Multiscale{
  
    float[][] F, buffer;
    int resolution;
    ArrayList<Turing> patterns;
    
    Multiscale(int resolution_, ArrayList<Turing> patterns_){
      
        patterns = patterns_;
        resolution = resolution_;
        
        F = new float[n][n];
        buffer = new float[n][n];
        
        for(int i = 0; i < n; i++){
          for(int j = 0; j < n; j++){
            
              F[i][j] = -1.0 + seed.nextFloat() * 2.0;
              buffer[i][j] = 0.0;
            
          }
        }
   
    }
    
    void next(){

        for(Turing p : patterns) { p.next(F, buffer); }
        update();

    }
    
    void update(){
      
        PVector minmax =  new PVector(10.0, -10.0);

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
              
                float bestVariation = patterns.get(0).variations[i][j];
                int bestLevel = 0;
        
                for (int k = 1; k < patterns.size(); k++) {
        
                   if ((patterns.get(k).variations[i][j] < bestVariation)) {
                     
                     bestLevel = k; 
                     bestVariation = patterns.get(k).variations[i][j];
        
                    }
                }
                
            if (patterns.get(bestLevel).activator[i][j] > patterns.get(bestLevel).inhibitor[i][j]) {
        
                F[i][j] += patterns.get(bestLevel).step; 
                
            }
            else {
              
                F[i][j] -= patterns.get(bestLevel).step; 
                
            }
            
            minmax.y = max(minmax.y, F[i][j]);
            minmax.x = min(minmax.x, F[i][j]);
            
          }
        }
        
        float range= 0.5 * (minmax.y - minmax.x);
        
        for (int i=0 ; i < n; i++) {
            for (int j = 0; j < n; j++) { F[i][j]= (F[i][j]-minmax.x) / range - 1; }
        }
      
    }
    
    void draw(){
      
      noStroke();
       
     for(int i = 0; i < F.length; i++){
         for(int j = 0; j < F[0].length; j++){  

             int c = (int)map(F[i][j], -1.0, 1.0, 0, 255);
             fill(color(c, c, c));

             rect(i * resolution, j * resolution, resolution, resolution);
           
         }
     }
      
   }

}
