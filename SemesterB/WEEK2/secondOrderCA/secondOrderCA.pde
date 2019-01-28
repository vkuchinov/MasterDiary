/*

SECOND-ORDER CELLULAR AUTOMATA
[a type of reversible cellular automata [RCA]]

A second-order cellular automaton is a type of reversible cellular 
automaton (CA) invented by Edward Fredkin where the state of 
a cell at time t depends not only on its neighborhood at time t − 1, 
but also on its state at time t − 2.

CA2EvolveList[rule_List, {a_List, b_List}, t_Integer] := Map[First, NestList[CA2Step[rule, #]&, {a, b}, t]]
CA2Step[rule_List, {a_, b_}] := {b, Mod[a + rule[[ 8 - (RotateLeft[b] + 2 (b + 2 RotateRight[b])) ]], 2]}

The second-order cellular automaton technique is a method of transforming any cellular automaton 
into a reversible cellular automaton, invented by Edward Fredkin and first published by several 
other authors in 1984. 

In this technique, the state of each cell in the automaton at time t is 
a function both of its neighborhood at time t − 1 and of its own state at time t − 2. 

Specifically, the transition function of the automaton maps each neighborhood at time t − 1 to 
a permutation on the set of states, and then applies that permutation to the state at time t − 2. 
The reverse dynamics of the automaton may be computed by mapping each neighborhood to the inverse 
permutation and proceeding in the same way.

In the case of automata with binary-valued states (zero or one), there are only two possible 
permutations on the states (the identity permutation and the permutation that swaps the two states), 
which may themselves be represented as the exclusive or of a state with a binary value. 

In this way, any conventional two-valued cellular automaton may be converted to a second-order 
cellular automaton rule by using the conventional automaton's transition function on the states 
at time t − 1, and then computing the exclusive or of these states with the states at time t − 2 
to determine the states at time t. However, the behavior of the reversible cellular automaton 
determined in this way may not bear any resemblance to the behavior of the cellular automaton 
from which it was defined.

Any second-order automaton may be transformed into a conventional cellular automaton, in which 
the transition function depends only on the single previous time step, by combining pairs of 
states from consecutive time steps of the second-order automaton into single states of a conventional 
cellular automaton.

REFERENCES:
https://en.wikipedia.org/wiki/Second-order_cellular_automaton
http://www.wolframscience.com/nks/notes-9-2--second-order-cellular-automata/

FURTHER READINGS:
Billiard ball computation and low-power computing

Block Cellular Automaton:
Margolus neighborhood
The "Tron" rule 
https://dmishin.github.io/js-revca/help.html

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

PImage grid = createImage(128, 128, RGB);
int[][] matrix = new int[128][128];

int currentRule = 256;
int[] masterRule = { -1, -1, -1, -1, -1, -1, -1, -1 };
  
void setup() {
  
  size(544, 544);
  background(255);
  
  setCurrentRule(currentRule);

  setMatrix();
  calculateRule();
  drawMatrix();
  
}

void setCurrentRule(int rule)
{
  String binaryValue = binary(rule, 8);

  char[] binaries = new char[binaryValue.length()];
  for (int ch = 0; ch < binaryValue.length(); ch++)
  {
    binaries[ch] = binaryValue.charAt(ch);
  }

  int counter = 0;
  for (int element : masterRule)
  {
    
    masterRule[counter] = int(binaries[counter]) -48;
    if(masterRule[counter] == 0) { masterRule[counter] = -1; }
    counter++;
  }
}

void setMatrix(){
  
    for(int y = 0; y < 128; y++){
      for(int x = 0; x < 128; x++){
        
        matrix[x][y] = -1;
        float rnd = random(0.0, 1.0);
        if(y == 0 && rnd > 0.5) { matrix[x][y] = 1; }
        
      }
    }

}

void calculateRule(){
  
    for(int y = 1; y < 128; y++){
      for(int x = 0; x < 128; x++){
        
        int leftCell = -1, centerCell = -1, rightCell = -1, predecessorCell = -1;
        if(x != 0) { leftCell = matrix[x - 1][y - 1]; } else {leftCell = matrix[127][y - 1]; }
        centerCell = matrix[x][y - 1];
        if(x != 127) { rightCell = matrix[x + 1][y - 1]; } else { rightCell = matrix[0][y - 1]; }
 
        if(y > 1) { predecessorCell = matrix[x][y - 2]; }
        
        if (leftCell == 1 && centerCell == 1 && rightCell == 1) if (masterRule[0] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        if (leftCell == 1 && centerCell == 1 && rightCell == -1) if (masterRule[1] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        if (leftCell == 1 && centerCell == -1 && rightCell == 1) if (masterRule[2] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        if (leftCell == 1 && centerCell == -1 && rightCell == -1) if (masterRule[3] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        if (leftCell == -1 && centerCell == 1 && rightCell == 1) if (masterRule[4] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        if (leftCell == -1 && centerCell == 1 && rightCell == -1) if (masterRule[5] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        if (leftCell == -1 && centerCell == -1 && rightCell == 1) if (masterRule[6] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        if (leftCell == -1 && centerCell == -1 && rightCell == -1) if (masterRule[7] == -1) { matrix[x][y] = -1; } else { matrix[x][y] = 1; }
        
        if(predecessorCell == 1) { matrix[x][y] *= -1; }

      }
    }
  
}

void drawMatrix(){
  
    for(int y = 0; y < 128; y++){
      for(int x = 0; x < 128; x++){
        
        if(matrix[x][y] == 1) { grid.set(x, y, color(0, 0, 0)); }
        else { grid.set(x, y, color(255, 255, 255)); }
        
      }
    }
    
    grid.updatePixels();
    image(grid, 16, 16, 512, 512);
  
    save("rule_" + currentRule + ".tga");
}
