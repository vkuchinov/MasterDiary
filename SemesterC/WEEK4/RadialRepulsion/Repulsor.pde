class Repulsor {

    float x, y;
    float angle = 69.0;
    
    Repulsor() {
    
          x = cos(radians(angle)) * 220;
          y = sin(radians(angle)) * 220;
          
    } 

    void draw() {
    
          noStroke();
          fill(255);
          ellipseMode(CENTER);
          ellipse(x, y, 64, 64);
    }
}

