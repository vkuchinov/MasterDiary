/*

WANG TILES

looks like Braid(ed) patterns...


Wang tiles (or Wang dominoes), first proposed by mathematician, 
logician, and philosopher Hao Wang in 1961, are a class of formal systems. 
They are modelled visually by square tiles with a color on each side. 
A set of such tiles is selected (for example the set in the picture). 
Then copies of the tiles are arranged side by side with matching colors, 
but without rotating or reflecting the tiles.

APPLICATION

Wang tiles have recently become a popular tool for procedural synthesis of textures, 
heightfields, and other large and nonrepeating bidimensional data sets; a small set 
of precomputed or hand-made source tiles can be assembled very cheaply without 
too obvious repetitions and without periodicity. In this case, traditional 
aperiodic tilings would show their very regular structure; much less 
constrained sets that guarantee at least two tile choices for any two 
given side colors are common because tileability is easily ensured and each 
tile can be selected pseudorandomly.

Wang tiles have also been used in cellular automata [CA] theory decidability proofs.
    
    THERE ARE 13 CLASSICAL TILES:
    
    R: red, G: green, B: blue, Y: yellow, K: black(grey), starting from 
    top clockwise:
    
    GGBR    GBGR    GBBG    RRGG    RRBB    RGGB
    YYRY    BYGY    GKRY    GKYY    YKRK    BKGK  GYGK  
    
    
VISUAL REFERENCES:
http://www.antoniosiber.org/wang_tiles/hex_wang_tiles_1.jpg
http://igl.ethz.ch/teaching/tau/sadna04/wang_tiles.html

TASK: should be fully generative (no pre-calculated tiles) and
      output has to be in vector format, not bitmap.
      
REFERENCES:
https://en.wikipedia.org/wiki/Wang_tile

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/
import java.util.Random;
import processing.pdf.*;

Random seed = new Random(123);

Wang2 wang2;
Wang8 wang8;

Wang5HEX wang5HEX;
Experimental experimental;

void setup(){
  
   size(800, 800, "processing.core.PGraphicsRetina2D"); 
   background(240);
   
   //wang2 = new Wang2(35, 35, 20.0, new PVector(50, 50));
   //wang8 = new Wang8(35, 35, 20.0, new PVector(50, 50));
   beginRecord(PDF,"output.pdf");
   //wang5HEX = new Wang5HEX(38, 45, 16.0, new PVector(40, 40));
   experimental = new Experimental(38, 45, 16.0, new PVector(40, 40));
   endRecord();
}

void draw(){
  
  //wang2.changeElements(16);
  
}
