/*

Delaunay, Bisectors & Voronoi
some bisectors are matching Voronoi diagram, some not. 
In the same time, there are two missing lines for building
a proper Voronoi.

Have to dig further, read more articles and books.
Why I am doing it? To master my skills in geometry and
to train my abstract thinking.

And, still, there is a problem how to pick proper cross points 
among dozens...

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

ArrayList<PVector> nodes = new ArrayList<PVector>();
ArrayList<Integer> colors = new ArrayList<Integer>();
PImage voronoi;

void setup() {  
  
  size(600, 600, "processing.core.PGraphicsRetina2D");
  background(64);  
  
  voronoi = createImage(600, 600, RGB);

  nodes.add(new PVector(105, 150));
  nodes.add(new PVector(210, 450));
  nodes.add(new PVector(255, 300));
  nodes.add(new PVector(315, 150));
  nodes.add(new PVector(465, 90));
  nodes.add(new PVector(465, 300));
  nodes.add(new PVector(465, 510));

  for(int c = 0; c < nodes.size(); c++){
     colors.add((int)random(128, 224)); 
  }
  
  //render voronoi test
  drawVoronoi();
  image(voronoi, 0, 0);
  
  //perpendicular bisectors
  for (int i = 0; i < nodes.size(); i++)
  {
      for (int j = i+1; j < nodes.size(); j++)
      {
          float midx = (1.0 * nodes.get(i).x + nodes.get(j).x) / 2.0;
          float midy = (1.0 * nodes.get(i).y + nodes.get(j).y) / 2.0;
          
          float slope = (1.0 * nodes.get(i).y - nodes.get(j).y)/(1.0 * nodes.get(i).x - nodes.get(j).x);
          slope = -1.0 / slope;
          float x1 = midx + width;
          float x2 = midx - width;
          float y1 = midy + height * slope;
          float y2 = midy - height * slope;
          stroke(0, 128);
          strokeWeight(1.0);
          line( x1, y1, x2, y2);
         
       }
  }
  
  for (int i = 0; i < nodes.size(); i++)
  {
      stroke(255);
      strokeWeight(4.0);
      point(nodes.get(i).x, nodes.get(i).y);
  }
       
}

void draw() {  

}
