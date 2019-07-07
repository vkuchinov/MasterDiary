/*

ROTATE 2-DIMENSIONAL MATRIX


@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

int CW = 1;
int CCW = -1;

import java.util.Random;
Random seed = new Random(12345);

int[][] matrix = new int[4][4];

void setup(){
  
     for(int j = 0; j < 4; j++){
      for(int i = 0; i < 4; i++){
       
          matrix[i][j] = seed.nextInt(64);
        
      }
     } 
     
     println("original matrix:");
     println(displayMatrix(matrix));
     
     println("rotated matrix:");
     //could be rotated clockwise or counter-clockwise by 90, 180, or 270 degrees
     println(displayMatrix(rotateMatrix(matrix, -90)));
  
}

String displayMatrix(int[][] matrix_){
  
     String output = "";
     for(int j = 0; j < 4; j++){
       
      String currentLine = "";
      
      for(int i = 0; i < 4; i++){
       
          currentLine += nf(matrix_[i][j], 2, 0) + " ";
        
      }
      
      output += currentLine + "\n";
      
     } 
     
     return output;
  
}

int[][] rotateMatrix(int[][] matrix_, int angle_){

    int direction = 1;
    if(angle_ < 0) { direction = -1; }
    
    int n = abs(angle_ / 90) - 1;
    
    int[][] output = new int[4][4];
    
    if(direction == 1){
        for (int j = 0; j < 4; j++) {
            for (int i = 0; i < 4; i++) {
                output[i][j] = matrix_[j][4 - i - 1];
            }
        }
        
        if(n > 0) output = rotateMatrix(output, n * 90);
     
    }
    else
    {
        for (int j = 0; j < 4; j++) {
            for (int i = 0; i < 4; i++) {
                output[i][j] = matrix_[4 - j - 1][i];
            }
        }
        
        if(n > 0) output = rotateMatrix(output, n * -90);
    }

      return output;
      
}
