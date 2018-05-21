/*

VORONOI DIAGRAM

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

static int NUM_POINTS = 16;

Point[] points;

int counter = 0;

void setup()
{
  size(600, 600); 
  smooth();
  colorMode(HSB);
  hint(ENABLE_RETINA_PIXELS);
  
  
  points = new Point[NUM_POINTS];
  for (int p = 0; p < points.length; p++)
  {
    points[p] = new Point();
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
        float dist = dist(x, y, defPoint.posX, defPoint.posY);
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
