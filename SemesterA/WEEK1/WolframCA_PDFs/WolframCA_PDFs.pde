import processing.pdf.*;

PImage grid = createImage(381, 180, RGB);

int currentRule = 0;

int[] masterRule = { 0, 0, 0, 0, 0, 0, 0, 0 };

void setup() {
  size(401, 200);
  background(128);
}

void draw() {

  for (int r=0; r < 256; r++)
  {
    beginRecord(PDF, "outputs/rule_"+r+".pdf");

    setCurrentRule(r);
    for (int i = 0; i < grid.pixels.length; i++) {
      grid.pixels[i] = color(255, 255, 255);
    }
    //starting pixel
    grid.pixels[190] = color(0, 0, 0);
    image(grid, 10, 10);
  
  
  for (int gen = 1; gen < 180; gen++)
  {
    for (int i = 381*gen; i < 381*gen+381; i++) {

      color black = -16777216;
      color white = -1;

      int gap = i%381;

      color leftCell = grid.get(gap - 1, gen - 1);
      color centerCell = grid.get(gap, gen - 1);
      color rightCell = grid.get(gap + 1, gen - 1);

      //switch

      if (leftCell == black && centerCell == black && rightCell == black) if (masterRule[0] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
      if (leftCell == black && centerCell == black && rightCell == white) if (masterRule[1] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
      if (leftCell == black && centerCell == white && rightCell == black) if (masterRule[2] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
      if (leftCell == black && centerCell == white && rightCell == white) if (masterRule[3] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
      if (leftCell == white && centerCell == black && rightCell == black) if (masterRule[4] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
      if (leftCell == white && centerCell == black && rightCell == white) if (masterRule[5] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
      if (leftCell == white && centerCell == white && rightCell == black) if (masterRule[6] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
      if (leftCell == white && centerCell == white && rightCell == white) if (masterRule[7] == 0) grid.pixels[i] = color(white); 
      else grid.pixels[i] = color(black);
    }
    grid.updatePixels();
    image(grid, 10, 10);
  }
  endRecord();
}
noLoop();
exit();

}

void setCurrentRule(int rule)
{
  String binaryValue = binary(rule, 8);

  char[] binaries = new char[binaryValue.length()];
  for (int ch = 0; ch < binaryValue.length(); ch++)
  {
    binaries[ch] = binaryValue.charAt(ch);
  }

  int counter = 0;
  for (int element : masterRule)
  {
    masterRule[counter] = int(binaries[counter]) -48;
    counter++;
  }
}

