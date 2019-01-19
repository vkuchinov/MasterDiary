/*

MINIMAX (MM) ALGORITHM

Minimax (sometimes MinMax or MM[1]) is a decision rule used 
in artificial intelligence, decision theory, game theory, 
statistics and philosophy for minimizing the possible loss 
for a worst case (maximum loss) scenario. When dealing with gains, 
it is referred to as "maximin"—to maximize the minimum gain. 

                  !!!! MINIMAX IS RECURSIVE !!!!

Originally formulated for two-player zero-sum game theory, 
covering both the cases where players take alternate moves and 
those where they make simultaneous moves, it has also been 
extended to more complex games and to general decision-making 
in the presence of uncertainty.

Minimax is a decision-making algorithm, typically used in a turn-based, 
two player games. The goal of the algorithm is to find the 
optimal next move.

An interesting fact- in 1997, IBM’s chess-playing computer Deep Blue 
(built with Minimax) defeated Garry Kasparov (the world champion in chess).

REFERENCES:
https://en.wikipedia.org/wiki/Minimax

FURTHER READINGS:
https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning
https://en.wikipedia.org/wiki/Nash_equilibrium
https://en.wikipedia.org/wiki/Folk_theorem_(game_theory)


@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

/* board: #2E94B5, empty: #1F2226, red: #D6231E, yellow: #F8B500, reserved: #FFF4E0 */

MiniMax mm;
Connect4 game = new Connect4();

int rowByMouseX = 0;
boolean playerTurn = true;

void setup(){
  
   size(480, 416, "processing.core.PGraphicsRetina2D"); 
   background(#2E94B5);
   game.playAgainstComputer();
   
}

void draw(){
  
  background(#2E94B5);
  game.b.draw();
  
}

void mouseClicked() {

  if(playerTurn){
    
    rowByMouseX = (int)map(mouseX, 0, width, 1, 8);
    playerTurn = false;

  }
  
}

