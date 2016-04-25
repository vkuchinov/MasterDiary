/*

LINEAR & RADIAL GROWTH

Line(float x_, float y_, float thetaInc_, float step_, int max_, int type_)
Line(float x_, float y_, float theta_, float thetaInc_, float step_, int max_, int type_)

//thetaInc is take from formula radius/step ratio
Line(float x_, float y_, float radius_, float step_, int max_){

  
@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Line l1, l2, l3;
LineList lines;

void setup(){
  
     size(600, 600); 
     
     //radial
     l1 = new Line(0.0, height/2 - 125, -0.0075, 3.0, 120, 1);
     //straight
     l2 = new Line(0.0, height/2 - 75, 0.0, 2.0, 50, 0);
     //radial, set by radius
     l3 = new Line(0.0, height/2 - 25, 300.0, 2.0, 80);
     
     //list
     lines = new LineList(0.0, height/2 + 25, 8, 10.0);
    
  
}

void draw(){
 
     //background(220);
     l1.draw();
     l2.draw(); 
     l3.draw();
  
     lines.draw();
     
}
