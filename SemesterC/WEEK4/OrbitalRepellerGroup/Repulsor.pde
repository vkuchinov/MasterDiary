class Repulsor {

    float x, y;
    float angle = 69.0;
    float r;
    float size = 45;
    int type = 0; //0: static, 1: mouse
    
    Repulsor() {
    
          type = 1;
          r = 220;
          x = cos(radians(angle)) * r ;
          y = sin(radians(angle)) * r;
          
    } 
    
    Repulsor(float x_, float y_, float size_){
      
          x = x_; y = y_; size = size_;
    }

    void draw() {
    
          if(type == 1){
            
          x = mouseX - width / 2; y = mouseY - height / 2;
          float rad = atan2(y, x);
          if(rad < 0.0) { angle = map(rad, -PI, 0, 180, 360); }
          else { angle = map(rad, 0, PI, 0, 180);  }
          
          noStroke();
          fill(255, 0, 255);
          ellipseMode(CENTER);
          ellipse(x, y, 64, 64);
          
          }
          
          else {
            
            noStroke();
            fill(255, 0, 255);
            ellipseMode(CENTER);
            ellipse(x, y, size, size);
          
          }
          
          
    }
}

class RepulsorGroup extends ArrayList<Repulsor>{
  
    void addNew() { int i = (int)random(1, this.size()); this.remove(i); 
    
      float r = random(160, 240);
      float a = random(-PI, PI);
      float s = random(5, 12);
      
      Repulsor r2 = new Repulsor(r * cos(a), r * sin(a), s);
      repulsors.add(r2);
    
  };
    void draw() { for(Repulsor r : this) { r.draw(); } }
  
}
