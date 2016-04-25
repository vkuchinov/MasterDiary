static int NUM_POINTS = 32;
static int FRAME_RATE = 8;

Point[] points;

void setup()
{
  size(700, 700); 
  smooth();
  frameRate(FRAME_RATE);

  points = new Point[NUM_POINTS];
  for (int p = 0; p < points.length; p++)
  {

    points[p] = new Point(random(1.0));
  }
}

void draw() {

  drawBoth();

  for (int p=0; p<points.length; p++)
  {
    Point defPoint = points[p];
    noFill();
    strokeWeight(2);
    stroke(0);
    point(defPoint.posX, defPoint.posY);
  }

  updatePoints();
  noLoop();
}

void drawBoth() {

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

        float dist = 0.0;
        if (defPoint.type == -1) {
        //Voronoi function
        dist = dist(x, y, defPoint.posX, defPoint.posY);
        } else {
        //Manhattan function
        dist =  abs(x - defPoint.posX) + abs(y - defPoint.posY);
        }


        if (dist<minDist)
        {
          closest = p;
          minDist = dist;
        }
      }

      pixels[y*width+x] = points[closest].itsColour;
    }
  }
  updatePixels();
}

void updatePoints() {
  int randomPoint = int(random(0, points.length)); 
  points[randomPoint].change();
}

