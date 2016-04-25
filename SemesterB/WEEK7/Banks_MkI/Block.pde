class Block {

  PVector position;
  int state = 0;
  int updatedState;
  int index;
  boolean margins = false;

  Block(int x, int y, int s, boolean m) {

    position = new PVector(x, y); 
    state = s;
    updatedState = s;
    margins = m;
  }

  private void draw() {

    fill(state); 
    rect(position.x, position.y, pixelSize, pixelSize);
  }

  private void update() {

    state = updatedState;
  }

  private void change() {

    /*
    
     BANK I
     
     dark grey   -12632257   0x3F3F3F : empty     |   0
     red         -55808      0xFF2600 : active    |   1
     */

    //C,N,E,S,W,C

    if (!margins)
    {    

      int heads = 0;

      String seq = "";
      if (state ==  -55808 ) { 
        seq+="1";
      } else { 
        seq+="0";
      }

      Block N  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - map.width/pixelSize));
      if (N.state ==  -55808 ) { 
        seq+="1";
      } else { 
        seq+="0";
      }
      Block E  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + 1));
      if (E.state ==  -55808 ) { 
        seq+="1";
      } else { 
        seq+="0";
      }
      Block S  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + map.width/pixelSize));
      if (S.state ==  -55808 ) { 
        seq+="1";
      } else { 
        seq+="0";
      }
      Block W  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - 1));
      if (W.state ==  -55808 ) { 
        seq+="1";
      } else { 
        seq+="0";
      }

      //Rule 1
      if (seq.equals("11100") == true ) { 
        updatedState = -12632257;
      }
      if (seq.equals("10110") == true ) { 
        updatedState = -12632257;
      }
      if (seq.equals("10011") == true ) { 
        updatedState = -12632257;
      }
      if (seq.equals("11001") == true ) { 
        updatedState = -12632257;
      }
      
      //Rule 2
      if (seq.equals("00111") == true ) { 
        updatedState = -55808;
      }
      if (seq.equals("01011") == true ) { 
        updatedState = -55808;
      }
      if (seq.equals("01101") == true ) { 
        updatedState = -55808;
      }
      if (seq.equals("01110") == true ) { 
        updatedState = -55808;
      }
      
      
      //Rule3
      if (seq.equals("01111") == true ) { 
        updatedState = -55808;
      }

    }
  }
}

