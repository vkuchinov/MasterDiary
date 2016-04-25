//for loop

int steps = 20;
int biggest = 750;
int[] numbers = {750, 666, 444, 222, 190, 140, 100, 88, 78, 56, 15};
int[] numbersB = { 15, 56, 78, 88, 100, 140, 190, 222, 444, 666, 750};

void setup() {
  size(800, 800);
  noStroke();
  rectMode(CENTER);
  for (int r = 0; r < steps; r++)
  {

    fill(map(r, 0, steps, 128, 0));
    float size = map(r, 0, steps, biggest, 0);
    rect(width/2, height/2, size, size);
  }

  //reverse array
  numbersB = reverse(numbersB);
  
  for(int var:numbersB) {
    colorMode(HSB);
    fill(map(var, 0, 750, 128, 0), 255, 255);
    rect(width/2, height/2, var, var);
  }
}

