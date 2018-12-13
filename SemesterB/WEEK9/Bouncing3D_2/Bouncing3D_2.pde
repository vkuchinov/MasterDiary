/*

BOUNCING PARTICLES + SPHERE 3D

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

import peasy.*;
PeasyCam cam;

PVector center = new PVector(width/2, height/2, 0.0);
Sphere walls;

Particle p;

void setup(){
 
   size(800, 800, P3D);

   cam = new PeasyCam(this, 256.0);
   cam.setMinimumDistance(50);
   cam.setMaximumDistance(999);
   
   walls = new Sphere(new PVector(0.0, 0.0, 0.0), 100.0, 64);
   p = new Particle(50, -15.0, -25.0, 1.0);
  
}

void draw(){
  
   background(192); 
   colorMode(HSB);
   
   //walls.draw();
   p.draw(walls);
   
  
}
