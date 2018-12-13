class Kronecker{
  
    Kronecker() { }
    
    int[][] product(int[][] a_, int[][] b_) {

    int[][] c = new int[a_.length * b_.length][];

    for (int ix = 0; ix < c.length; ix++) {
      final int num_cols = a_[0].length * b_[0].length;
      c[ix] = new int[num_cols];
    }

    for (int ia = 0; ia < a_.length; ia++) {
      for (int ja = 0; ja < a_[ia].length; ja++) {
        for (int ib = 0; ib < b_.length; ib++) {
          for (int jb = 0; jb < b_[ib].length; jb++) {
            
             c[b_.length * ia + ib][b_[ib].length * ja + jb] = a_[ia][ja] * b_[ib][jb];
             
          }
        }
      }
    }
    
    return c;
    
    } 
    
    void generate(int[][] m_, int n_){
      
        int[][] m_pow = power(m_, n_);
        draw(m_pow);
    
    }
    
    int[][] power(int[][] m_, int n_) {

        int[][] m_pow = m_;
        for (int ix = 1; ix < n_; ix++) {  m_pow = product(m_, m_pow); }
        
        return m_pow;
        
    }
    
    void draw(int[][] m_pow_){
      
        println(m_pow_.length);
        
        for(int i = 0; i < m_pow_.length; i++){
            for(int j = 0; j < m_pow_[i].length; j++){
             
                setBlock(j, i, m_pow_[i][j]);
              
            }
        }
      
    }
    
    void setBlock(int x_, int y_, int color_){
      
        color c = color(255);
        if(color_ == 1) { c = color(0); }
              
        for(int y = 0; y < d; y++){
          for(int x = 0; x < d; x++){
            
              set(x_ * d + x, y_ * d + y, c);
            
          }
        }
      
    }
  
}
