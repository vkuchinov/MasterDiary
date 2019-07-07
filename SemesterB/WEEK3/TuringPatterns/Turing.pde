class Turing{
 
   float[] F;
   int resolution, w, h, ra, ri;
   
   Turing(int resolution_, int w_, int h_, int ra_, int ri_){
     
       resolution = resolution_; w = w_; h = h_; ra = ra_; ri = ri_;
       F = new float[w * h];

       for(int i = 0; i < w_ * h_; i++){ F[i] = random(0.0, 1.0); }
    
   } 
   
   void next(){

     float[] A = convA(ra), I = convI(ri);

     for(int i = 0; i < F.length; i++){
      
         F[i] += A[i] - I[i];
       
     }
     
   }
   
   ArrayList<Convolution> force(int r_){
     
       int dw = r_ * 2 + 1;
       float total = 0.0;
       
       ArrayList<Convolution> conv = new ArrayList<Convolution>();
       for(int i = 0; i < dw * dw; i++){
         
         int x = i % dw - r_; 
         int y = (i / dw | 0) - r_;
         float f = pow(max((r_ + 1.0 / 2.0) - hypot(x, y), 0), 2);
         if(f > 0) { conv.add(new Convolution(x, y, f)); total += f; }
         
       }
       
       for(Convolution c : conv ) { c.f /= total; }
       
       return conv;
     
   }
   
   float[] convA(int ra_){
     
     int inc = 0;
     float[] out = Arrays.copyOf(F, F.length);
     Convolution[] f = force(ra_).toArray(new Convolution[0]);
 
     for(int i = 0; i < F.length; i++){

        int x = i % w; 
        int y = i / w | 0;
        float tmpv = 0.0;
    
        for(int j = 0; j < f.length; j++){ tmpv += f[j].f * get(F, x + f[j].x, y + f[j].y); }
        out[i] = constrain(tmpv, -2.147E8, 2.147E8);
     
     }

     return out;
     
   }
   
   float[] convI(int ri_){
  
     float[] out = Arrays.copyOf(F, F.length);
     Convolution[] f = force(ri_).toArray(new Convolution[0]);

     for(int i = 0; i < F.length; i++){

        int x = i % w; 
        int y = i / w | 0;
        float tmpv = 0.0;
        
        for(int j = 0; j < f.length; j++){ tmpv += f[j].f * get(F, x + f[j].x, y + f[j].y); }
        out[i] = constrain(tmpv, -2.147E8, 2.147E8);
     
     }
     return out;
     
   }
   
   float get(float[] ch_, int x_, int y_) { return ch_[((y_ + w) % w) * w + ((x_ + w) % w)]; }
   
   float hypot(float f0_, float f1_){ return sqrt(pow(f0_, 2) + pow(f1_, 2)); }
   void draw(){
     
       noStroke();
       
       for(int i = 0; i < F.length; i++){
         
             int x = i % w; 
             int y = i / w | 0;
        
             int c = (int)map(F[i], 0.0, 1.0, 0, 256);
             fill(color(c, c, c));
             rect(x * resolution, y * resolution, resolution, resolution);
        
       }
       
 
   }
   

}
