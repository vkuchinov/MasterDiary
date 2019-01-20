class UI {
  float posX, posY, size, margins; 
  boolean clicked = false;
  boolean over = false;
  color fixedColor = color(random(200, 240));

  UI() {
    size = width/4;
  }

  UI(float initX, float initY, float initSize, float initMargins)
  {
    posX = initX;
    posY = initY;
    size = initSize;
    margins = initMargins;
  }

  void update(int miceX, int miceY, Species source) {
    if (!clicked) {
      if (miceX >= posX && miceX < posX + size && miceY >= posY && miceY < posY + size)
      {
        noStroke();
        fill(255, 255, 0);
        rect(posX, posY, size, size);
        fill(32, 32, 32);
        rect(posX + margins, posY + margins, size - 2*margins, size - 2*margins);
      }
      else
      {
        noStroke();
        fill(16, 16, 16);
        rect(posX, posY, size, size);
      }
    }
    fill(255);
    
    //49+49: 98/7 = 14x
    image(source.getRaster(), 27 + posX, 27 + posY, 99, 99);
    
    //textFont(font, 24);
    //textAlign(CENTER, CENTER);
    //text(source.dna, posX + size/3, posY + size/10, 60, 120);
  }
}

