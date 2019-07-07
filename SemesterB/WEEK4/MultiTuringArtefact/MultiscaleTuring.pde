class MultiscaleTuring{
  
    float[] F, radiuses, steps, buffer, diffusionLeft, diffusionRight, variation, bestLayer, bestVariation;
    float base, scale, offset;
    int resolution, layers, w, h;
    boolean[] direction;
    
    MultiscaleTuring(int resolution_, int w_, int h_, int layers_, float base_, float scale_, float offset_){
      
        resolution = resolution_; w = w_; h = h_; base = base_; 
        layers = layers_; scale = scale_; offset = offset_;
       
        F = new float[w * h];
        for(int i = 0; i < w_ * h_; i++){ F[i] = random(-1.0, 1.0); }
        
        diffusionLeft = new float[w * h];
        diffusionRight = new float[w * h];
        buffer = new float[w * h];
        variation = new float[w * h];
        bestVariation = new float[w * h];
        bestLayer = new float[w * h];
        
        radiuses = new float[layers];
        steps = new float[layers];
        
        direction = new boolean[w * h];
        
        for (int i = 0; i < layers; i++) {
    
          radiuses[i] = pow(base, i);
          steps[i] = log(radiuses[i]) * scale + offset;
          
        }
       
    }

    void next(){ 
    
      float[] activator = F;
      float[] inhibitor = diffusionRight;
      
      for(int l = 0; l < layers - 1; l++) {
        
          conv(activator, inhibitor, buffer, radiuses[l]);
 
          for (int i = 0; i < w * h; i++) {
            
              variation[i] = activator[i] - inhibitor[i];
              if (variation[i] < 0) { variation[i] = -variation[i]; }
              
          }

              if (l == 0) {
                  for (int i = 0; i < w * h; i++) {
                    
                      bestVariation[i] = variation[i];
                      bestLayer[i] = l;
                      direction[i] = activator[i] > inhibitor[i];
                  }
                  
                  activator = diffusionRight;
                  inhibitor = diffusionLeft;
                  
              } 
              
              else {
                  for (int i = 0; i < w * h; i++) {
                      if (variation[i] < bestVariation[i]) {
                        
                          bestVariation[i] = variation[i];
                          bestLayer[i] = l;
                          direction[i] = activator[i] > inhibitor[i];
                          
                      }
                  }
                  
              float[] tmp = activator;
              activator = inhibitor;
              inhibitor = tmp;
              
              }
          }

        float min = Float.POSITIVE_INFINITY;
        float max = Float.NEGATIVE_INFINITY;
        
        for (int i = 0; i < w * h; i++) { 
          
              float step = steps[(int)bestLayer[i]];
              if (direction[i]) { F[i] += step; } 
              else { F[i] -= step; }
              
              min = min(min, F[i]);
              max = max(max, F[i]);
              
        }
       
        float dist = (max - min) / 2.0;
        for (int i = 0; i < w * h; i++) { F[i] = ((F[i] - min) / dist) - 1; }
    
    }
    
    void conv(float[] in_, float[] out_, float[] buffer_, float radius_) {

      for (int i = 0; i < in_.length; i++) {

          int x = i % w; 
          int y = i / w | 0;

          if (y == 0 && x == 0) { buffer_[i] = in_[i]; } 
          else if (y == 0) { buffer_[i] = buffer_[i - 1] + in_[i]; } 
          else if (x == 0) { buffer_[i] = buffer_[i - w] + in_[i]; } 
          else { buffer_[i] = buffer_[i - 1] + buffer_[i - w] - buffer_[i - w - 1] + in_[i]; }
  
      }
      
      for (int i = 0; i < in_.length; i++) {

          int x = i % w; 
          int y = i / w | 0;
    
          int minx = max(0, x - (int)radius_);
          int maxx = min(x + (int)radius_, w - 1);
          int miny = max(0, y - (int)radius_);
          int maxy = min(y + (int)radius_, h - 1);
          int area = (maxx - minx) * (maxy - miny);
      
          int nw = miny * w + minx;
          int ne = miny * w + maxx;
          int sw = maxy * w + minx;
          int se = maxy * w + maxx;
     
          int j = y * w + x;
          out_[j] = (buffer_[se] - buffer_[sw] - buffer_[ne] + buffer_[nw]) / area;
          
      }

    }

    void draw(){ 

       noStroke();
       
       for(int i = 0; i < F.length; i++){
         
             int x = i % w; 
             int y = i / w | 0;
       
             int c = (int)map(F[i], -1.0, 1.0, 0, 255);
             fill(color(c, c, c));
             rect(x * resolution, y * resolution, resolution, resolution);
        
       }
 
    }
  
}
