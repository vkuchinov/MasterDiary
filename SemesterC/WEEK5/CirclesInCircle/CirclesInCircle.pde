/*

CIRCLES INSCRIBER
[calculate parent circle diameter to fit n children circles along its edge, where n always >= 6]

1, 2, 3 from 6
4, 5 from itself

REFERENCES:
http://mathworld.wolfram.com/CirclePacking.html

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int n = 9;
float r = 64;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
 
   size(650, 650);
   translate(width/2, height/2);
  
  
   float ir = r / cos((n - 1.75) * PI / (float)n / 2.0);
   
   println(ir);
   
   fill(240);
   ellipse(0, 0, (ir + r) * 2, (ir + r) * 2);
   
   fill(255);
   ellipse(0, 0, r * 2, r * 2);
   
   for(int i = 0; i < n; i++){
     
       float x = ir * sin( TWO_PI / (float)n * i);
       float y = ir * cos( TWO_PI / (float)n * i);
     
       points.add(new PVector(x, y));
     
   }
   
 
   for(PVector p : points) { strokeWeight(4); point(p.x, p.y); strokeWeight(1); ellipse(p.x, p.y, r * 2, r * 2); }
  
  
}
