/*

ICOSPHERE WITH TOPOLOGY

REFERENCES
http://blog.andreaskahler.com/2009/06/creating-icosphere-mesh-in-code.html

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import peasy.*;
PeasyCam cam;

//initial 12 vertices  

float t = (1.0 + sqrt(5.0)) / 2.0;
PVector[] vertices = { new PVector(-1.0,  t,  0.0),
                       new PVector( 1.0,  t,  0.0),
                       new PVector(-1.0, -t,  0.0),
                       new PVector( 1.0, -t,  0.0),
                       
                       new PVector( 0.0, -1.0,  t),
                       new PVector( 0.0,  1.0,  t),
                       new PVector( 0.0, -1.0, -t),
                       new PVector( 0.0,  1.0, -t),
                       
                       new PVector( t,  0.0, -1.0),
                       new PVector( t,  0.0,  1.0),
                       new PVector(-t,  0.0, -1.0),
                       new PVector(-t,  0.0,  1.0) };
Iso sphere;
float radius = 1.0;

void setup(){
 
     size(750, 750, P3D);
     background(192, 192, 192); 
     
     cam = new PeasyCam(this, radius);
     cam.setMinimumDistance(50);
     cam.setMaximumDistance(500);
     
     
     sphere = new Iso(vertices);
     
}


void draw() {
  
    colorMode(RGB);
    background(192, 192, 192);
    
    for(int v = 0; v < vertices.length; v++){
    stroke(0);
    strokeWeight(8);
    //point(vertices[v].x * 64, vertices[v].y * 64, vertices[v].z * 64);
      
    }
    sphere.nextLevel();
    sphere.draw(128);
  
}
