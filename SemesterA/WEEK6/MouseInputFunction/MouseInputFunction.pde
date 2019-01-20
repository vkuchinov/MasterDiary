/*

MOUSE INPUT FUNCTION

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int rowByMouseX = 0;
boolean playerMove = true;
int count = 0;

void setup(){
  
   size(512, 512);
   noStroke();
   
   println("PLAYER TURN");

}

void draw(){
  
  fill(#068587);
  rect(0, 0, 128, 512);
   
  fill(#4FB99F);
  rect(128, 0, 128, 512);
   
  fill(#F2B134);
  rect(256, 0, 128, 512);
   
  fill(#ED553B);
  rect(384, 0, 128, 512);
  
  opponentMove();
    
}

void opponentMove(){
  
  
  if(!playerMove){
    
    count++;
    
    if(count > 120) { 
    
    println("opponent move:", floor(random(5)));
    println("PLAYER TURN"); playerMove = true; count = 0; 
  
    }
    
  }
  
}

void mouseClicked() {

  if(playerMove){
    
  rowByMouseX = (int)map(mouseX, 0, width, 1, 5);
  println("player move:", rowByMouseX);
  playerMove = false;
  println("OPPONENT TURN");
  
  }

}
