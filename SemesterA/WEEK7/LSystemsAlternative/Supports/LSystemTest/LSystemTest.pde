/*

L-RULE TESTER
both for alphabetical and turtle syntax

@auhtor Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk;

*/

String expanded = "BBBBBBBB[BBBB[BB[B[A]A]B[A]A]BB[B[A]A]B[A]A]BBBB[BB[B[A]A]B[A]A]BB[B[A]A]B[A]A";
//turtle 1: for this case I am replacing [, ] constants here with {, }
String expanded2 = "F{+SF}{-SF}{+SF{+SF}{-SF}}{-SF{+SF}{-SF}}{+SF{+SF}{-SF}{+SF{+SF}{-SF}}{-SF{+SF}{-SF}}}{-SF{+SF}{-SF}{+SF{+SF}{-SF}}{-SF{+SF}{-SF}}}";
//turtle 2
String expanded3 = "FSF{-FSF{-FSF{-FSF{-FSF{-FX}+FX}+FSF{-FX}+FX}+FSF{-FSF{-FX}+FX}+FSF{-FX}+FX}+FSF{-FSF{-FSF{-FX}+FX}+FSF{-FX}+FX}+FSF{-FSF{-FX}+FX}+FSF{-FX}+FX}+FSF{-FSF{-FSF{-FSF{-FX}+FX}+FSF{-FX}+FX}+FSF{-FSF{-FX}+FX}+FSF{-FX}+FX}+FSF{-FSF{-FSF{-FX}+FX}+FSF{-FX}+FX}+FSF{-FSF{-FX}+FX}+FSF{-FX}+FX";


float len = 128.0;
ArrayList<Float> tmpLens = new ArrayList<Float>();

float angle = radians(45.0);

void setup(){
  
  size(800, 800);
  background(255);
  translate(width/2, height - 32);
  rotate(radians(-90));
  
  //starting point
  stroke(255, 0, 0);
  strokeWeight(8.0);
  point(0, 0);
  
  for(int c = 0; c < expanded3.length(); c++){
    
    char r = expanded3.charAt(c);

    stroke(0);
    strokeWeight(1.0);
    
    switch(r){
      
        case 'A':
        line(0, 0, len, 0);
        translate(len, 0); 
        break;
        
        case 'B':
        line(0, 0, len, 0);
        translate(len, 0); 
        break;
        
        case '[':
        pushMatrix();
        //rotate(angle);
        break;
        
        case ']':
        popMatrix();
        //rotate(-angle);
        break;
        
        case 'F':
        line(0, 0, len, 0);
        translate(len, 0); 
        break;
        
        case 'S':
        len *= 0.5;
        break;
        
        case '-':
        rotate(-angle);
        break;
        
        case '+':
        rotate(angle);
        break;
        
        case '{':
        pushMatrix();
        tmpLens.add(len);
        break;
        
        case '}':
        popMatrix();
        len = tmpLens.get(tmpLens.size() - 1);
        tmpLens.remove(tmpLens.size() - 1);
        break;

    }
    
  }
   
  //carriage ends here
  stroke(0, 0, 255);
  strokeWeight(4.0);
  point(0, 0);
  
}
