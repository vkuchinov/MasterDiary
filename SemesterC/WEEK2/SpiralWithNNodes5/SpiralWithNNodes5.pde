/*

SPIRAL WITH N-NODES v1.0

REFERENCES:
http://mathworld.wolfram.com/topics/Spirals.html

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Spiral s;

PVector data[] = new PVector[]{

  new PVector(300,120),
  new PVector(260,100),
  new PVector(250,80),
  new PVector(200,60),
  new PVector(170,60),
  new PVector(150,100),
  new PVector(90,30),
  new PVector(60,30),
  new PVector(120, 30)
  
};


ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();

void setup(){
 
   size(512, 512, "processing.core.PGraphicsRetina2D"); 
   translate(width/2, height/2);
   
   s = new Spiral(200, 512);
   s.draw();
   
   fill(220, 128);
   rect(-width/2, -height/2, width, height);

   s.setRectangles(data);
   s.drawRectangles();
   
}
