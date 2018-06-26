class Simplex{
 
   double F2 = 0.5 * (Math.sqrt(3.0) - 1.0);
   double G2 = (3.0 - Math.sqrt(3.0)) / 6.0;
   
   Grad perm[] = new Grad[512];
   Grad gradP[] = new Grad[512];
   
   Simplex(int seed_){
    
   }
  
   float get2D(PVector in_){
    
      float xin = in_.x, yin = in_.y;
      
      float n0, n1, n2;
      double s = (xin + yin) * F2; 
      
      int i = floor(xin + (float)s);
      int j = floor(yin + (float)s);
      
      double t = (i + j) * G2;
      
      double x0 = xin - i + t;
      double y0 = yin - j + t;
    
      int i1, j1;
      
      if(x0 > y0) { i1 = 1; j1 = 0; } else { i1 = 0; j1 = 1; }
      
      double x1 = x0 - i1 + G2;
      double y1 = y0 - j1 + G2;
      
      double x2 = x0 - 1 + 2 * G2;
      double y2 = y0 - 1 + 2 * G2;
      
      i &= 255;
      j &= 255;
      
      Grad gi0 = gradP[i + perm[j]];
      Grad gi1 = gradP[i + i1 + perm[j + j1]];
      Grad gi2 = gradP[i + 1 + perm[j + 1]];
      
      double t0 = 0.5 - x0 * x0 - y0 * y0;
      
      if(t0 < 0) { n0 = 0; } else { t0 *= t0; n0 = t0 * t0 * gi0.dot2(x0, y0); }
      
      return 0.0;
     
   }
    
  
}

class Grad extends PVector{
  
   Grad(float x_, float y_){
     
     x = x_; y = y_;
    
   } 
   
   void dot2(float x_, float y_) { x *= x_; y *= y_; }

}
