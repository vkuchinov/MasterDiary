/*

ROTATE 2-DIMENSIONAL MATRIX


@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

int CW = 1;
int CCW = -1;

import java.util.Random;
Random seed = new Random(12345);

float[][] matrix = new float[4][4];

void setup(){
  
     for(int j = 0; j < 4; j++){
      for(int i = 0; i < 4; i++){
       
          matrix[i][j] = seed.nextInt(64);
        
      }
     } 
     
     println("original matrix:");
     println(displayMatrix2D(matrix));
     
     println("rotated matrix:");
     //could be rotated clockwise or counter-clockwise by 90, 180, or 270 degrees
     println(displayMatrix2D(transposeMatrix2D(matrix)));
  
}

float[][] rotateMatrix2D(float[][] matrix_, int angle_){

    int direction = 1;
    if(angle_ < 0) { direction = -1; }
    
    int n = abs(angle_ / 90) - 1;
    
    float[][] output = new float[matrix_.length][matrix_[0].length];
    
    if(direction == 1){
        for (int j = 0; j < matrix_.length; j++) {
            for (int i = 0; i < matrix_[0].length; i++) {
                output[i][j] = matrix_[j][matrix_.length - i - 1];
            }
        }
        
        if(n > 0) output = rotateMatrix2D(output, n * 90);
     
    }
    else
    {
        for (int j = 0; j < matrix_.length; j++) {
            for (int i = 0; i < matrix_[0].length; i++) {
                output[i][j] = matrix_[matrix_.length - j - 1][i];
            }
        }
        
        if(n > 0) output = rotateMatrix2D(output, n * -90);
    }

      return output;
      
}

float[][] transposeMatrix2D(float[][] matrix_){
  
  float[][] out = new float[matrix_.length][matrix_[0].length];
  
  for(int i = 0; i < matrix_.length; i++){
    for(int j = 0; j < matrix_.length; j++){
  
        out[j][i] = matrix_[i][j];
      
    }
  }
  
  return out;
  
  
}

String displayMatrix2D(float[][] matrix_){
  
     String output = "";
     for(int j = 0; j < matrix_.length; j++){
       
      String currentLine = "";
      
      for(int i = 0; i < matrix_[0].length; i++){
       
          currentLine += nf(matrix_[i][j], 2, 0) + " ";
        
      }
      
      output += currentLine + "\n";
      
     } 
     
     return output;
  
}
