/*

TETRAHEDRON BY CENTER & RADIUS

REFERENCES
https://en.wikipedia.org/wiki/Tetrahedron

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import peasy.*;
PeasyCam cam;

PVector center = new PVector(width/2, height/2, 0.0);
float radius = 128.0;


//120 degrees in radians are 2.0944
SphericalCoordinate[] matrix = {  new SphericalCoordinate(0.0, 0.0), 
                                  new SphericalCoordinate(0.0, 2.0944), 
                                  new SphericalCoordinate(2.0944, 2.0944), 
                                  new SphericalCoordinate(-2.0944, 2.0944)};
                                  
PVector[] vertices = new PVector[4];

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
  
}

void draw(){
  
    background(192, 192, 192); 
    
    stroke(0, 0, 0);
    noFill();
    sphere(radius);

    PVector[] faces = {new PVector(0, 1, 2), new PVector(1, 2, 3), new PVector(2, 3, 0), new PVector(3, 0, 1)};
    color[] tints = {color(255, 0, 255, 32), color (255, 255, 0, 32), color (0, 255, 255, 32), color(255, 0, 0, 32) };


    for(int f = 0; f < 4; f++){
    fill(tints[f]);
    
      beginShape();
      vertex(vertices[int(faces[f].x)].x, vertices[int(faces[f].x)].y, vertices[int(faces[f].x)].z);
      vertex(vertices[int(faces[f].y)].x, vertices[int(faces[f].y)].y, vertices[int(faces[f].y)].z);
      vertex(vertices[int(faces[f].z)].x, vertices[int(faces[f].z)].y, vertices[int(faces[f].z)].z);
      endShape(CLOSE);
      
    }

}

class SphericalCoordinate{
 
      float phi, theta;
     
      SphericalCoordinate(float phi_, float theta_){ phi = phi_; theta = theta_; } 
  
}
