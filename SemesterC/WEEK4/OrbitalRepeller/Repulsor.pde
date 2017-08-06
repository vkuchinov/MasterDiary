class Repulsor {

    float x, y;
    float angle = 69.0;
    float r;
    
    Repulsor() {
    
          r = 220;
          x = cos(radians(angle)) * r ;
          y = sin(radians(angle)) * r;
          
    } 

    void draw() {
    
          x = mouseX - width / 2; y = mouseY - height / 2;
          float rad = atan2(y, x);
          if(rad < 0.0) { angle = map(rad, -PI, 0, 180, 360); }
          else { angle = map(rad, 0, PI, 0, 180);  }
          
          noStroke();
          fill(255, 0, 255);
          ellipseMode(CENTER);
          ellipse(x, y, 64, 64);
    }
}

