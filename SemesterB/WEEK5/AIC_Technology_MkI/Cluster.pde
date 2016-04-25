class Cluster {

  int index;
  PVector position = new PVector(0, 0);
  float radius;
  int state = 0;

  Cluster(int i, float x, float y, float r, int s) {  

    index = i;
    position.x = x;
    position.y = y;
    radius = r;
    state = s;
  }  

  void draw() {

    switch(state) {

    case 0: 
      noFill();
      noStroke();
      break;

    case 1:
      noFill();
      stroke(drawColor);
      break;

    case 2:
      fill(drawColor);
      stroke(drawColor);
      break;

    default:
      noFill();
      stroke(drawColor);
      break;
    }

    ellipse(position.x, position.y, radius, radius);
  }
}

