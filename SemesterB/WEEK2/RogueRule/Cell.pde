class Cell {

  int indx, x, y, state;

  Cell(int i_, int x_, int y_, int s_) {
    x = x_;
    y = y_;
    state = s_;
    indx = i_;
  }  

   void update() {
    float summ = 0;
    if((x > 0 && x < GRID - 1) && (y > 0 && y < GRID - 1))
    {
  
    //if(x == 1) println(indx);
    summ += cells.get(indx - 1).state;
    summ += cells.get(indx + 1).state;
    summ += cells.get(indx - GRID - 1).state;
    summ += cells.get(indx - GRID).state;
    summ += cells.get(indx - GRID + 1).state;
    summ += cells.get(indx + GRID -1).state;
    summ += cells.get(indx + GRID).state;
    summ += cells.get(indx + GRID + 1).state;
    
    state = round((summ/8) + 1);
    if(state > 255) state = 0;
    
    }
    
    else { state = 0; }
    
  }
  
  void draw() {
    noStroke();
    colorMode(HSB);
    fill(255 - state, 255, 255);
    rect(x *CELL, y * CELL, CELL, CELL);
  }
}

