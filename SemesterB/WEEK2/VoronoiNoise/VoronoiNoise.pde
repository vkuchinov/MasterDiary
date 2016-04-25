/*

VORONOI DIAGRAM + NOISE

an experiment of distorting Voronoi edges
by a noise function creating a new kind 
of shapes.

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

static int NUM_POINTS = 32;
static int FRAME_RATE = 8;

float amp = 12.0;
float fr = 10.0;
float PHI = 6.0;

Point[] points;

float angle = 0.0;

void setup()
{
    size(500, 500); 
    smooth();
    frameRate(FRAME_RATE);
    
    points = new Point[NUM_POINTS];
    for (int p = 0; p < points.length; p++){
        points[p] = new Point();
    }
}

void draw() {

drawVoronoi();
 
for (int p=0; p<points.length; p++){
    Point defPoint = points[p];
    noFill();
    strokeWeight(2);
    stroke(0);
    //point(defPoint.posX, defPoint.posY);
}

updatePoints();

}

void drawVoronoi() {
    loadPixels();
    
    for (int x=0; x<width; x++){
        for (int y=0; y<height; y++){
          
            float minDist = width+height;
            int closest = 0;
            
                for (int p=0; p<points.length; p++){
                    Point defPoint = points[p];
                    
                    //noiseDetail(16, 2);
                    float whiteNoise = noise(x*50, y*50);
                    float func = amp*sin(2*PI*p)*1000000;
    
                    //Eucledean distance sqrt((x1 - x2)^2 + (y1 - y2)^2)
                    float dist = dist(x, y, defPoint.posX, defPoint.posY) + func;
                    if (dist<minDist){
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



