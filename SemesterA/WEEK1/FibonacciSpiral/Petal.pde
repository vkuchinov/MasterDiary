class Petal {
  
  float x = 0.0;
  float y = 0.0;
  
  float rotation = 0.0;
  float scaleRatio = 1;
  
  int index;
  
  color background, foreground;
  
  Petal(int i_){
    
    index = i_;
    
  }
  
  void render (){
    
      colorMode(HSB);
      float cInc = map(index, 0, NUM_PETALS, 20, 240);
      
      background = color(cInc, 100, 250);
      foreground = color(cInc, 240, 240);
      
      pushMatrix();
      
      translate(this.x, this.y);
      fill(this.background, 32);
      rotate(this.rotation);
      scale(this.scaleRatio, this.scaleRatio);
      rect(-10.0, -1.0, 20.0, 2.0);
      ellipse(0.0, 0.0, 10.0, 12.0);
      ellipse (0.0, 0.0, 15.0, 15.0);
      fill(this.foreground);
      ellipse(0, 0, 8, 8);
      fill(0);
      ellipse(0, 0, 5.0, 5.0);
      
      popMatrix();
  }
}

