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

/*

0: #BC2D19, 1: #FF8926, 2: #FFB00D, 3: #FCF2CB ...
background: #1E4363

This version is based on HSB

*/

TotalisticK ca;

void setup(){
  
   size(392, 392, "processing.core.PGraphicsRetina2D");
   colorMode(HSB);
   
   
   int[] row = new int[]{0, 0, 2, 2, 3, 3, 3, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 2, 2, 0, 0, 1, 3, 0, 0, 1, 1, 0, 0, 3, 3, 3, 3, 0, 0, 1, 1, 0, 0, 2, 0, 1, 0, 0}; 
   
   for(int i = 0; i < 2187; i++){
   
     ca = new TotalisticK(3, i, row, 49); //k, rule
     ca.generate();
     saveFrame("data/3/t3_"+ i +".jpg");
   
   }

   

}
