/*

TETRAHEDRON RECURSIVE SPHERE RESEARCH

REFERENCES
https://en.wikipedia.org/wiki/Tetrahedron

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import peasy.*;
PeasyCam cam;

PVector center = new PVector(width/2, height/2, 0.0);
float radius = 1.0;

//120 degrees in radians are 2.0944
SphericalCoordinate[] matrix = {  new SphericalCoordinate(0.0, 0.0), 
                                  new SphericalCoordinate(0.0, 2.0944), 
                                  new SphericalCoordinate(2.0944, 2.0944), 
                                  new SphericalCoordinate(-2.0944, 2.0944)};
                                                                 
PVector[] vertices = new PVector[4];
Tetrahedronical sphere;

void setup(){
 
     size(750, 750, P3D);
     background(192, 192, 192); 
     
     cam = new PeasyCam(this, radius);
     cam.setMinimumDistance(50);
     cam.setMaximumDistance(500);
     
     
     for(int v = 0; v < 4; v++){
       
           float x = radius * cos(matrix[v].phi) * sin(matrix[v].theta);
           float y = radius * sin(matrix[v].phi) * sin(matrix[v].theta);
           float z = radius * cos(matrix[v].theta);
           
           vertices[v] = new PVector(x, y, z);
     }
     
     sphere = new Tetrahedronical(vertices, 5);
  
}

void draw(){
  
    colorMode(RGB);
    background(192, 192, 192); 

    sphere.draw();
}

class SphericalCoordinate{
 
      float phi, theta;
     
      SphericalCoordinate(float phi_, float theta_){ phi = phi_; theta = theta_; } 
  
}
