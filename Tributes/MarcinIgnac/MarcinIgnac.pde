/*
Tribute to Marcin Ignac
[done with self-made typeface]

https://books.google.co.uk/books?id=PapljPXaSbwC&pg=PA432&lpg=PA432&dq=monks+ciphers+converter&source=bl&ots=yaaraMPr3-&sig=wo4vM8FjHqVbg35TPpi-HMzY7ts&hl=en&sa=X&ved=0CCsQ6AEwAmoVChMI47Ofh4P4yAIVA8kUCh07AAgl#v=onepage&q=monks%20ciphers%20converter&f=false
http://marcinignac.com/experiments/the-ciphers-of-the-monks/

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

char[][] chars = {  
                   { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' },  //000x
                   { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j' },  //00x0
                   { 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u' },  //0x00
                   { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J' }   //x000
                 };

PFont ciphers;
PFont label;

void setup(){
  
  size(570, 200, "processing.core.PGraphicsRetina2D");
  background(0);


  ciphers = loadFont("monks.vlw");
  label = loadFont("archivo.vlw");
  
  
}

void draw(){
  
 background(0); 
 
  int y = year();
  int m = month();
 
  renderNumber(str(year()), 60, 120);
  renderNumber(str(month()), 150, 120);
  renderNumber(str(day()), 240, 120);
  renderNumber(str(hour()), 330, 120);
  renderNumber(str(minute()), 420, 120);
  renderNumber(str(second()), 510, 120);
  
  
  
}

void renderNumber(String s_, int x, int y){
 
  colorMode(HSB);

  for(int c = s_.length() - 1; c >= 0; c--){
  
  char defChar = s_.charAt(c);
  fill(0, 240, 240);
  textFont(ciphers);
  textSize(96);
  if( c%2 == 1) { text(chars[(s_.length() - 1 - c)][int(defChar - 48)], x, y); }
  else { text(chars[s_.length() - 1 - c][int(defChar - 48)], x - 31, y); }

  }
 
  fill(0, 240, 240);
  textFont(label);
  textSize(12);
  text(s_, x, y + 20);
  
}
