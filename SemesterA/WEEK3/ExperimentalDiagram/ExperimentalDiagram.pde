/*

EXPERIMENTAL DIAGRAM

FURTHER READINGS:
https://github.com/veltman/mahalanobis [used in deep learning]

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

static int NUM_POINTS = 16;

Point[] points;

int counter = 0;

float[] ds = new float[]{1.641864483672011, 1.9000753006634619, 1.0783973999191308,
0.9485043918364863, 1.275481040091793, 1.0518767390225157,
1.9608386301050331, 1.2975515186046378, 0.9252709962241177,
2.0994195833968674, 2.160960305867233, 0.3739838006952992,
0.5886352919608245, 1.3835126205171677, 1.0088537796551886,
0.13372263827483202};

void setup()
{
  size(600, 600); 
  smooth();
  colorMode(HSB);
  hint(ENABLE_RETINA_PIXELS);
  
  
  points = new Point[NUM_POINTS];
  
  /*
  
  31.68683 332.45532
  448.2621 527.56146
  448.2677 254.07164
  137.59889 260.16983
  124.59837 154.8265
  337.66995 99.525475
  152.32845 585.9842
  261.47418 53.78877
  149.75427 224.53949
  578.49634 105.5431
  457.79172 573.20593
  333.2501 239.3193
  198.87932 239.52191
  390.68802 60.714195
  162.29675 392.24335
  301.44086 263.35086
  
  
  */

points[0] = new Point(31.68683, 332.45532);
points[1] = new Point(448.2621, 527.56146);
points[2] = new Point(448.2677, 254.07164);
points[3] = new Point(137.59889, 260.16983);
points[4] = new Point(124.59837, 154.8265);
points[5] = new Point(337.66995, 99.525475);
points[6] = new Point(152.32845, 585.9842);
points[7] = new Point(261.47418, 53.78877);
points[8] = new Point(149.75427, 224.53949);
points[9] = new Point(578.49634, 105.5431);
points[10] = new Point(457.79172,573.20593);
points[11] = new Point(333.2501, 239.3193);
points[12] = new Point(198.87932, 239.52191);
points[13] = new Point(390.68802, 60.714195);
points[14] = new Point(162.29675, 392.24335);
points[15] = new Point(301.44086, 263.35086);

  
    drawExperimental();
    
}

void drawExperimental() {
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
        float dist = ds[p];
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
