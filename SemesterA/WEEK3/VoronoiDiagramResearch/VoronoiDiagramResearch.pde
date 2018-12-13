/*

VORONOI DIAGRAM

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

String[] urls = new String[]{"level0.txt", "level1.txt", "level2.txt", "level3.txt"};
Point[] points;

int counter = 0;

void setup()
{
  size(400, 400); 
  translate(width/2, height/2);
  smooth();
  colorMode(HSB);
  hint(ENABLE_RETINA_PIXELS);
   
  String[] data = loadStrings(urls[0]);

  points = new Point[data.length];

  for (int p = 0; p < points.length; p++)
  {
    
    String[] xy = split(data[p], ',');
    points[p] = new Point(float(xy[0]) * 4, -float(xy[1]) * 4, p, points.length);
 
  }
  
    drawVoronoi();
    
}

void drawVoronoi() {
  
  loadPixels();

  for (int x=0; x<width; x++)
  {
    for (int y=0; y<height; y++)
    {
      float minDist = width+height;
      int closest = 0;

      for (int p=0; p<points.length; p++)
      {
        Point defPoint = points[p];
        
        //Eucledean distance sqrt((x1 - x2)^2 + (y1 - y2)^2)
        float dist = atan(dist(-width/2 + x, -height/2 + y, defPoint.posX, defPoint.posY));
        if (dist<minDist)
        {
          closest = p;
          minDist = dist;
        }
      }
      pixels[y * width + x] = points[closest].voronoiColour;
      
    }
  }
  
  updatePixels();
  drawPoints();
  
}


void drawPoints() {
  
  for(Point p : points) { stroke(0); strokeWeight(8); point(p.posX, p.posY); }
  
}
