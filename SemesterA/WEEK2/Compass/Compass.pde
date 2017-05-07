/*
COMPASS

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Compass NS;

void setup(){
 
   size(500, 500, "processing.core.PGraphicsRetina2D");
   background(255);
   translate(width / 2, height / 2);
   
   NS = new Compass(45);
   NS.draw();
  
}


class Compass{
  
   color N = color(195, 40, 45);
   color S = color(205, 205, 205);
   int width = 80;
   int height = 240;
   
   float angle;
  
   Compass(float angle_){
     
       angle = -90 + angle_;
    
   }
  
   void draw(){
     
       noStroke();
       
       PVector a = new PVector(width * cos(radians(angle - 90)), width * sin(radians(angle - 90)) );
       PVector b = new PVector(width * cos(radians(angle + 90)), width * sin(radians(angle + 90)) );
       
       PVector north = new PVector(height * cos(radians(angle)), height * sin(radians(angle)));
       PVector south = new PVector(height * cos(radians(angle + 180)), height * sin(radians(angle + 180)));
       
       fill(N);
       beginShape();
       vertex(a.x, a.y);
       vertex(b.x, b.y);
       vertex(north.x, north.y);
       endShape(CLOSE);
       
       fill(S);
       beginShape();
       vertex(b.x, b.y);
       vertex(a.x, a.y);
       vertex(south.x, south.y);
       endShape(CLOSE);
    
   } 
  
}
