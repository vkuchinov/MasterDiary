/*

SWIRLING SVG

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import processing.pdf.*;
PShape heart;

void setup(){
  
     size(700, 700);
     background(255, 0, 255); 
     translate(width/2, height/2);
     noStroke();
     beginRecord(PDF, "output.pdf");
     for(int e = 17; e > 0; e--){
     heart = loadShape("heart.svg");
     float ratio = map(e, 0, 17, 1.0, 7.5);
     float nW = heart.width / 2.0 * ratio;
     float nH = heart.height / 2.0 * ratio;
     
     heart.disableStyle(); 
     heart.scale(ratio);
     if(e % 2 == 1) fill(255); else fill(0);
     shape(heart, 0 - nW, 0 - nH);
     rotate(0.2);
     }
     en/dRecord();
     

}
