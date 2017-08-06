/*

CIRCULAR REFLECTIONS 2

REFERENCES:


@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Point p;

void setup(){
  
     size(500, 500);
     translate(width/2, height/2);
  
     float a = random(-PI, PI);
     float r = random(0, 200);
     
     float x = r * cos(a);
     float y = r * sin(a);
     
     p = new Point(x, y, random(-2.5, 2.5), random(-2.5, 2/.5), 200);
  
}

void draw(){
  
    background(240);
    translate(width / 2, height / 2);
  
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, 200 * 2, 200 * 2);
    
    p.draw();
  
}
