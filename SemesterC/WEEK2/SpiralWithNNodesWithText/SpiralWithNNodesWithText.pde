/*

SPIRAL WITH N-NODES v1.0

REFERENCES:
http://mathworld.wolfram.com/topics/Spirals.html

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Map;

Spiral s;

ArrayList<Word> words = new ArrayList<Word>();
PVector data[]; 


ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();

void setup(){
 
   size(512, 512, "processing.core.PGraphicsRetina2D"); 
   translate(width/2, height/2);
   
   words.add(new Word("road", 48.0));
   words.add(new Word("iteration", 38.0));
   words.add(new Word("jacket", 34.0));
   words.add(new Word("planetary", 35.0));
   words.add(new Word("barrel", 32.0));
   words.add(new Word("apple", 30.0));
   words.add(new Word("block", 28.0));
   words.add(new Word("blaster", 20.0));
   words.add(new Word("widow", 12.0));
   words.add(new Word("kebab", 11.0));
   words.add(new Word("umbrella", 9.0));
   
   data = new PVector[words.size()];
   int count = 0;

   for(Word word : words) {

      float h = word.size * 2;
      textSize(h);
      float w = textWidth(word.w);
      data[count] = new PVector(w, h);
      count++;

   }
   
   s = new Spiral(200, 512);
   s.draw();
   
   fill(220, 128);
   rect(-width/2, -height/2, width, height);

   sortByHeight();
   
   s.setRectangles(data);
   s.drawRectangles();
   
}

void sortByHeight(){
  
  
  
}
