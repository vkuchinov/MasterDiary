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
    strokeWeight(mult);
    
    for(float y = position.y; y > position.y - radius*30; y--){
    float x = position.x + cos(2*PI*y/120 + 5)*5; 
    point(state + x, y); 
    }
  }
}

