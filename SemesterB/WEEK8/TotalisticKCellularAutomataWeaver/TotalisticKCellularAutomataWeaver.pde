/*

TOTALISTIC K-COLOUR CELLULAR AUTOMATA

A totalistic cellular automaton is a cellular automata in which 
the rules depend only on the total (or equivalently, the average) 
of the values of the cells in a neighborhood. 

These automata were introduced by Wolfram in 1983. Like 
an elementary cellular automaton, the evolution of 
a one-dimensional totalistic cellular automaton can completely 
be described by a table specifying the state a given cell will 
have in the next generation based on the average value of 
the three cells consisting of the cell to its left, 
the value the cell itself, and the value of the cell 
to its right.

For a k-color one-dimensional totalistic automaton, there are 
3k-2 possible states for the average of three cells neighboring 
a given cell, and a total of k^(3k-2) k-color totalistic cellular 
automata, each of which can be indexed with an (3k-2)-digit 
k-ary number, known as a "code." 

For example, the table giving  the evolution of the 3-color code 

777 = 1001210₃

₂ - binary
₃ - ternary numeral system
₄ - quaternary numeral system
₅ - quinary ...
₆ - senary ...
₇ - septenary
₈ - octal
₉ - nonary
...

In this diagram, the possible average values of the three 
neighboring cells are shown in the top row of each panel, and 
the resulting value the central cell takes in 
the next generation is shown below in the center. 

n generations of the totalistic cellular automaton code r with 
k colors is implemented in as 

CellularAutomaton[{r, {3, 1}}, {{1}, 0}, n, {All, All}].


REFERENCES:
http://mathworld.wolfram.com/TotalisticCellularAutomaton.html

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

PImage mask, pattern;

TotalisticK ca;
ArrayList<Integer> palette;
int kkk = 1000;
int lll = 1000;

void setup(){
  
   mask = loadImage("city2.png");

   size(588, 588, "processing.core.PGraphicsRetina2D");
   colorMode(HSB);
   
   int[] row = new int[mask.width];
   int dcolor = 0, k = 0;
   palette = new ArrayList<Integer>();
   
   for(int i = 0; i < mask.width; i++){
     
       int c = (int)mask.get(i, 0);
       if(c == -1) { break; }
       palette.add(c);
       k++;
   
   }

   
   for(int i = 0; i < mask.width; i++){
      for(int j = 0; j < palette.size(); j++){
        
        int c = mask.get(i, 1);
        if(c == palette.get(j)) row[i] = j;
        
      }
   }
   
   ca = new TotalisticK(palette.size(), new int[]{lll, 19370, kkk, 11117}, row, 147); //k, rule
   ca.generate();
   

}

void draw() { }

void keyPressed() {

  if (keyCode == UP) {
  kkk += 500;
  setup();
  }
  
  if (keyCode == DOWN) {
  kkk -= 500;
  setup();
  }
  
  if (keyCode == RIGHT) {
  lll += 500;
  setup();
  }
  
  if (keyCode == LEFT) {
  lll -= 500;
  setup();
  }
  
}

