class TotalisticK{
 
   int K, L, rule;
   String[] code;
   PVector info;
   HashMap<Float, Integer> dict = new HashMap<Float, Integer>();
   int[] colorIndices;
   int[] pattern;
   int[][] matrix;
   
   TotalisticK(int K_, int[] rule_, int[] first_, int len_){
     
     K = K_; pattern = first_;
     L = 3 * K - 3;
     
     code = new String[rule_.length];
     for(int i = 0; i < rule_.length; i++){
       
     code[i] = Base10ToBaseN(K, rule_[i]);
     code[i] = validate(3 * K - 2, code[i]);
     
     }
               
     colorIndices = new int[K];
     colorIndices[0] = 0;
     for(int i = 1; i < K; i++) { colorIndices[i] = floor(256 / (float)K) * (i - 1); }

     matrix = new int[len_][pattern.length];
     matrix[0] = pattern;

   }
   
   void generate(){
    
     for(int r = 1; r < matrix.length; r++){
        for(int c = 0; c < matrix[r].length; c++){
          
          int[] nn = new int[]{c - 1, c, c + 1};
          if(c == 0) { nn[0] = matrix[r].length - 1; }
          if(c == matrix[r].length - 1) { nn[2] = 0; }
          
          int sum = 0;
          for(int j = 0; j < 3; j++) { sum += matrix[r-1][nn[j]]; }

          int l = 0;
          for(int f = 1; f < palette.size(); f++){
          if(mask.get(c, r + 2) == palette.get(f)) { l = f; }
          }
          matrix[r][c] = Character.getNumericValue(code[l].charAt(L - sum));

        }
     }

    for(int r = 0; r < matrix.length; r++){
        for(int c = 0; c < matrix[r].length; c++){
          
          noStroke();
          if(matrix[r][c] == 0) { fill(0); } 
          else { fill(colorIndices[matrix[r][c]], 240, 240); }
          
          rect(c * 4, r * 4, 4, 4);
          
        }
    }
    
   }
   
   String validate(int len_, String code_){
     
     if(code_.length() == len_) { return code_; }
     else{ while(code_.length() < len_){ code_ = "0" + code_; } return code_; }
     
   }

}
