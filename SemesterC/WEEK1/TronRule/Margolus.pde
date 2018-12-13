class Margolus{
 
   int[] rule;
   int[][] matrix;
   PVector[][] indices;
   int[] shiftRegister; 
   int phase = 0;
   
   Margolus(int[] rule_, int w_, int h_){
     
      rule = reverseRule(rule_);
      matrix = new int[w_ / 2][ h_ / 2];
      indices = new PVector[w_][h_];
      shiftRegister = new int[h_];
    
      for(int j = 0; j < h_; j++){
        
        shiftRegister[j] = j;
        
        for(int i = 0; i < w_; i++){
          
           indices[i][j] = new PVector(i, j);
          
        }
      }
    
   } 
   
   void setMatrix(int[][] states_){
       
       
       for(int h = 0; h < states_[0].length; h += 2){
         for(int w = 0; w < states_.length; w += 2){
        
           int w0 = (int)indices[w][h].x;
           int h0 = (int)indices[w][h].y;
           
           int w1 = (int)indices[w + 1][h].x;
           int h1 = (int)indices[w + 1][h].y;
           
           int w2 = (int)indices[w][h + 1].x;
           int h2 = (int)indices[w][h + 1].y;
           
           int w3 = (int)indices[w + 1][h + 1].x;
           int h3 = (int)indices[w + 1][h + 1].y;
           
           StringBuilder s = new StringBuilder("0000");
           s.setCharAt(0, char(48 + states_[w0][h0]));
           s.setCharAt(1, char(48 + states_[w1][h1]));
           s.setCharAt(2, char(48 + states_[w2][h2]));
           s.setCharAt(3, char(48 + states_[w3][h3]));
           
           matrix[w / 2][h / 2] = Integer.parseInt(s.toString(), 2);
    
         }
       } 

       shiftIndices();
     
   }
   
   void permutate(int[][] state_){

     
     for(int j = 0; j < matrix[0].length; j++){
       for(int i = 0; i < matrix.length; i++){
         
         int last = matrix[i][j];
         matrix[i][j] = rule[matrix[i][j]];
         String binary = Integer.toString(matrix[i][j] ,2);
         if(binary.length() < 4 ) { binary = formatBinary(binary); }
        
         state_[i * 2][j * 2] = binary.charAt(0) - 48;
         state_[i * 2 + 1][j * 2] = binary.charAt(1) - 48;
         state_[i * 2][j * 2 + 1] = binary.charAt(2) - 48;
         state_[i * 2 + 1][j * 2 + 1] = binary.charAt(3) - 48;

       }
     }
 
     
   }
   
   void shiftIndices() {

        int first = shiftRegister[0];
        for( int i = 0; i < shiftRegister.length - 1 ; i++ ) { shiftRegister[i] = shiftRegister[i + 1]; }
        shiftRegister[indices.length - 1] = first;

        PVector[][] tmp = new PVector[shiftRegister.length][shiftRegister.length];
        
        for(int y = 0; y < shiftRegister.length; y++){
          for(int x = 0; x < shiftRegister.length; x++){
            
          tmp[x][y] = new PVector(0, 0);
          tmp[x][y].x = indices[shiftRegister[x]][shiftRegister[y]].x;
          tmp[x][y].y = indices[shiftRegister[x]][shiftRegister[y]].y;
        
          }
        }
        
        indices = tmp;

   }
   
   int[] reverseRule(int[] array_) {
     
    for (int i = 0; i < array_.length / 2; i++) {
      
        int tmp = array_[i];
        array_[i] = array_[array_.length - 1 - i];
        array_[array_.length - 1 - i] = tmp;
        
    }
    
    return array_;
    
   }
   
   PVector getPosition(int w_, int h_){
     
     return indices[w_][h_];
     
   }
   
   String formatBinary(String source_){
     
     StringBuilder out = new StringBuilder(source_);
     
     while(out.toString().length() != 4) { out.insert(0, Integer.toString(0)); }
     
     return out.toString();
     
   }

}
