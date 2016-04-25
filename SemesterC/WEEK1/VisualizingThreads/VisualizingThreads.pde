/*

VISUAL THREADS [concurent computing]
based on lovely demo for Go language by Ivan Daniluk
https://github.com/divan

REFERENCES:
https://habrahabr.ru/post/276255/
https://en.wikipedia.org/wiki/Concurrency_(computer_science)

//SaffronUmbrella
#24221F, #5E7C88, #FEB41C

@author    Vladimir V. KUCHINOV
@email     helloworld@vkuchinov.co.uk

*/

import java.lang.Runnable;
import java.util.concurrent.TimeUnit;

LineList lines = new LineList();
runnable t;

void setup(){
  
     size(800, 800, OPENGL); 
 
}


void draw(){
  
      background(#24221F);
      translate(width/2, height/2, millis()/1000);
      rotateX(-0.6);
      rotateY(0.025 * frameCount);
      
      stroke(#5E7C88);
      strokeWeight(6.0);
      float len = millis();
      line(0, -128, 0, 0, -128 + len, 0);
     
      if(t != null) { t = new runnable(t.index); } else { t = new runnable(50); }
      new Thread(t).start();
      
      lines.draw();

}
