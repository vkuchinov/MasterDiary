class Cluster {

  int index;
  PVector position = new PVector(0, 0);
  float radius;
  float state = 0;
  float mult = 0;
  float total = 0;
  float strokeW;
  int offset;

  Cluster(int i, float x, float y, float r, float s, float m, float t, float sw, int o) {  

    index = i;
    position.x = x;
    position.y = y;
    radius = r;
    state = s;
    mult = m;
    total = t;
    strokeW = sw;
    offset = o;

  }  

  void draw() {

    noFill();
    stroke(drawColor);
    strokeWeight(strokeW);
    
    for(int o = 0; o < offset; o++){
    
    beginShape();
    for(int p = 0; p < state; p++){
    vertex(position.x + total/state*p, position.y - o*12);
    vertex(position.x + (total/state/2) + total/state*p, position.y - mult - o*12);  
      
    }
    vertex(position.x + total/state*state, position.y - o*12);
    endShape();
    
    }
    
    
  }
}

