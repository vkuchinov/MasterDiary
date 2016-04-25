/*

FORTUNE'S VORONOI

TO DO:

[-] sort point by y from lowest to biggest

REFERENCES:
http://jtauber.com/blog/2008/11/27/voronoi_canvas_tutorial_part_i/
http://jtauber.com/blog/2008/11/28/voronoi_canvas_tutorial_part_ii/
http://jtauber.com/blog/2008/11/29/voronoi_canvas_tutorial_part_iii/

http://www.cs.princeton.edu/~edwardz/voronoi/voronoi.html

Curve Intersection
http://xtyler.com/resources/curve-test/srcview/index.html
http://xtyler.com/resources/curve-test
http://stackoverflow.com/questions/11479664/find-the-intersections-of-a-pair-of-quadcurve2ds
http://zonalandeducation.com/mmts/intersections/intersectionOfTwoParabollas1/intersectionOfTwoParabolas1.htm
https://www.youtube.com/watch?v=SuVcwBVRXYY

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

Random seed = new Random(5555);

ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Integer> colors = new ArrayList<Integer>();
Horizontal line;

ArrayList<Quadratic> quads = new ArrayList<Quadratic>();

PImage mask;

void setup(){
 
    size(600, 600);
    
    mask = createImage(600, 600, RGB);
   
    
    for(int p = 0; p < 7; p++){
     
       points.add(new PVector(100 + seed.nextInt(width - 200), 100 + seed.nextInt(height - 100)));
       colors.add(new Integer((int)random(128, 192)));
    }
    
     drawVoronoi();
  
    line = new Horizontal();
 
}

void draw(){
 
    quads.clear();
    
    image(mask, 0, 0, 600, 600);

    
    for(PVector p : points) { stroke(0); strokeWeight(5.0); point(p.x, p.y); }
   
    line.draw();
    
    for(int q = 0; q < quads.size(); q++){
      for(int qq = 0; qq < quads.size(); qq++){

        if(q != qq) quads.get(q).getIntersections(quads.get(qq)); 
    
      }
    }
  
    for(Quadratic q: quads) q.draw();
    
    if(quads.size()!= 0) println(quads.get(0).outers, quads.get(0).inners);
}

void drawVoronoi() {
  mask.loadPixels();

  for (int x=0; x< mask.width; x++)
  {
    for (int y=0; y< mask.height; y++)
    {
      float minDist = mask.width+mask.height;
      int closest = 0;

      for (int p = 0; p < points.size(); p++)
      {
        PVector defPoint = points.get(p);
        
        //Eucledean distance sqrt((x1 - x2)^2 + (y1 - y2)^2)
        float dist = dist(x, y, defPoint.x, defPoint.y);
        if (dist < minDist)
        {
          closest = p;
          minDist = dist;
        }
      }

      mask.set(x, y, color(colors.get(closest)));
      
    }
  }
  
  mask.updatePixels();
}
