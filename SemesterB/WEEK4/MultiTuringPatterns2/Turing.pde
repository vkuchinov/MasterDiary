class Turing{
  
    float[][] activator, inhibitor, variations;
    PVector activatorRadius, inhibitorRadius;
    int variationSamplingRadius;
    float step;
    
    Turing(PVector activatorR_, PVector inhibitorR_, int vsr_, float s_){
 
      activatorRadius = new PVector(activatorR_.x, activatorR_.y);
      inhibitorRadius = new PVector(inhibitorR_.x, inhibitorR_.y);
      activator = new float[n][n];
      inhibitor = new float[n][n];
      variations = new float[n][n];
      
      for(int i = 0; i < n; i++){
          for(int j = 0; j < n; j++){
            
              activator[i][j] = 0.0;
              inhibitor[i][j] = 0.0;
              variations[i][j] = 0.0;
            
          }
      }
      variationSamplingRadius= vsr_;
      step = s_;
      
    }
    
    void next(float[][] F_, float[][] buffer_) {
    
        diffuse(F_, buffer_);
        sampleVariation(buffer_);
  
    }
    
    void diffuse(float[][] F_, float[][] buffer_) {
      
        blur(F_, activator, buffer_, activatorRadius.x, activatorRadius.y);
        blur(F_, inhibitor, buffer_, inhibitorRadius.x, inhibitorRadius.y);
  
    }
    
    void sampleVariation(float[][] buffer_) {
       
        conv(activator, inhibitor, variations, buffer_, variationSamplingRadius);
  
    }

    void blur(float[][] in_, float[][] out_, float[][] buffer_, float radiusX_, float radiusY_) {
      
        hBlur(in_, buffer_, radiusX_);
        vBlur(buffer_, out_, radiusY_);
    
    }
    
    void hBlur (float[][] in_, float[][] out_, float radius_) {
      
        int radius = (int)radius_;
        
        for (int j = 0; j < n; ++j) {
          
            float total = 0;
            for (int di = -radius; di <= radius - 1; di++) { total += (di >= 0) ? in_[di][j] : 0; }
            out_[0][j] = total / (radius * 2 + 1);
            
            for (int i = 1; i < n; i++) {
              
                total -= (i - radius - 1 >= 0) ? in_[i - radius - 1][j] : 0;
                total += (i + radius < n) ? in_[i + radius][j] : 0;
                out_[i][j] = total / (radius * 2 + 1);
            
            }
        }
        
    }
    
    void vBlur (float[][] in_, float[][] out_, float radius_) {
      
        int radius = (int)radius_;
        
        for (int i = 0; i < n; ++i) {
          
            float total = 0;
            for (int dj = -radius; dj <= radius; dj++) {total += (dj >= 0) ? in_[i][dj] : 0; }
            out_[0][i] = total / (radius * 2 + 1);
            
            for (int j = 1; j < n; j++) {
              
                 total -= (j - radius - 1 >= 0) ? in_[i][j - radius - 1] : 0;
                 total += (j + radius < n) ? in_[i][j + radius] : 0;
                 out_[i][j] = total / (radius * 2 + 1);
            
            }
        }
        
    }
    
    void conv(float[][] in0_, float[][] in1_, float[][] out_, float[][] buffer_, float radius_) {
      
        int radius = (int)radius_;
        
        hLine(in0_, in1_, buffer_, radius);
        vLine(in0_, in1_, out_, radius);
        
          for (int i = 0; i < n; i++) {
              for (int j = 0;j < n; j++) { out_[i][j]+= buffer_[i][j]; }
          }
        
    }
    
    void hLine(float[][] in0_, float[][] in1_, float[][] out_, float radius_) {
      
        int radius = (int)radius_;
         
        for (int j = 0; j < n; ++j) {
          
            float total = 0;
            
            for (int di = -radius; di <= radius; di++) {
              
                total += (di >= 0) ? abs(in0_[di][j]- in1_[di][j]) : 0;
                
            }
            
            out_[0][j] = total / (radius * 2 + 1);
            
            for (int i = 1; i < n; i++) {
              
              total -= (i - radius - 1 >=0 ) ? abs(in0_[i - radius - 1][j] - in1_[i - radius - 1][j]) : 0;
              total += (i + radius < n) ? abs(in0_[i + radius][j] - in1_[i + radius][j]):0;
              out_[i][j] = total / (radius * 2 + 1);
              
              }
        }
        
    }

    void vLine(float[][] in0_, float[][] in1_, float[][] out_, float radius_) {
      
        int radius = (int)radius_;
        
        for (int i = 0; i < n; ++i) {
          
        float total = 0;
        
            for (int dj = -radius; dj <= radius; dj++) {
                
              total += (dj >= 0) ? abs(in0_[i][dj] - in1_[i][dj]) : 0;
              
            }
            
            out_[i][0] = total / (radius * 2 + 1);
            
            for (int j = 1; j < n; j++) {
              
                total -= (j - radius - 1 >=0 ) ? abs(in0_[i][j - radius - 1] - in1_[i][j - radius - 1]) : 0;
                total += (j + radius < n) ? abs(in0_[i][j + radius] - in1_[i][j + radius]) : 0;
                out_[i][j] = total / (radius * 2 + 1);
            
            }
        }
  }
  
}
