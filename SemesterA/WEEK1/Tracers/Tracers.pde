int breed = 32;
Tracer[] pointers = new Tracer[breed];

float speed = 15.0;

float lastTracer_x =0, lastTracer_y = 0;
color lastColour = color(0, 0, 0);

void setup() {
  
  size(800, 800, "processing.core.PGraphicsRetina2D");
  frameRate(30);

  noStroke();

  for (int t = 0; t < breed; t++)
  {
    pointers[t] = new Tracer(width/2, height/2);  
    pointers[t].update();
  }
}

void draw() {
  
  background(240);

  for (int t=0; t < breed; t++)
  {


    if (t != 0) { 
      stroke(lastColour); 
      line(lastTracer_x, lastTracer_y, pointers[t].xpos + pointers[t].move.x*pointers[t].speed, pointers[t].ypos + pointers[t].move.y*pointers[t].speed);
      lastTracer_x = pointers[t].xpos + pointers[t].move.x*pointers[t].speed; 
      lastTracer_y = pointers[t].ypos + pointers[t].move.y*pointers[t].speed; 
      lastColour = pointers[t].t_colour;
    } else { 
      lastTracer_x = pointers[t].xpos + pointers[t].move.x*pointers[t].speed; 
      lastTracer_y = pointers[t].ypos + pointers[t].move.y*pointers[t].speed; 
      lastColour = pointers[t].t_colour;
    }

    noStroke();

    if (pointers[t].xpos < 0 || pointers[t].xpos > width) pointers[t].move.x = - pointers[t].move.x;  
    if (pointers[t].ypos < 0 || pointers[t].ypos > height) pointers[t].move.y = - pointers[t].move.y;
    pointers[t].xpos = pointers[t].xpos + pointers[t].move.x*pointers[t].speed;
    pointers[t].ypos = pointers[t].ypos + pointers[t].move.y*pointers[t].speed;
    pointers[t].update();
  }
}

class Tracer { 
  float xpos, ypos, speed; 
  PVector move;
  color t_colour = color(random(0, 255), 255, 255);

  Tracer (float x, float y) {  
    ypos = y;  
    xpos = x;
    move = PVector.random2D();
    speed = random(0.5, 5);
  } 
  void update() { 
    pushMatrix();
    translate(xpos, ypos);
    rotate(move.heading());
    colorMode(HSB);
    fill(t_colour);
    polygon(3, 0, 0, 12);
    popMatrix();
  }
} 

void polygon(int n, float cx, float cy, float r) {
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)), 
    cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}

