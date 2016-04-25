/*

WINDOW RESIZE & TITLE

@author  Vadimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

int x = 500, y = 500;
void setup(){
frameRate(1);
size(x , y);
frame.setResizable(true);

}

void draw(){
int rand_x = (int)random(-150, 150);
int rand_y = (int)random(-150, 150);
frame.setSize(x + rand_x, y + rand_y); 
size(x + rand_x, y + rand_y);
frame.setTitle("x: " + str(x + rand_x) + " y: " + str(y + rand_y));
noStroke();
fill(0);
rect(0, 0, x + rand_x, y + rand_y);

}
