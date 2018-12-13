class DFT{
  
   int PROF = 32;
   int PHASE = 30;
   
   
   DFT(){
    
   } 
   
   float fract(float f_) { return f_ - floor(f_); };
   float rand(PVector uv_) { return fract(1E5 * sin(PVector.dot(uv_, new PVector(17.4, 123.7)))); } 
   float srnd(PVector v_) { return 2.0 * rand(v_) -1.0; }
   float gauss(float f_) { return exp(-0.5 * f_ * f_); }
   PVector ang(float a_)  { return new PVector(cos(a_), sin(a_)); }
   
}


