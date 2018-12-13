class PVector4D extends PVector{
  
  float w;
  
  PVector4D(float x_, float y_, float z_, float w_){
    
      x = x_; y = y_; z = z_; w = w_;
    
  }
  
  PVector4D(float xyzw_){ x =  y = z = w = xyzw_; }
  
}

class Fourier{
  
   float SIZE = width / 2.0 - 30.0;
   PVector4D O = new PVector4D(0.0);
   
   Fourier(PVector4D O_, PVector U_){
    
   
      for(float n = 0.0 ; n < 1000.; n++)  {
       
        if (n >= SIZE) break;
        float m = mod(n + SIZE / 2.0, SIZE);
        PVector xn = new PVector(fetch(matrix, m + 0.5, U_.y).x, fetch(matrix, m + 0.5, U_.y).y);
        PVector yn = new PVector(fetch(matrix, U_.x, m + 0.5).z, fetch(matrix, m + 0.5, U_.y).w);
        PVector a =  new PVector(TWO_PI *  mod2D(U_).x * n / SIZE, TWO_PI *  mod2D(U_).y * n / SIZE);
        
        O.z += cmul(xn, a.x).x; O.w += cmul(xn, a.x).y;
        O.x += cmul(yn, a.y).x; O.y += cmul(yn, a.y).y;
      
      }
    
   }
   
   PVector4D fetch(float[][][] matrix_, float x_, float y_){ 
     
      
      return new PVector4D(0.0); 

   }

}
