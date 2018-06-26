/*

CIRCLES COLLISION CHECK

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Circle A, B;

void setup(){
 
   size(512, 512, "processing.core.PGraphicsRetina2D"); 
   translate(width/2, height/2);

   A = new Circle(new PVector(0.0, 0.0), 92.0);
   B = new Circle(new PVector(0.0, 0.0), 64.0);
   
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
   float dist = PVector.dist(new PVector(A.origin.x, A.origin.y), new PVector(B.origin.x, B.origin.y)); 
   
   if(dist > (A.origin.z + B.origin.z)) { message = "no overlap"; }
   else if(dist <= abs(A.origin.z - B.origin.z)) { message = "B inside A"; }
   else { message = "overlapping"; }
   
   fill(0);
   text(message, -width/2 + 32, -height/2 + 32);
  
}
