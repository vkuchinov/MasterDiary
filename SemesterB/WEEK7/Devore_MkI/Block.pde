class Block {

  PVector position;
  int state = 0;
  int updatedState;
  int index;
  
  boolean margins = false;

  boolean emitter = false;


  Block(int x, int y, int s) {

    position = new PVector(x, y); 
    state = s;
    updatedState = state;
  }

  private void draw() {

    fill(state); 
    rect(position.x, position.y, pixelSize, pixelSize);
  }

  private void update() {

  state = updatedState;
    
  }

  private void change() {

  //0  black       0x3F3F3F     -12632257
  //1  blue        0x0433FF     -16501761
  //2  red         0xFF2600     -55808
  //3  green       0x00F900     -16713472
  //4  yellow      0xFFFB00     -1280
  //5 magenta     0xFF40FF     -48897
  //6  white       0xFFFFFF     -1
  //7  cyan        0x00FDFF     -16712193

  if(!margins){
    
    //rotate4 set
    
    String sequence = str(state2index(state));
    
    //clockwise from 12 o'clock
    
    Block N  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - map.width/pixelSize)); sequence += str(state2index(N.state));
    //Block NE  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - map.width/pixelSize + 1)); sequence += str(state2index(NE.state));
    Block E  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + 1)); sequence += str(state2index(E.state));
    //Block SE  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + map.width/pixelSize + 1)); sequence += str(state2index(SE.state));
    Block S  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + map.width/pixelSize)); sequence += str(state2index(S.state));
    //Block SW  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize + map.width/pixelSize - 1)); sequence += str(state2index(SW.state));
    Block W  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - 1)); sequence += str(state2index(W.state));
    //Block NW  = blocks.get(int(position.y/pixelSize*map.width/pixelSize + position.x/pixelSize - map.width/pixelSize - 1)); sequence += str(state2index(NW.state));

    updatedState = encodeRule(sequence);
    
    }
  }
  
  private int encodeRule(String seq_){
    
  /*
 
  var a={1,2}
  0,a,3,4,5,a
  
  equals to
  
  013451 //1
  023452 //2

  */
  
  int s_ = seq_.charAt(0) - 48, tmpState = s_;
  //println(s_);
  //println(seq_);
  
  //rotate4 means that neighbours coud be rotated???
  //I guess yes!
  
  String[] rules5 = new String[4];
  
  for (int i = 0 ; i < rules.length; i++) {
  tmpState = rules[i].charAt(5) - 48;
  rules5[0] = str(rules[i].charAt(0)) + str(rules[i].charAt(1)) + str(rules[i].charAt(2)) + str(rules[i].charAt(3)) + str(rules[i].charAt(4));
  rules5[1] = str(rules[i].charAt(0)) + str(rules[i].charAt(2)) + str(rules[i].charAt(3)) + str(rules[i].charAt(4)) + str(rules[i].charAt(1));
  rules5[2] = str(rules[i].charAt(0)) + str(rules[i].charAt(3)) + str(rules[i].charAt(4)) + str(rules[i].charAt(1)) + str(rules[i].charAt(2));
  rules5[3] = str(rules[i].charAt(0)) + str(rules[i].charAt(4)) + str(rules[i].charAt(1)) + str(rules[i].charAt(2)) + str(rules[i].charAt(3));
  
  if(rules5[0].equals(seq_) == true) { s_ = tmpState;  }
  if(rules5[1].equals(seq_) == true) { s_ = tmpState;  }
  if(rules5[2].equals(seq_) == true) { s_ = tmpState;  }
  if(rules5[3].equals(seq_) == true) { s_ = tmpState;  }
  
  }
  
  return index2state(s_);
 
  }
      
  private int state2index(int c){
  
  //order
  //0: black, 1: blue, 2: red, 3: green, 4: yellow, 5: magenta, 6: white, 7: cyan
  //black, blue, red, green, yellow, magenta, white, cyan
  
  //0  black       0x3F3F3F     -12632257
  //1  blue        0x0433FF     -16501761
  //2  red         0xFF2600     -55808
  //3  green       0x00F900     -16713472
  //4  yellow      0xFFFB00     -1280
  //5  magenta      0xFF40FF     -48897
  //6  white       0xFFFFFF     -1
  //7  cyan        0x00FDFF     -16712193
    
    
  int indx = 0;
  
    switch(c){
    case -12632257: //black
    indx = 0;
    break;
    
    case -16501761: //blue
    indx = 1;
    break;
    
    case -55808: //red
    indx = 6;
    break;
    
    case -16713472: //green
    indx = 2;
    break;
    
    case -1280: //yellow
    indx = 3;
    break;
    
    case -48897: //magenta
    indx = 5;
    break;
    
    case -1: //white
    indx = 7;
    break;
    
    case -16712193: //cyan
    indx = 4;
    break;

    }
    
  return indx;
  }
  
  private int index2state(int i){
    
  //black, blue, green, yellow, cyan, magenta, red, white

  int c = 0;
  
    switch(i){
    case 0: //black
    c = -12632257;
    break;
    
    case 1: //blue
    c = -16501761;
    break;
    
    case 6: //red
    c = -55808;
    break;
    
    case 2: //green
    c = -16713472;
    break;
    
    case 3: //yellow
    c = -1280;
    break;
    
    case 5: //magenta
    c = -48897;
    break;
    
    case 7: //white
    c = -1;
    break;
    
    case 4: //cyan
    c = -16712193;
    break;

    }
    
  return c;
  }
}
