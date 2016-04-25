/*
Voronoi Over Manhattan
[*crows over Manhattan, voron[rus]: crow]

a simple experiment of mixing Voronoi with Manhattan.

KEYS:

b | B : both
v | V : Voronoi
m | M : Manhattan

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

static int NUM_POINTS = 32;
static int FRAME_RATE = 12;

int mode = 0;    //0: both, 1: Voronoi, 2: Manhattan

Point[] points;

int counter = 0;

void setup()
{
  size(600, 600); 
  smooth();
  frameRate(FRAME_RATE);
  hint(ENABLE_RETINA_PIXELS);
  
  
  points = new Point[NUM_POINTS];
  for (int p = 0; p < points.length; p++)
  {
    points[p] = new Point();
  }
}

void draw() {

  background(0);
  
  if(mode == 0) drawBoth();
  if(mode == 1) drawVoronoi();
  if(mode == 2) drawManhattan();

  

  updatePoints();
  if(counter % FRAME_RATE == 0) { 
    
    for (int p=0; p<points.length; p++){
        Point defPoint = points[p];
        noFill();
        strokeWeight(2);
        stroke(0);
        point(defPoint.posX, defPoint.posY);
    }
    
  }

}


void drawBoth() {
  
  loadPixels();

  for (int x=0; x<width; x++){      
    for (int y=0; y<height; y++){
      
      //int rand = Math.round(random(1));
       
      float minDistV = width+height;
      float minDistM = width+height;
      
      int closestV = 0;      //Voronoi
      int closestM = 0;      //Manhattan

      for (int p=0; p<points.length; p++){
        Point defPoint = points[p];
        
        //VORONOI: Eucledean distance sqrt((x1 - x2)^2 + (y1 - y2)^2)
        float distV = dist(x, y, defPoint.posX, defPoint.posY);
        
        if (distV < minDistV){
          closestV = p;
          minDistV = distV;
        }
        
        //MANHATTAN  
        float distM =  abs(x - defPoint.posX) + abs(y - defPoint.posY);
        
            if (distM < minDistM){
              closestM = p;
              minDistM = distM;
            }  
      }
      pixels[ y * width + x] = color((int)((points[closestV].voronoiColour + points[closestM].manhattanColour) / 2.0));
    }
  }
  updatePixels();
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
      pixels[y*width+x] = points[closest].voronoiColour;
      //0.5+pow(v,2)
    }
  }
  updatePixels();
}

void drawManhattan() {
  
  
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
        
        //Manhattan distance
        //Math.abs(x1 - x2) + Math.abs(y1 - y2);
        float dist =  abs(x - defPoint.posX) + abs(y - defPoint.posY);
        
        if (dist<minDist)
        {
          closest = p;
          minDist = dist;
        }
      }
      
      pixels[y*width+x] = points[closest].manhattanColour;
      
    }
  }
  updatePixels();
  
  //img = loadImage("rastered_clouds.png");
  //image(img, 0, 0);
}

void updatePoints() {
  int randomPoint = int(random(0, points.length)); 
  points[randomPoint].change();
}

void keyPressed() {
  
    if (keyCode == 'v' || keyCode == 'V') {
      mode = 1; println("Voronoi mode");
    }
    
    if (keyCode == 'm' || keyCode == 'M') {
      mode = 2; println("Manhattan mode");
    }
    
    if (keyCode == 'b' || keyCode == 'B') {
      mode = 0; println("Both mode");
    }
  
}
