/*

   TO DO LIST
   [-] update animation to arraylist
   [-] speed rate to DNA {0-16} 4-bits
   [-] fire pattern to DNA 16-bits

*/

import java.util.Random;
import java.util.Collections;
import java.util.Arrays;

class Species{
  
     PImage bitmap;
     
     String DNA;
     
     int[][] bitmaps = new int[2][81];
     int[][] animation = new int[8][6];
     int[] colors = new int[2];
     
     boolean frame = true;  //0, 1
     
     Random seed;
     
     Species(int seed_){
       
       seed = new Random(seed_);
       
       //colors
       int c = seed.nextInt(192);
       String colorA = binary(c, 8);
       String colorB = binary((64 + c), 8);
       
       HashMap<Integer, Integer> data1 = new HashMap<Integer, Integer>();
       HashMap<Integer, Integer> data2 = new HashMap<Integer, Integer>();
       
       for(int e = 0; e < 6 + seed.nextInt(32); e++){
             data1.put(seed.nextInt(45), 1);
       }
       
       for(int e = 0; e < 4 + seed.nextInt(16); e++){
              data2.put(seed.nextInt(45), 1);
       }
       
       String data1String = "", data2String = "";
       
       for(int p = 0; p < 45; p++){
        
            if(data1.containsKey(p)) data1String += "1"; else data1String += "0";
            if(data2.containsKey(p)) data2String += "1"; else data2String += "0";
       }
       
       
       String toAnimate = "";
       int numToAnimate = 1 + seed.nextInt(4);
      
       ArrayList<Integer> frameList = new ArrayList<Integer>();
       for(int f = 1; f < 45; f++){
            frameList.add(f); 
       }
       
       Collections.shuffle(frameList);
       
       for(int a = 0; a < numToAnimate * 2; a += 2){
         
             toAnimate = binary(frameList.get(a), 8) + binary(frameList.get(a + 1), 8) + toAnimate;

       }
       
       while(toAnimate.length() < 150){
            
              toAnimate = "0" + toAnimate; 
             
           }
           
           
      String DNA_ = data1String + data2String + toAnimate + colorA + colorB;
           
      parseDNA(DNA_);

     }
     
     Species(String DNA_){
       
         parseDNA(DNA_);
       
     }
     
     void draw(){
       
          bitmap = createImage(9, 9, HSB);
          
          colorMode(HSB);
          
          //update animation
          updateBitmaps(frame, bitmaps);
          
          color c1 = color(colors[0], 240, 240);
          color c2 = color(colors[1], 240, 240);
          
          int counter = 0;
          
          for(int x = 0; x < 9; x++){
              for(int y = 0; y < 9; y++){
                
                        if(bitmaps[0][counter] != 1 || bitmaps[1][counter] != 1){
                        if(bitmaps[0][counter] == 1) bitmap.set(x, y, c1); 
                        if(bitmaps[1][counter] == 1) bitmap.set(x, y, c2);
                        
                        }
                        else{
                      
                        //simple blending 
                        //A + B / φ : using golden ratio to amplify harmony 
                        int c3 = floor((c1 + c2)/1.6180);
                        bitmap.set(x, y, c3);
                        
                        }
                        if(bitmaps[0][counter] == 0 && bitmaps[1][counter] == 0) bitmap.set(x, y, color(0));

                    counter++;
                    
              }
          }
          
          image(bitmap, 0, 0, 180, 180);
          
          //change frame
          if(frameCount % 36 == 0) frame ^= true;

     }
     
       PImage getRaster(){
       
          bitmap = createImage(9, 9, HSB);
          
          colorMode(HSB);
          
          //update animation
          updateBitmaps(frame, bitmaps);
          
          color c1 = color(colors[0], 240, 240);
          color c2 = color(colors[1], 240, 240);
          
          int counter = 0;
          
          for(int x = 0; x < 9; x++){
              for(int y = 0; y < 9; y++){
                
                        if(bitmaps[0][counter] != 1 || bitmaps[1][counter] != 1){
                        if(bitmaps[0][counter] == 1) bitmap.set(x, y, c1); 
                        if(bitmaps[1][counter] == 1) bitmap.set(x, y, c2);
                        
                        }
                        else{
                      
                        //simple blending 
                        //A + B / φ : using golden ratio to amplify harmony 
                        int c3 = floor((c1 + c2)/1.6180);
                        bitmap.set(x, y, c3);
                        
                        }
                        if(bitmaps[0][counter] == 0 && bitmaps[1][counter] == 0) bitmap.set(x, y, color(16));

                    counter++;
                    
              }
          }

          
          return bitmap;

     }
     
     
     
     String getDNA(){
       
           String output = "";
           
           //parts
           String data1String = "", data2String = "";

            for(int p = 0; p < 45; p++){
                 data1String += str(bitmaps[0][p]);
                 data2String += str(bitmaps[1][p]);
            }             

           String animationString = "";
           for(int a = 0; a < 8; a++){
             
                 animationString = binary(animation[a][0], 8) + binary(animation[a][3], 8) + animationString;
             
           }
           
           
           while(animationString.length() < 150){
            
              animationString = "0" + animationString; 
             
           }
           
           //colors
           String color1String = binary(colors[0], 8);
           String color2String = binary(colors[1], 8);
           
           return data1String + data2String + animationString + color1String + color2String;
       
     }
     
