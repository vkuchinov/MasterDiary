/*

QUAD AND CIRCLE INTERSECTION


@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

QuadList quads = new QuadList();
Circle circle;
void setup(){
  
     size(800, 800, "processing.core.PGraphicsRetina2D"); 
     
     //quads.add(new Quad(200, 200, 600, 600));
     quads.add(new Quad(200, 200, 400, 400));
     quads.add(new Quad(200, 400, 400, 600));
     quads.add(new Quad(400, 400, 600, 600));
     quads.add(new Quad(400, 200, 600, 400));
     
     quads.add(new Quad(200, 200, 300, 300));
     quads.add(new Quad(200, 300, 300, 600));
     
     circle = new Circle(0.0, 0.0, 60.0);
}

void draw(){
 
     background(240);
    
     quads.draw();
     quads.checkIntersection(circle);
     circle.draw();     
  
}
