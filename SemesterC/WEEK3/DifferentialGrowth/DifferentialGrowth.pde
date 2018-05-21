/*

DIFFERENTIAL GROWTH
based on Anders Hoff [inconvergent]

REFERENCES:
http://inconvergent.net
https://github.com/inconvergent/differential-line

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

int test = 0;
int count = 0;

DifferentialLine dl;
int resolution = 128;
float t = 0.3;

void setup(){
 
   size(900, 900, "processing.core.PGraphicsRetina2D"); 
   translate(width / 2, height / 2);
   background(255);
   
   dl = new DifferentialLine(true);
   
   for(float a = 0; a < TAU; a += TAU / resolution ){
     
       float r = 100.0;
       dl.addPoint(r * cos(a), r * sin(a), false, 5.0); 
   
   }

}

void draw(){
 
   background(255);
   translate(width / 2, height / 2);
  
   dl.insertPoint(false, 5, 5, floor(random(dl.points.size() - 2)));
   
   dl.update(t);
   dl.draw(); 

   //if(frameCount%100 == 0) { println(dl.points.size()); }
  
}
