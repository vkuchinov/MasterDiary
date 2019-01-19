class Connect4 {
  
    Board b = new Board();
    
    int nextMoveLocation = -1;
    int maxDepth = 9;

    Connect4(){ }
    
    void playAgainstComputer(){
      
        int humanMove =- 1;
        String answer = "yes";
        
        if(answer.equalsIgnoreCase("yes")) letOpponentMove();
        
        b.placeMove(3, 1);
        
        while(true){ 
          
            if(playerTurn){
              
            letOpponentMove();
            
            int gameResult = gameResult(b);
            if(gameResult==1){System.out.println("AI Wins!");break;}
            else if(gameResult==2){System.out.println("You Win!");break;}
            else if(gameResult==0){System.out.println("Draw!");break;}
            
            } else {
              
            int gameResult = gameResult(b);
            b.placeMove(getAIMove(), 1);
            gameResult = gameResult(b);
            if(gameResult==1){System.out.println("AI Wins!");break;}
            else if(gameResult==2){System.out.println("You Win!");break;}
            else if(gameResult==0){System.out.println("Draw!");break;}
            playerTurn = true;
            
            }
            
        }
        
    }
    
    int getAIMove(){
      
        nextMoveLocation = -1;
        minimax(0, 1, Integer.MIN_VALUE, Integer.MAX_VALUE);
        playerTurn = true;
        return nextMoveLocation;
        
    }
    
    void letOpponentMove(){  b.placeMove(rowByMouseX - 1, (byte)2); }
    
    int gameResult(Board b_){
  
        int aiScore = 0, humanScore = 0;
        
        for(int i = 5; i >= 0; i--){
            for(int j = 0; j <= 6 ; j++){
              
                if(b_.board[i][j] == 0) continue;
 
                if(j <=3 ){
                    for(int k = 0; k < 4; k++){ 
                      
                            if(b_.board[i][j + k] == 1) aiScore++;
                            else if(b_.board[i][j + k] == 2) humanScore++;
                            else break; 
                            
                    }
                    
                    if(aiScore == 4)return 1; else if (humanScore == 4)return 2;
                    aiScore = 0; humanScore = 0;
                    
                } 
                
                if(i >= 3){
                    for(int k = 0; k < 4; k++){
                      
                            if(b_.board[i - k][j] == 1) aiScore++;
                            else if(b_.board[i - k][j] == 2) humanScore++;
                            else break;
                            
                    }
                    
                    if(aiScore == 4)return 1; else if (humanScore == 4)return 2;
                    aiScore = 0; humanScore = 0;
                    
                } 
                
                if(j <= 3 && i>= 3){
                    for(int k = 0; k < 4; k++){
                      
                        if(b_.board[i - k][j + k] == 1) aiScore++;
                        else if(b_.board[i - k][j + k] == 2) humanScore++;
                        else break;
                        
                    }
                    
                    if(aiScore == 4) return 1; else if (humanScore == 4)return 2;
                    aiScore = 0; humanScore = 0;
                    
                }
                
                if( j>=3 && i>=3 ){
                    for(int k = 0; k <4 ; k++){
                      
                        if(b_.board[i - k][j - k] == 1) aiScore++;
                        else if(b_.board[i - k][j - k] == 2) humanScore++;
                        else break;
                        
                    } 
                    
                    if(aiScore == 4) return 1; else if (humanScore == 4)return 2;
                    aiScore = 0; humanScore = 0;
                    
                }  
            }
        }
        
        for(int j = 0; j < 7; j++){ if(b.board[0][j]==0) return -1; }
        
        return 0;
        
}

int calculateScore(int aiScore_, int moreMoves_){   
  
        int moveScore = 4 - moreMoves_;
        if(aiScore_ == 0) return 0;
        else if(aiScore_ == 1) return 1 * moveScore;
        else if(aiScore_ == 2) return 10 * moveScore;
        else if(aiScore_ == 3) return 100 * moveScore;
        else return 1000;
         
}

public int evaluateBoard(Board b_){
      
        int aiScore = 1;
        int score = 0;
        int blanks = 0;
        int k = 0, moreMoves = 0;
        
        for(int i = 5; i >= 0; i--){
            for(int j = 0; j <= 6; j++){
                
                if(b_.board[i][j] == 0 || b_.board[i][j] == 2) continue; 
                
                if(j <= 3){ 
                    for(k = 1; k < 4; k++){
                      
                        if(b_.board[i][j + k] == 1) aiScore++;
                        else if(b_.board[i][j + k]==2){ aiScore=0; blanks = 0; break;}
                        else blanks++;
                        
                    }
                     
                    moreMoves = 0;
                    
                    if(blanks > 0) 
                        for(int c = 1; c < 4; c++){
                          
                            int column = j + c;
                            for(int m=i; m<= 5;m++){ if(b_.board[m][column] == 0) { moreMoves++; } else { break; } }
                            
                        } 
                    
                    if(moreMoves != 0) score += calculateScore(aiScore, moreMoves);
                    
                    aiScore=1;   
                    blanks = 0;
                    
                } 
                
                if(i >= 3){
                    for(k = 1; k < 4; k++){
                      
                        if(b_.board[i - k][j] == 1)aiScore++;
                        else if(b_.board[i-k][j] == 2){ aiScore=0; break;} 
                        
                    } 
                    
                    moreMoves = 0; 
                    
                    if(aiScore > 0){
                        int column = j;
                        for(int m = i - k + 1; m <= i - 1; m++){
                          
                         if(b_.board[m][column]==0) moreMoves++;
                         else break;
                            
                        }  
                    }
                    
                    if(moreMoves != 0) score += calculateScore(aiScore, moreMoves);
                    aiScore = 1;  
                    blanks = 0;
                    
                }
                 
                if(j >= 3){
                    for(k = 1; k < 4; k++){
                      
                        if(b_.board[i][j - k] == 1) aiScore++;
                        else if(b_.board[i][j - k] == 2){ aiScore = 0; blanks = 0; break; }
                        else blanks++;
                        
                    }
                    
                    moreMoves = 0;
                    if(blanks> 0) 
                        for(int c = 1;c < 4; c++){
                            int column = j - c;
                            for(int m = i; m <= 5; m++){
                             if(b_.board[m][column] == 0) moreMoves++;
                                else break;
                            } 
                        } 
                    
                    if(moreMoves !=0 ) score += calculateScore(aiScore, moreMoves);
                    aiScore = 1; 
                    blanks = 0;
                }
                 
                if(j <= 3 && i >= 3){
                    for(k = 1; k < 4; k++){
                        if(b_.board[i - k][j + k] == 1) aiScore++;
                        else if(b_.board[i - k][j + k] == 2){ aiScore=0; blanks = 0; break; }
                        else blanks++;                        
                    }
                    moreMoves = 0;
                    if(blanks > 0){
                        for(int c = 1; c < 4; c++){
                            int column = j + c, row = i - c;
                            for(int m = row; m <= 5; m++){
                                if(b_.board[m][column] == 0) moreMoves++;
                                else if(b_.board[m][column] == 1);
                                else break;
                            }
                        } 
                        
                        if(moreMoves != 0) score += calculateScore(aiScore, moreMoves);
                        aiScore = 1;
                        blanks = 0;
                        
                    }
                }
                 
                if( i>= 3 && j >= 3){
                    for(k = 1; k < 4; k++){
                      
                        if(b_.board[i - k][j - k] == 1) aiScore++;
                        else if(b_.board[i - k][j - k] == 2){ aiScore=0; blanks=0; break; }
                        else blanks++;   
                        
                    }
                    moreMoves = 0;
                    if(blanks > 0){
                      
                        for(int c = 1; c < 4; c++){
                            int column = j - c, row = i - c;
                            for(int m = row; m <= 5; m++){
                                if(b_.board[m][column] == 0) moreMoves++;
                                else if(b_.board[m][column] == 1);
                                else break;
                                
                            }
                        } 
                        
                        if(moreMoves != 0) score += calculateScore(aiScore, moreMoves);
                        aiScore = 1;
                        blanks = 0;
                        
                    }
                } 
            }
        }
        
        return score;
        
} 

int minimax(int depth_, int turn_, int alpha_, int beta_){
        
        if(beta_ <= alpha_){ if(turn_ == 1) return Integer.MAX_VALUE; else return Integer.MIN_VALUE; }
        int gameResult = gameResult(b);
        
        if(gameResult == 1) return Integer.MAX_VALUE / 2;
        else if(gameResult == 2)return Integer.MIN_VALUE / 2;
        else if(gameResult == 0)return 0; 
        
        if(depth_ == maxDepth) return evaluateBoard(b);
        
        int maxScore = Integer.MIN_VALUE, minScore = Integer.MAX_VALUE;
                
        for(int j = 0; j <= 6; j++){
            
            int currentScore = 0;
            
            if(!b.isLegalMove(j)) continue; 
            
            if(turn_ == 1){
              
                    b.placeMove(j, 1);
                    currentScore = minimax(depth_ + 1, 2, alpha_, beta_);
                    
                    if(depth_ == 0){
                      
                        println("Score for location ", j," = ", currentScore);
                        if(currentScore > maxScore) nextMoveLocation = j; 
                        if(currentScore == Integer.MAX_VALUE / 2){ b.undoMove(j); break; }
                        
                    }
                    
                    maxScore = Math.max(currentScore, maxScore);
                    
                    alpha_ = Math.max(currentScore, alpha_);  
            } 
            
            else if( turn_ == 2){
              
                    b.placeMove(j, 2);
                    currentScore = minimax(depth_ + 1, 1, alpha_, beta_);
                    minScore = min(currentScore, minScore);
                    beta_ = min(currentScore, beta_); 
                    
            }  
            
            b.undoMove(j); 
            if(currentScore == Integer.MAX_VALUE || currentScore == Integer.MIN_VALUE) break; 
            
        }  
        
        return turn_ == 1 ? maxScore:minScore;
        
    }
    
  
}
