/*

SPIDRON(s)

by artist by Dániel Erdély (1979) as as a homework presented to 
Ernő Rubik, for Rubik's design class, at the Hungarian University 
of Arts and Design.

Is a continuous flat geometric figure composed entirely 
of triangles, where, for every pair of joining triangles, each has 
a leg of the other as one of its legs, and neither has any point 
inside the interior of the other. A deformed spidron is a three-dimensional 
figure sharing the other properties of a specific spidron, as if that spidron 
were drawn on paper, cut out in a single piece, and folded along a number of legs.

TODO:
Have to be advanced to iniversal ratio, now it stroked to 0.2885 and 30+120+30 
isosceles triangle.

FURTHER READINGS:
http://math.ucsb.edu/~briefly/funmath.html
https://en.wikipedia.org/wiki/Hyperbolic_geometry

*/

Spidron spidron;

void setup(){
  
  size(800, 800, "processing.core.PGraphicsRetina2D");
  translate(width/2, height/2);
  
  spidron = new Spidron(400, 0.2885, 32);
  spidron.symmetricalRender();
  
}

class Spidron{
  
  float size, tint;
  int level;
  String type;             //equilateral/isosceles
                           //равносторонний/равнобедренный
  
  PVector[] vertices = new PVector[3];
  
  Spidron parent, child;
  
  Spidron(float size_, float cross_, int level_){
  
  parent = null;
  type = "isosceles";
  
  tint = random(255);
  level = level_;
  size = size_;

  vertices[0] = new PVector(0, -size/2);
  vertices[1] = new PVector(0,  size/2);
  vertices[2] = new PVector(-cross_ * size, 0);
 
  float dist = dist(vertices[0].x, vertices[0].y, vertices[2].x, vertices[2].y); 
  child = new Spidron(dist, cross_, -30.0, level - 1, this); 
  
  }
  
  Spidron(float size_, float cross_, float angle_, int level_, Spidron parent_){
  
  parent = parent_;

  tint = parent.tint + 4.0;
  
  level = level_;
  size = size_;
  
  if(parent.type == "equilateral"){

    this.type = "isosceles";
    vertices[0] = new PVector(parent.vertices[2].x, parent.vertices[2].y);
    vertices[1] = new PVector(parent.vertices[1].x, parent.vertices[1].y);

    //float alpha = atan((cross_ * size)/(0.5 * size));
    float c = sqrt(pow(0.5 * size, 2) + pow(cross_ * size, 2));

    float v3x = parent.vertices[1].x + sin(radians(-90 - angle_ - 60)) * c;
    float v3y = parent.vertices[1].y + cos(radians(-90 - angle_ - 60)) * c;
    
    vertices[2] = new PVector(v3x, v3y);

    float dist = dist(vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y); 
    if(level > 0) { child = new Spidron(dist, cross_, angle_ - 30.0, level - 1, this); }
    
  }
  else
  {

    this.type = "equilateral";
    vertices[0] = new PVector(parent.vertices[0].x, parent.vertices[0].y);
    vertices[1] = new PVector(parent.vertices[2].x, parent.vertices[2].y);
    
    float v3x = parent.vertices[2].x + sin(radians(180 - angle_)) * size;
    float v3y = parent.vertices[2].y + cos(radians(180 - angle_)) * size;
    vertices[2] = new PVector(v3x, v3y); 
    
    if(level > 0) { child = new Spidron(size, cross_, angle_, level - 1, this); }
    
  }

  }
  
  void render(){
    
  colorMode(HSB);
  stroke(0, 0, 0);
  strokeWeight(0.5);
  fill(tint, 240, 240);
  beginShape();
  for(int v = 0; v < vertices.length; v++){
    vertex(vertices[v].x, vertices[v].y); 
  }
  endShape(CLOSE);  
  if(child != null) { child.render(); }
  
  }
  
  void symmetricalRender(){
    
  colorMode(HSB);
  stroke(0, 0, 255);
  strokeWeight(0.5);
  fill(tint, 240, 240);
  beginShape();
  for(int v = 0; v < vertices.length; v++){
    vertex(vertices[v].x, vertices[v].y); 
  }
  endShape(CLOSE);  
  beginShape();
  for(int v = 0; v < vertices.length; v++){
    vertex(-vertices[v].x, -vertices[v].y); 
  }
  endShape(CLOSE);  
  if(child != null) { child.symmetricalRender(); }
  
  }
  
}
