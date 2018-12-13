class TotalisticK{
 
   int K, rule;
   String code;
   PVector info;
   HashMap<Float, Integer> dict = new HashMap<Float, Integer>();
   int[] colorIndices;
   int[][] matrix;
   
   TotalisticK(int K_, int rule_, int[] first_, int len_){
     
     K = K_; rule = rule_;
     code = Base10ToBaseN(K, rule_);
     code = validate(3 * K - 2, code);
     info = new PVector(3 * K - 2, (int)pow(3, 3 * K - 2), parseInt(code));
          
     colorIndices = new int[K];
     colorIndices[0] = 0;
     for(int i = 1; i < K; i++) { colorIndices[i] = floor(256 / (float)K) * (i - 1); }

     matrix = new int[len_][first_.length];
     matrix[0] = first_;

   }
   
   void generate(){
    
     for(int r = 1; r < matrix.length; r++){
        for(int c = 0; c < matrix[r].length; c++){
          
          int[] nn = new int[]{c - 1, c, c + 1};
          if(c == 0) { nn[0] = matrix[r].length - 1; }
          if(c == matrix[r].length - 1) { nn[2] = 0; }
          
          int sum = 0;
          for(int j = 0; j < 3; j++) { sum += matrix[r-1][nn[j]]; }
          int v = Character.getNumericValue(code.charAt((int)info.x - 1 - sum));
          matrix[r][c] = v;

        }
     }

    for(int r = 0; r < matrix.length; r++){
        for(int c = 0; c < matrix[r].length; c++){
          
          noStroke();
          if(matrix[r][c] == 0) { fill(0); } 
          else { fill(colorIndices[matrix[r][c]], 240, 240); }
          
          rect(c * 8, r * 8, 8, 8);
          
        }
    }
    
   }
   
   String validate(int len_, String code_){
     
     if(code_.length() == len_) { return code_; }
     else{ while(code_.length() < len_){ code_ = "0" + code_; } return code_; }
     
   }
   
   void getInfo(){ println("K:", K,"rule:",rule,"code:",(int)info.z,"states:", (int)info.x,"variations:",(int)info.y); }

}