     void parseDNA(String DNA_){
       
           if(DNA_.length() == 256) println ("DNA is valid");
           
           //parsing bitmap data
           for(int b = 0; b < 2; b++){ 
              for(int p = 0; p < 45; p++){
                   bitmaps[b][p] = Integer.parseInt(String.valueOf(DNA_.charAt(b*45 + p)));
              }
                         
           }
              
           //complete bitmap matices
           completeBitmapData(bitmaps);
           
           //parse animations
           for(int a = 0; a < 8; a++){

                   int index0 = unbinary(DNA_.substring(224 - a * 16, 232 - a * 16)); //index 1
                   if(index0 > 44) { index0 = index0 - 45; }
                   animation[a][0] = index0;
                   animation[a][1] = bitmaps[0][animation[a][0]]; //state A
                   animation[a][2] = bitmaps[1][animation[a][0]]; //state B
                   int index1 = unbinary(DNA_.substring(232 - a * 16, 240 - a * 16)); //index 2
                   if(index1 > 44) { index1 = index1 - 45; }
                   animation[a][3] = index1;
                   animation[a][4] = bitmaps[0][animation[a][3]]; //state A
                   animation[a][5] = bitmaps[1][animation[a][3]]; //state B
    
           }
           
           //parse colors
           colors[0] = unbinary(DNA_.substring(240, 248));
           colors[1] = unbinary(DNA_.substring(248, 256));
                      
     }
     
     void completeBitmapData(int[][] data_){
       
           for(int b = 0; b < 2; b++){ 
                  for(int p = 0; p < 36; p++){
                    
                       //0 - 8 > 80
                       
                       bitmaps[b][reverseIndex(p)] = bitmaps[b][p];
                       
                       //if(p < 9) bitmaps[b][72 + p] = bitmaps[b][p];
                       //if(p > 8 && p < 17) bitmaps[b][63 + p % 9 - 1] = bitmaps[b][p];
                       //if(p > 16 && p < 27) bitmaps[b][54 + p % 9 - 1] = bitmaps[b][p];
                       //if(p > 26) bitmaps[b][45 + p % 9] = bitmaps[b][p];
                  }
                             
           }
           
     }
     
     
     void updateBitmaps(boolean frame_, int[][] bitmaps_){
      
          if(frame){
          
              for(int a = 0; a < 8; a++){
               
                 bitmaps_[0][animation[a][0]] = animation[a][1];
                 bitmaps_[1][animation[a][0]] = animation[a][2];
                 bitmaps_[0][reverseIndex(animation[a][0])] = animation[a][1];
                 bitmaps_[1][reverseIndex(animation[a][0])] = animation[a][2];
                 
                 bitmaps_[0][animation[a][3]] = animation[a][4];
                 bitmaps_[1][animation[a][3]] = animation[a][5];
                 bitmaps_[0][reverseIndex(animation[a][3])] = animation[a][4];
                 bitmaps_[1][reverseIndex(animation[a][3])] = animation[a][5];
 
              }
            
          }
          
          else{

              for(int a = 0; a < 8; a++){

                 bitmaps_[0][animation[a][0]] = animation[a][4];
                 bitmaps_[1][animation[a][0]] = animation[a][5];
                 bitmaps_[0][reverseIndex(animation[a][0])] = animation[a][4];
                 bitmaps_[1][reverseIndex(animation[a][0])] = animation[a][5];
                 
                 bitmaps_[0][animation[a][3]] = animation[a][1];
                 bitmaps_[1][animation[a][3]] = animation[a][2];
                 bitmaps_[0][reverseIndex(animation[a][3])] = animation[a][1];
                 bitmaps_[1][reverseIndex(animation[a][3])] = animation[a][2];
                                 
              }
                 
          } 
          
          if(frameCount % 12 == 0) frame ^= true;
       
     }
     

     void animationToConsole(){
      
           println("animation frames");
          for(int a = 0; a < 8; a++){

            print(animation[a][0], animation[a][3], " ,");
              
          }
       
          println("");
              
     }
     
     int reverseIndex(int index_){
       
         int output = 0;
         
               if(index_ == 0)  output = 72;
               if(index_ == 1)  output = 73;
               if(index_ == 2)  output = 74;
               if(index_ == 3)  output = 75;
               if(index_ == 4)  output = 76;
               if(index_ == 5)  output = 77;
               if(index_ == 6)  output = 78;
               if(index_ == 7)  output = 79;
               if(index_ == 8)  output = 80;
               
               if(index_ == 9)   output = 63;
               if(index_ == 10)  output = 64;
               if(index_ == 11)  output = 65;
               if(index_ == 12)  output = 66;
               if(index_ == 13)  output = 67;
               if(index_ == 14)  output = 68;
               if(index_ == 15)  output = 69;
               if(index_ == 16)  output = 70;
               if(index_ == 17)  output = 71;
               
               if(index_ == 18)  output = 54;
               if(index_ == 19)  output = 55;
               if(index_ == 20)  output = 56;
               if(index_ == 21)  output = 57;
               if(index_ == 22)  output = 58;
               if(index_ == 23)  output = 59;
               if(index_ == 24)  output = 60;
               if(index_ == 25)  output = 61;
               if(index_ == 26)  output = 62;
               
               if(index_ == 27)  output = 45;
               if(index_ == 28)  output = 46;
               if(index_ == 29)  output = 47;
               if(index_ == 30)  output = 48;
               if(index_ == 31)  output = 49;
               if(index_ == 32)  output = 50;
               if(index_ == 33)  output = 51;
               if(index_ == 34)  output = 52;
               if(index_ == 35)  output = 53;
               
               if(index_ == 36)  output = 36;
               if(index_ == 37)  output = 37;
               if(index_ == 38)  output = 38;
               if(index_ == 39)  output = 39;
               if(index_ == 40)  output = 40;
               if(index_ == 41)  output = 41;
               if(index_ == 42)  output = 42;
               if(index_ == 43)  output = 43;
               if(index_ == 44)  output = 44;

         return output;

       
     }
     
  
}
