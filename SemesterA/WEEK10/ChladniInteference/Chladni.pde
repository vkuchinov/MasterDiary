class Chladni{
  
   float m, n, L;
   
   double[] epsilons = {Math.ulp(1E7), Math.ulp(4E6), Math.ulp(8E5)};
   color[] colors = {color(255, 0, 0), color(255, 255, 255), color(0, 0, 0)};
   
   Chladni(float m_, float n_, float L_){
    
       m = m_; n = n_;
       L = L_;
    
   }
  
   void render(){ 
      
      for (float y = 0; y < height; y++){
          for (float x = 0; x < width; x++){
            
                double chladni = Math.cos(n * Math.PI * x / L) * Math.cos( m * Math.PI* y / L) - Math.cos(m * Math.PI* x / L) * Math.cos(n * Math.PI * y / L);
                for(int e = 0; e < epsilons.length; e++){
                if(Math.abs(chladni) <= epsilons[e]) set((int)x, (int)y, color(colors[e]));
                }
          }
      }  
     
   }
   
   void updateN(float n_){
     
      n = n_;  
     
   }
  
}
