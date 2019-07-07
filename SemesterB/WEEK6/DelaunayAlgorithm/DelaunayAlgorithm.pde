/*

Delaynay Algorithm
[known as Delaunay triangulation]

Delaunay triangulations maximize the minimum angle of all the 
angles of the triangles in the triangulation; they tend to avoid 
skinny triangles. 

The triangulation is named after Boris Delaunay for his work on 
this topic from 1934.

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Arrays;
import java.util.Random;

final int NUM_POINTS = 9;

ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Face> faces = new ArrayList<Face>();

//supporting geometry
//use Intrface class for optimization
SupportingGeometry supports = new SupportingGeometry();

Random seed = new Random(5555);

void setup()
{
  
  size(800, 800, "processing.core.PGraphicsRetina2D");

  //scene edges
  points.add(new PVector(width / 2, -5000));
  points.add(new PVector(-5000, height));
  points.add(new PVector(width + 5000, height));
  
  for(int i = 0; i < NUM_POINTS; ++i){ 
    float randomX = 0.2 * width + seed.nextInt((int)(0.6 * width));
    float randomY = 0.2 * height + seed.nextInt((int)(0.6 * height));
    points.add(new PVector(randomX, randomY)); 
  }
  
}

void draw()
{
  
  background(32);
  Delaunay();
  
  drawTriangulation();

  fill(255, 0, 0);
  noStroke();
  for(int i = 0; i < points.size(); ++i) { ellipse(points.get(i).x, points.get(i).y, 5.0, 5.0); }
  
  supports.render();
  
  noLoop();
}
