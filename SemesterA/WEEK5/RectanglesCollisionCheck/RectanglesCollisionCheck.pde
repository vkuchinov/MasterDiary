/*

RECTANGLES COLLISION CHECK

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Rectangle A, B;

void setup(){
 
   size(512, 512, "processing.core.PGraphicsRetina2D"); 
   translate(width/2, height/2);
   
   A = new Rectangle(new PVector(-150, -100), 300, 200);
   B = new Rectangle(new PVector(-width/2, -height/2), 100, 50);

   
}

void draw(){
  
   translate(width/2, height/2);
   background(220);
  
   A.draw();
   B.draw(mouseX, mouseY);
  
   checkCollision();
   
}

void checkCollision(){
  
   String message = "";
   
   float xmin = max(A.position.x, B.position.x);
   float xmax1 = A.position.x + A.dimensions.x;
   float xmax2 = B.position.x + B.dimensions.x;
   
   float xmax = min(xmax1, xmax2);
   
   
   if (xmax > xmin) {
     
        float ymin = max(A.position.y, B.position.y);
        float ymax1 = A.position.y + A.dimensions.y;
        float ymax2 = B.position.y + B.dimensions.y;
        float ymax = min(ymax1, ymax2);
        if (ymax > ymin) { message = "collision"; }
    }
    
   fill(0);
   text(message, -width/2 + 32, -height/2 + 32);
  
}
