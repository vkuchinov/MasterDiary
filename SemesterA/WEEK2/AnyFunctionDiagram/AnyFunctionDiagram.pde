/*

TWEAKED VORONOI DIAGRAM

Instead of Math.sqrt > Math.cbrt

Math.cbrt(abs(x0 - x2)^3 + abs(y0 - y2)^3)

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

        //float dist = (float)Math.cbrt(pow(abs(x - defPoint.posX), 3) + pow(abs(y - defPoint.posY), 3));
        //float dist = GCM((int)x, (int)y) + GCM((int)defPoint.posX, (int)defPoint.posY);
        
        //float dist = sqrt(GCM((int)x, (int)defPoint.posX) * GCM((int)y, (int)defPoint.posY));
        float dist = sqrt(LCM((int)x, (int)defPoint.posX) * LCM((int)y, (int)defPoint.posY));
        
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

int LCM(int a_, int b_){
  
  return a_ * (b_ / GCM(a_, b_));
  
}

int GCM(int a_, int b_){
 
    while (b_ > 0)
    {
        int temp = b_;
        b_ = a_ % b_; 
        a_ = temp;
    }
    
    return a_;

}
