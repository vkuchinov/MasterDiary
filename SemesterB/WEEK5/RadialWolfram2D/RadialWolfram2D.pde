/*

  RADIAL WOLFRAM CELLULAR AUTOMATA
 
  FUTURE READING:
  http://curvatureofthemind.com/tag/canvas/
  
  @author Vladimir V. KUCHINOV
  @email  helloworld@vkuchinov.co.uk

*/

int parts = 8;
int rad = 50;

float mult = 4.2;
float len = (rad*2*PI)/parts*mult;

Wolfram wolfram;

void setup() {
  
  size(850, 850, "processing.core.PGraphicsRetina2D");
  
  //Wolfram(rule #, parts)
  wolfram = new Wolfram(73, parts);
  
}

void draw() {
  
  float len = (rad*2*PI)/parts*mult;
  
  parts = 8;
  translate(width/2, height/2);
  background(0);
  rad = 50;
  noStroke();
  
  for (int r = 0; r < 64; r++) {
    int[] step = wolfram.renderGen(r, 8);
    for (int p = 0; p < parts; p++) {
      
      pushMatrix();
      PVector xyz = setXY(new PVector(0, 0), rad, p*(360f/parts));
      translate(xyz.x, xyz.y);
      rotate(radians(-90 + p*(360f/parts)));
      rectMode(CENTER);
      rotate(radians(90));
      if(step[p] == 0)  fill(255); else noFill();
      rect(0, 0, len/2, len/2);
      popMatrix();
    }
    
    parts += 8;
    rad += 10 - r*0.15;
    len *= 0.96;
  }

}


PVector setXY (PVector xy, float dist, float ang) {
  PVector output = new PVector(xy.x, xy.y);  
  PVector a = PVector.fromAngle(radians(ang)); 
  a.mult(dist);
  output.add(a);
  return output;
}

