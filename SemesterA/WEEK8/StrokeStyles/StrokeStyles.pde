/*

STROKE JOIN & STROKE CAP

strokeJoin():  MITER, BEVEL, and ROUND
strokeCap():   SQUARE, PROJECT, and ROUND.

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

void setup(){
  
     size(400, 200, "processing.core.PGraphicsRetina2D"); 
     
     noFill();
     strokeWeight(8.0);
     
     //JOINS
     
     //default MITER
     beginShape();
     vertex(50, 50);
     vertex(80, 100);
     vertex(50, 150);
     endShape();
     
     strokeJoin(BEVEL);
     beginShape();
     vertex(100, 50);
     vertex(130, 100);
     vertex(100, 150);
     endShape();
     
     strokeJoin(ROUND);
     beginShape();
     vertex(150, 50);
     vertex(180, 100);
     vertex(150, 150);
     endShape();
     
     //CAPS
     
     //by default ROUND
     beginShape();
     vertex(250, 50);
     vertex(250, 150);
     endShape();
     
     strokeCap(SQUARE);
     beginShape();
     vertex(300, 50);
     vertex(300, 150);
     endShape();
     
     strokeCap(PROJECT);
     beginShape();
     vertex(350, 50);
     vertex(350, 150);
     endShape();
     
}
