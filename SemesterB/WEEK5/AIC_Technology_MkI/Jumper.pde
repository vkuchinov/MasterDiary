class Jumper {

  int index;
  PVector position = new PVector(0, 0);
  int len; //in elements
  float radius;
  int orientation = 0; //0: horizontal, 1: vertical

  Jumper(int i, float x, float y, int l, float r, int o) {  
    
    index = i;
    position.x = x;
    position.y = y;
    radius = r;
    len = l; //length
    orientation = o;
    
  }  

  void draw() {

    fill(drawColor);
    stroke(drawColor);

    rect(position.x, position.y, len*radius, radius, radius/2, radius/2, radius/2, radius/2);
  }
}

