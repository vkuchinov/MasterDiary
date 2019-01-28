class Matrix1D{
  
   int d;
   double v;
   double[] m;
   
   Matrix1D(int width_){
     
       int[] row = pascalPyramidRow(width_);
       d = width_;

       m = new double[row.length];
       long sum = 0;
       
       for(int i = 0; i < row.length; i++){
            
            m[i] = (double)row[i];
            sum += m[i];

       }

       v = 1.0 / sum;
       
       for(int i = 0; i < d; i++){ m[i] *= v; }

   }
   
    void displayMatrix(){
     
     for(int i = 0; i < m.length; i++){
         
         print(m[i] + " ");

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
