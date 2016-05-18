/*
 Aim
 ---
 While I am doing research on Cellular Automata and Genetic Algorithms,
 here is a simple sketch for Week 3 with nested loops.
 
 I have picked M.C. Escher as starting point.
 
 Process
 -------
 Short and simple code for generating pattern of pseudo 3D cubes
 with a rotation of colours to create even more optical madness.
 
 I have written a small universal function for shifting array element
 by one. Hope it will be usefull later on.
 
 PS: I didn't use trigonometry to build 3D-cubes in more elegant ways
 leaving to draw any shapes I want. The pivot point is where all three
 pseudo planes meet. 
 
 Comments
 --------
 Hello Q-Bert!
 
 Evaluation
 ----------

 Bugs: None.
 Extensions: Use M.C. Escher as matrix for making tones.
             As outcome - Escher's portrait out of cubes.
             Image 48x64 pixels.
             
             Draw: Explore ArrayList by setting each cube as
             an object within it and draw() to chenge one or two
             cubes dynamically to obscure viewers.
 
 Author: Vladimir V. Kuchinov
 Date: 18/09/2004
 
*/

import processing.pdf.*;

static int cube_size = 100;

int start_x = cube_size/2;
int start_y = cube_size/4;

int shift = -cube_size/2;

//Three colours array
int[] colours = {
 255, 180, 60
};

void setup() {
 background(0);
 size(800, 800);
 
 beginRecord(PDF, "output.pdf");
 
 smooth();
 noStroke();
 
//println("x: ",height/cube_size + 1);
//println("y: ",height/(0.9*cube_size) + 2);
 
 for (int ypos = 0; ypos < height/(0.9*cube_size) + 2; ypos++)
 {
   for (int xpos = 0; xpos < width/cube_size + 1; xpos++)
   {
     qBert(start_x + cube_size*xpos + shift, start_y + 0.9*cube_size*ypos);
   }
   if (ypos%2 == 0) shift = 0;
   else shift = -cube_size/2;
 }
 
 endRecord();
 
}

void qBert(float x, float y) {

 colours = shiftArray(colours);

 //Upper plane
 fill(colours[0]);
 beginShape();
 vertex(x, y);
 vertex(x + -cube_size/2, y + -cube_size/4);
 vertex(x, y + -cube_size/2);
 vertex(x + cube_size/2, y + -cube_size/4);
 vertex(x, y);
 endShape();

 //Left plane
 fill(colours[1]);
 beginShape();
 vertex(x, y);
 vertex(x + -cube_size/2, y + -cube_size/4);
 vertex(x + -cube_size/2, y + 0.4*cube_size);
 vertex(x, y + 0.65*cube_size);
 vertex(x, y);
 endShape();

 //Right plane
 fill(colours[2]);
 beginShape();
 vertex(x, y);
 vertex(x + cube_size/2, y + -cube_size/4);
 vertex(x + cube_size/2, y + 0.4*cube_size);
 vertex(x, y + 0.65*cube_size);
 vertex(x, y);
 endShape();
}

//Simple and universal function to shift element in array by one to the left.

int[] shiftArray(int[] source) {

 int firstElement;
 firstElement = source[0];
 int[] shiftedArray = new int[source.length];
 //Useful method, keep implementing it further
 arrayCopy(source, 1, shiftedArray, 0, source.length - 1);
 shiftedArray[shiftedArray.length-1] = firstElement;
 //printArray(shiftedArray);
 return shiftedArray;
}
