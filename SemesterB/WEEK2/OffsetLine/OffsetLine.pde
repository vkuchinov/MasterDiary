/*

OFFSET LINE

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

void setup(){
 
   size(400, 400, "processing.core.PGraphicsRetina2D"); 
  
   Line l = new Line(50, 50, 350, 350);
   l.offset(16.0);
   l.draw();
}

class Line{
 
     PVector p0, p1;
     
     Line(int x0_, int y0_, int x1_, int y1_){
      
         p0 = new PVector(x0_, y0_); p1 = new PVector(x1_, y1_);
       
     } 
     
     void draw(){
      
          noFill();
          stroke(0);
          strokeWeight(4);
          strokeCap(SQUARE);
          line(p0.x, p0.y, p1.x, p1.y);
       
     }
     
     void offset(float value_){
      
          float L = sqrt((p0.x - p1.x) * (p0.x - p1.x) + (p0.y - p1.y) * (p0.y - p1.y));
          
          PVector offset1 = new PVector(p0.x + value_ * (p1.y - p0.y) / L, p0.y + value_ * (p0.x - p1.x) / L );
          PVector offset2 = new PVector(p1.x + value_ * (p1.y - p0.y) / L, p1.y + value_ * (p0.x - p1.x) / L );
          PVector offset3 = new PVector(p0.x - value_ * (p1.y - p0.y) / L, p0.y - value_ * (p0.x - p1.x) / L );
          PVector offset4 = new PVector(p1.x - value_ * (p1.y - p0.y) / L, p1.y - value_ * (p0.x - p1.x) / L );

          noStroke();
          fill(255, 0, 255);
          
          beginShape();
          vertex(offset1.x, offset1.y);
          vertex(offset3.x, offset3.y);
          vertex(offset4.x, offset4.y);
          vertex(offset2.x, offset2.y);
          endShape(CLOSE);
       
     }
  
}

