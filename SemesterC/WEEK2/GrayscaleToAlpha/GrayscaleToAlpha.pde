/*

GRAYSCALE TO ALPHA

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

PImage source;
PGraphics output;

void setup(){
 
    source = loadImage("source.jpg");
    output = createGraphics(source.width, source.height, JAVA2D);
    size(source.width, source.height);
   
    output.beginDraw();
    
    for(int y = 0; y < source.height; y++){
      for(int x = 0; x < source.width; x++){
        
          float c = red(source.get(x, y));
          println(c);
          color alpha = color(255, 255, 255, map(c, 0, 255, 0, 255));
          output.set(x, y, alpha);
        
      }
    }
    
    output.endDraw();
  
    output.save("output.png");
    
}
