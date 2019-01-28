/*

Rotating Voronoi & Manhattan Diagrams
just a very short experiment before lunch

+ weight test [press BACKSPACE to turn it on/off]

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

color[] inks = new color[9];

ArrayList<Node> nodes = new ArrayList<Node>();
float rad = 150.0;
float speed = 0.8;

int count = 0;

boolean weightParameter = false;


void setup(){
  
  size(500, 500);
  
  inks[0] = color(0x1E0678);
  inks[1] = color(0xC7395D);
  inks[2] = color(0xF93087);
  inks[3] = color(0xF2E611);
  inks[4] = color(0x3C33B8);
  inks[5] = color(0x6D70CF);
  inks[6] = color(0x8EE740);
  inks[7] = color(0xEAFD87);
  inks[8] = color(0xFDA0A2);

  nodes.add(new Node(width/2, height/2, 0, 2));
  
  for(int n = 0; n < 18; n++){
    float angle = 360.0/18.0*n;
    float x = width/2 + sin(radians(angle + 30)) * rad*1.6;
    float y = width/2 + cos(radians(angle + 30)) * rad*1.6;
    nodes.add(new Node(x, y, angle, count));
    count++;
  }
    
  //nodes with weight value
  for(int n = 0; n < 18; n++){
    float angle = 360.0/18.0*n;
    float x = width/2 + sin(radians(angle)) * rad;
    float y = width/2 + cos(radians(angle)) * rad;
    nodes.add(new Node(x, y, angle, count, random(0.8, 2.5)));
    count++;
  }
  
  println(nodes.size());
  
  for(int n = 0; n < 18; n++){
    float angle = 360.0/18.0*n;
    float x = width/2 + sin(radians(angle)) * rad * 0.75;
    float y = width/2 + cos(radians(angle)) * rad * 0.75;
    nodes.add(new Node(x, y, angle, count));
    count++;
  }
  
  
}

void draw(){
  
  background(0);
  
  stroke(255);
  strokeWeight(2.5);
  
  for(int n = 19; n < nodes.size(); n++){
     if(n < 37)  { nodes.get(n).angle += speed; nodes.get(n).updateXY(1.0); } else {nodes.get(n).angle -= speed * 0.8; nodes.get(n).updateXY(0.75);  }

  }
  

  
  //drawVoronoi();
  drawManhattan();
  
}

void drawVoronoi() {
  
  loadPixels();

  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      float minDist = width+height;
      int closest = 0;

      for (int n = 0; n < nodes.size(); n++)
      {
        Node defNode = nodes.get(n);
        
        //Eucledean distance sqrt((x1 - x2)^2 + (y1 - y2)^2)
        float dist = dist(x, y, defNode.x, defNode.y);
        if (dist < minDist)
        {
          closest = n;
          minDist = dist;
        }
      }
      pixels[y * width + x] = (int)nodes.get(closest).itsColor;
    }
  }
  
  updatePixels();
  
}

void drawManhattan() {
  
  loadPixels();

  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      float minDist = width + height;
      int closest = 0;

      for (int n = 0; n < nodes.size(); n++)
      {
        Node defNode = nodes.get(n);
        
        //Manhattan distance
        //Math.abs(x1 - x2) + Math.abs(y1 - y2);
        float dist = 0.0;
        
        if(!weightParameter) { dist =  abs(x - defNode.x) + abs(y - defNode.y); } 
        else { dist =  (abs(x - defNode.x) + abs(y - defNode.y)) * defNode.itsWeight; }
        
        if (dist < minDist)
        {
          closest = n;
          minDist = dist;
        }
      }
    pixels[y * width + x] = (int)nodes.get(closest).itsColor;
    }
  }
  updatePixels();

}


class Node{
  
  float x, y;
  float angle;
  color itsColor;
  float itsWeight = 1.0;
 
  Node(float x_, float y_, float a_, int c_){ 
   
    x = x_; y = y_; 
    angle = a_;
    
    itsColor = inks[c_ % 9];
  }
  
  Node(float x_, float y_, float a_, int c_, float weight_){ 
   
    x = x_; y = y_; 
    angle = a_;
    
    itsColor = inks[c_ % 9];
    itsWeight = weight_;
    
  }
  
  void updateXY(float rad_){
    
    x = width/2 + sin(radians(angle)) * rad*rad_;
    y = width/2 + cos(radians(angle)) * rad*rad_;
    
  }
  
}

void keyPressed() {
  
  if (keyCode == BACKSPACE) {

    if(weightParameter) { weightParameter = false; } else { weightParameter = true; }

  }
}

