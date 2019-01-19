class Board{
  
   byte[][] board = new byte[6][7];
   
   Board(){ 
     
     board = new byte[][]{
       
            {0,0,0,0,0,0,0,},
            {0,0,0,0,0,0,0,},
            {0,0,0,0,0,0,0,},
            {0,0,0,0,0,0,0,},
            {0,0,0,0,0,0,0,},
            {0,0,0,0,0,0,0,}, 
            
        };

   } 
   
   boolean isLegalMove(int col_){ return board[0][col_] == 0; }
  
   boolean placeMove(int col_, int player_){ 
     
        if(!isLegalMove(col_)) { println("Illegal move!"); return false; }
        
        for(int i = 5; i >= 0; i--){
          
            if(board[i][col_] == 0) { board[i][col_] = (byte)player_; return true; }
        }
        
        return false;
        
   }
    
   void undoMove(int col_){
     
        for(int i = 0; i <= 5; i++){
          
            if(board[i][col_] != 0) {
                board[i][col_] = 0;
                break;
            }
        }        
    }
    
   void draw(){
     
       noStroke();
       
       for(int y = 0; y < board.length; y++){
         for(int x = 0; x < board[0].length; x ++){
           
           fill(#1F2226);
           if(board[y][x] == 1) { fill(#D6231E); }
           else if(board[y][x] == 2) { fill(#F8B500); }
           
           ellipse(x * 64 + 48, y * 64 + 48, 48, 48);
           
         }
       }
  
   }
}
