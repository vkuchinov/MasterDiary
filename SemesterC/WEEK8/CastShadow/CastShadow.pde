/*

Casting shadow in 3D

http://math.stackexchange.com/questions/100439/determine-where-a-vector-will-intersect-a-plane
http://www.macwright.org/literate-raytracer/
http://gbs.ebridde.is/deadguy/shadows/shadows.pde

PVector projectPoint(PVector point_, PVector light_) {
  lightToPoint = point_.get();
  lightToPoint.sub(light_);
  
  vectorToAdd = lightToPoint;
  vectorToAdd.normalize();
  vectorToAdd.mult(lightRadius - lightToPoint.mag());
  
  projectedPoint = point_.get();
  projectedPoint.add(vectorToAdd);
  
  return projectedPoint;
}

*/


PVector sun = new PVector(150.0, 200.0, 200.0);
import peasy.*;
PeasyCam cam;

Floor floorPlane = new Floor( 1000, 1000);
Sun theSun = new Sun(new PVector(100.0, 250.0, -160.0));

PVector[] line = new PVector[2];

void setup() {
  
  size(800, 800, P3D);
  
  cam = new PeasyCam(this, 100);
  cam.lookAt(width/2, height/2, 0);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  line[0] = new PVector(80.0, 20.0, 50.0);
  line[1] = new PVector(-20.0, 100.0, 0.0);
  
}


void draw() {
  
  background(240);
  translate(width/2, height/2, 0.0);

  floorPlane.draw();
  theSun.draw();
  
  stroke(0);
  strokeWeight(1.2);
  line(line[0].x, line[0].y, line[0].z, line[1].x, line[1].y, line[1].z);
  
  //tracers
  stroke(0, 255, 255);
  strokeWeight(0.75);
  
  //line(line[0].x, line[0].y, line[0].z, theSun.pos.x, theSun.pos.y, theSun.pos.z);
  //line(line[1].x, line[1].y, line[1].z, theSun.pos.x, theSun.pos.y, theSun.pos.z);
  
  //line(line[0].x, line[0].y, line[0].z, line[0].x, 0, line[0].z);
  //line(line[1].x, line[1].y, line[1].z, line[1].x, 0, line[1].z);
  //line(theSun.pos.x, theSun.pos.y, theSun.pos.z, theSun.pos.x, 0, theSun.pos.z);
  //line(line[0].x, 0, line[0].z, theSun.pos.x, 0, theSun.pos.z);
  //line(line[1].x, 0, line[1].z, theSun.pos.x, 0, theSun.pos.z);
  
  stroke(64, 64, 255);
  
  //bigger C
  float ratio = projectRatio(line[0], theSun.pos);
  println(ratio);
  PVector bigC = projectPoint(line[0], theSun.pos, ratio);

  //line(line[0].x, line[0].y, line[0].z, bigC.x, bigC.y, bigC.z);


  float ratio2 = projectRatio(line[1], theSun.pos);
  println(ratio2);
  PVector bigC2 = projectPoint(line[1], theSun.pos, ratio2);
  //line(line[1].x, line[1].y, line[1].z, bigC2.x, bigC2.y, bigC2.z);
  
  stroke(96);
  strokeWeight(3);
  line(bigC.x, bigC.y, bigC.z, bigC2.x, bigC2.y, bigC2.z);
}

PVector projectPoint(PVector point_, PVector light_, float ratio) {
  
  PVector lightToPoint = new PVector(point_.x, point_.y, point_.z);
  lightToPoint.sub(light_);
  
  PVector vectorToAdd = lightToPoint;
  vectorToAdd.normalize();
  vectorToAdd.mult(ratio);
  
  PVector projectedPoint = new PVector(point_.x, point_.y, point_.z);
  projectedPoint.add(vectorToAdd);

  return projectedPoint;
}

float projectRatio(PVector point_, PVector light_) {
 
  PVector lightToPoint = new PVector(point_.x, point_.y, point_.z);
  lightToPoint.sub(light_);
  
  PVector vectorToAdd = lightToPoint;
  vectorToAdd.normalize();
  vectorToAdd.mult(1000);
  
  PVector projectedPoint = new PVector(point_.x, point_.y, point_.z);
  projectedPoint.add(vectorToAdd);

  PVector bigB = new PVector(point_.x, projectedPoint.y, point_.z);
  float ratioBC = projectedPoint.dist(point_) / bigB.dist(point_);
  
  return ratioBC * point_.dist(new PVector(point_.x, 0.0, point_.z));

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) { theSun.pos.x += 2; } 
    if (keyCode == DOWN) { theSun.pos.x -= 2; }
    if (keyCode == LEFT) { theSun.pos.z -= 2; }  
    if (keyCode == RIGHT) { theSun.pos.z += 2; } 

  }
}

