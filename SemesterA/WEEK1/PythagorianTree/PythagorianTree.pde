/*
 Aim
 ---
 To write a simple recursive program for classical L-system tree with 45°.
 http://en.wikipedia.org/wiki/L-system | Example 2
 
 This string can be drawn as an image by using turtle graphics, where each symbol 
 is assigned a graphical operation for the turtle to perform. 
 For example, in the sample above, the turtle may be given the following instructions:

 0: draw a line segment ending in a leaf
 1: draw a line segment
 [: push position and angle, turn left 45 degrees
 ]: pop position and angle, turn right 45 degrees
 
 Research futher 'turtle graphics' topic. Miss my Valiant Turtle.
 
 Process
 -------
 
 I have used pushMatrix(), pullMatrix(), translate() and rotate() methods 
 with matrixes and, for me, it is the most logical way to do it.
 
 For a better understanding of translate geometry I did a small sketch to play with translate/rotate
 methods:
 
            void setup(){
            size(800, 800);
            
            pushMatrix();
            translate(width/2, height/2);
            rotate(radians(45));
    
            line(0, 0, -200, 0);
  
            line(0, 0, 0, -200);
    
            redCross(width/2, height/2);
            }
            
            void redCross(float x, float y)
            {
            stroke(#FF0000);
            line(x-3, y, x+3, y);
            line(x, y-3, x, y+3);
            }

 Comments
 --------
 
 Shortcuts CMD + [ or ] for shifting selected block and
           CMD + / for turning block work in Processing
           as in XCode and OpenFrameworks
           
 It is autumn now, so that's why translating pivot points are in these tones.
 There is no symmetry in these points, so right part is "falling down" like yellowed leaves.
 
 Evaluation
 ----------
 
 Bugs: Doesn't work well with angles bigger than 45°.
 Extensions: Replace pushMatrix(), translate() and rotate() with trigonometry formulas.
 
 Author: Vladimir V. Kuchinov
 Date: 14/10/2004
 
*/
import processing.pdf.*;

int steps = 10;
int set_angle = 45;

void setup() {
  
  size(900,750);
  background(0);
  stroke(255);
  smooth();
  beginRecord(PDF, "output.pdf");
  lTree(width/2,  height, width/2 + 180, steps);
  endRecord();
}
 
// x starting point, size element, y starting y, steps (iterations)
void lTree(float x, float y, float elementSize, int level) {
  if(level > 0) {
    
    //degree to radians
    //tangent of 45°: 1, -45°: -1
    
    float angle = radians(set_angle);
    float w = elementSize - x;
    
    line(x, y, x, y-w);

    //Good method instead of sqrt((x - size)^2 + (y1 - y2)^2)
    float d = dist(elementSize, y-w, x+w/2, y-1.5*w);
 
    //left branch
    //stroke(#FF0000);
    redCross(x, y-w);
    stroke(255);
    
    pushMatrix();
    translate(x, y-w);
    rotate(-angle);
    lTree(0, 0, d,level-1);
    popMatrix();
 
    //right branch
    redCross(x+w/2, y-w/2);
    stroke(255);
    
    pushMatrix();
    translate(x + w/2, y - w/2);
    rotate(angle);
    lTree(-d, 0, 0, level-1);
    popMatrix();
    
  }
}

void redCross(float x, float y)
{
colorMode(HSB);
stroke(random(10,50), 255, 255);
line(x-3, y, x+3, y);
line(x, y-3, x, y+3);
}
