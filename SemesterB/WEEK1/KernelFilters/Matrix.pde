class Matrix{
  
   int d;
   double v;
   double[][] m;
 
   Matrix(Matrix m_){
     
     v = m_.v;
     d = m_.d;
     m = m_.m;
     
   }
   
   Matrix(int width_){
     
       int[] row = pascalPyramidRow(width_);
       d = width_;

       m = new double[d][d];
       
       long sum = 0;
       
       for(int i = 0; i < d; i++){
          for(int j = 0; j < d; j++){
            
            m[i][j] = row[i] * row[j];
            sum += m[i][j];
         
         }
       }

       v = 1.0 / sum;
       
       for(int i = 0; i < d; i++){
          for(int j = 0; j < d; j++){
            
            m[i][j] *= v;
         
         }
       }

   }
   
   Matrix(int[] matrix_, float value_){
     
       v = value_;
       d = (int)sqrt(matrix_.length);
       m = new double[d][d];
       
       for(int k = 0; k < matrix_.length; k++){
         
          int i = k % d;
          int j = floor(k / d);
          
          m[i][j] = v * matrix_[k];
         
       }

   } 
   
   void displayMatrix(){
     
     for(int i = 0; i < m.length; i++){
       for(int j = 0; j < m[i].length; j++){
         
         print(m[i][j] + " ");

       }
       
       println();
       
     }

   }
   
   int[] pascalPyramidRow(int n_){
 
    n_ = n_ - 1;
    
    int[] row = new int[n_ + 1];
    for(int i = 0; i < row.length; i++){ row[i] = 0; }
    row[0] = row[row.length - 1] = 1;

    for(int i = 0; i < (int)(n_ / 2); i++) {

        int x = row[ i ] * (n_ - i) / (i + 1);
        row[ i + 1 ] = row[ n_ - 1 - i ] = x;
   
    }

    return row;
  
  }
  
}
