/*

Wolfram CA based on 5 neighbours
inspired by "A New Kind of Science" book

rendering horizontaly to save space


@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;
Random seed = new Random(123456);


PImage grid = createImage(1000, 400, RGB);

//should be 32 states, instead of classical 8
//see reference image

//00000 - 11111 [0 - 31]

String masterMask = "";
int[] masterRule = new int[32];

int[][] wolframPattern = new int[500][199];

void setup() {
 
  size(1040, 440);
  background(128);
  
  char[] chars = getHeximals();
  
  for(int c = 0; c < 4; c++){
     masterMask += str(chars[seed.nextInt(16)]);
  }
  
  convertMaskToRule();
  println(masterRule);
  applyWolfram(masterRule, 199, 500);
  
  for(int x = 0; x < 500; x++){
    for(int y = 0; y < 199; y++){
      noStroke(); fill(random(255));
      if(wolframPattern[x][y] == 1) { fill(0); } else { fill(255); }
      ellipse(20 + x * 2.0, 20 + y * 2.0, 2.0, 2.0);
    }
  }
  
  //println(wolframPattern[1]);
  
}


char[] getHeximals(){
  
  char[] output = new char[16];
  
  //0-9
  for(char c = '0'; c <= '9'; c++){
    output[(int)c - 48] = c;
  }

  //0-9
  for(char c = 'A'; c <= 'F'; c++){
    output[(int)c - 55] = c;
  }
  
  return output;
  
}

void convertMaskToRule(){
  
  short value2 = (short)random(255); short value1 = (short)random(255);
  String parsed = binary(value2, 16) + binary(value1, 16);

  for(int r = 0; r < 32; r++){
    if(parsed.charAt(r) == '1') { masterRule[r] = 1; } else { masterRule[r] = 0; } 
  }
  
}

void applyWolfram(int[] rule_, int Ydim_, int Xdim_){

  for (int n = 0; n < Ydim_; n++) {
      if(seed.nextInt(50) > 45) { wolframPattern[0][n] = 1; } else {  wolframPattern[0][n] = 0; }
    }
  
   
  for (int gen = 1; gen < Xdim_; gen++)
  {

    for (int i = 2; i < Ydim_ - 2; i++) {
    
    String pattern = "";
    for(int c = i - 2; c < i + 3; c++){ pattern += str(wolframPattern[gen - 1][c]); }
    wolframPattern[gen][i] = masterRule[31 - Integer.parseInt(pattern, 2)];
    }
  //if(gen < 2) println(wolframPattern[gen]);
  }
  
}

