class Cluster {

  int index;
  PVector position = new PVector(0, 0);
  float radius;
  float state = 0;
  float mult = 0;

  Cluster(int i, float x, float y, float r, float s, float m) {  

    index = i;
    position.x = x;
    position.y = y;
    radius = r;
    state = s;
    mult = m;
  }  

  void draw() {

    fill(drawColor);
    stroke(drawColor);

    /*
    
     Just under 70% of instances will tend to have a value one standard deviation either side of the average (in this case, values between -15 and 15: see highlighted area of graph)1;
     Just under 95% of instances will tend to have a value two standard deviations either side of the average (between -30 and 30 in this case);
     More than 99% of instances will tend to have a value three standard deviations either side of the average (between -45 and 45 in this case).
     
     */

    float rectWidth = map(Math.abs(state), 0, 50, 1, radius/3);
    rectMode(CENTER);
    rect(position.x + radius/2, position.y + radius, rectWidth*mult, radius*2);
  }
}

