class Polynomial{
 
     //for cubic polinomial
     //should be replaced with ArrayList
     //for (n) polynomial
     int n, N;
     
     double[] a, b, c, d;
     double[] x, y, X, Y;
     
     //normal matrix(augmented)
     double[][] B;
     
     float EPSILON = 1E-4;
  
     Polynomial(ArrayList<PVector> points_, int n_){
       
       n = n_; //degree
       N = points_.size();
              
       x = new double[points_.size()];
       y = new double[points_.size()];
       
       for(int i = 0; i < points_.size(); i++){
          
             x[i] = points.get(i).x;
             y[i] = points.get(i).y;
         
       }
       
       //stores values of sigma(xi), sigma(xi^2)...sigma(xi^2n)
       X = new double[2 * n + 1 ]; 
       
       for (int i = 0; i < 2 * n + 1; i++) {

          X[i] = 0.0;
          
          for (int j = 0; j < N; j++) { X[i] += Math.pow(x[j], i); }
          
       }

       B = new double[n + 1][n + 2];
       a = new double[n + 1];
          
       for (int i = 0; i <= n; i++) { for (int j = 0; j <=n ; j++) { B[i][j] = X[i + j]; }}  
            

       Y = new double[n + 1];              
    
       for (int i = 0; i < n + 1; i++){
 
        Y[i] = 0.0;
        for (int j = 0; j < N; j++) {  Y[i] += Math.pow(x[j], i) * y[j]; }
        
       }

       for (int i = 0; i <= n; i++) { B[i][n + 1] = Y[i]; }  
       
       n++;

        for(int i = 0; i < n; i++){
          
            for (int k = i + 1; k < n; k++){
              
                if (B[i][i] < B[k][i]) {
                  
                    for (int j = 0; j <= n; j++) {
                      
                        double tmp = B[i][j];
                        B[i][j] = B[k][j];
                        B[k][j] = tmp;
                    
                    }
                }
            }
        }
       
        for (int i = 0; i < n - 1; i++){
          
            for (int k = i + 1; k < n; k++){ 
            
            double t = B[k][i] / B[i][i];
            for (int j = 0; j <= n; j++) { B[k][j] = B[k][j] - t * B[i][j]; }
            
            }
            
        }
     
        for (int i = n - 1; i >= 0; i--) {                        
        
            a[i] = B[i][n]; 
            
            for (int j = 0; j < n; j++) { if (j != i)  { a[i] = a[i] - B[i][j] * a[j]; } }
            
            a[i] = a[i] / B[i][i];

        } 

        parseCoeffs(a, n);

    }
 
    void parseCoeffs(double[] a_, int n_){
      
      String o = "y = " + (float)a_[0];
      
      for(int i = 1; i < n_; i++){
        o += " + " + (float)a_[i] + " * x^" + (i + 1);
      }
      
      println(o);
      
    }
  
}
