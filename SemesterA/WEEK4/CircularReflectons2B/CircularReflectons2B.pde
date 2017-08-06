/*

CIRCULAR REFLECTIONS 2

REFERENCES:


@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Point p;

void setup(){
  
     size(500, 500);
  
     float a = random(-PI, PI);
     float r = random(0, 200);
     
     float x = 100 + random(0, width - 200);
     float y = 100 + random(0, height - 200);
     
     p = new Point(x, y, random(-2.5, 2.5), random(-2.5, 2.5), 100);
  
}

void draw(){
  
    background(240);

    p.draw();
  
}
