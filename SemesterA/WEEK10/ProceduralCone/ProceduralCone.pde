/*

PROCEDURAL CONE

[1] arbitrary point within parameterized cone
[2] arbitrary point on cone surface

In this example peak = height

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import peasy.*;
PeasyCam camera;

Cone c;

ArrayList<PVector> pointsA = new ArrayList<PVector>();
ArrayList<PVector> pointsB = new ArrayList<PVector>();

void setup(){
  
    size(600, 600, P3D);
    camera = new PeasyCam(this, 100);
    camera.setMinimumDistance(50);
    camera.setMaximumDistance(500);
    
    c = new Cone(new PVector(0.0, 0.0, 0.0), 64.0, 92.0);

    for(int a = 0; a < 512; a++){ pointsA.add(c.randomPointWithinCone()); }
    for(int b = 0; b < 512; b++){ pointsA.add(c.randomPointOnConeSurface()); }
  
}

void draw(){
  
  background(200);
  
  //magenta
  stroke(255, 0, 255);
  strokeWeight(4.0);
  for(int a = 0; a < 512; a++){ point(pointsA.get(a).x, pointsA.get(a).y, pointsA.get(a).z); }
  
}
