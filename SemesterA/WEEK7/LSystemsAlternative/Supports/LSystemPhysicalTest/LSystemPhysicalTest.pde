/*

L-RULE PHYSICAL TESTER
both for alphabetical and turtle syntax
without build-in push/pop matrices.

@auhtor Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk;

*/

//angle as z-axis
ArrayList<PVector> matrices = new ArrayList<PVector>();
PVector carriage; float carriageAngle;

String expanded = "F{+F}{-F}{+F{+F}{-F}}{-F{+F}{-F}}";
float len = 128.0;
float tmpLen = 312.0;

float angle = 45.0;

void setup(){
  
  size(800, 800);
  background(255);
  //translate(width/2, height - 32);
  //rotate(radians(-90));
  
  carriage = new PVector(width/2, height - 32);
  carriageAngle = -90.0;
  
  
  //starting point
  stroke(255, 0, 0);
  strokeWeight(8.0);
  point(carriage.x, carriage.y);
  
  for(int c = 0; c < expanded.length(); c++){
    
    char r = expanded.charAt(c);

    stroke(0);
    strokeWeight(1.0);
    
    switch(r){
      
        case 'A':
        float xA = carriage.x + cos(radians(carriageAngle)) * len;
        float yA = carriage.y + sin(radians(carriageAngle)) * len;
        line(carriage.x, carriage.y, xA, yA);
        carriage.x = xA; carriage.y = yA;
        break;
        
        case 'B':
        float xB = carriage.x + cos(radians(carriageAngle)) * len;
        float yB = carriage.y + sin(radians(carriageAngle)) * len;
        line(carriage.x, carriage.y, xB, yB);
        carriage.x = xB; carriage.y = yB;
        break;
        
        case ']':
        //popMatrix();
        carriage = matrices.get(matrices.size() - 1);
        carriageAngle = matrices.get(matrices.size() - 1).z;
        matrices.remove(matrices.size() - 1);
        carriageAngle -= angle;
        break;
        
        case '[':
        //pushMatrix();
        matrices.add(new PVector(carriage.x, carriage.y, carriageAngle));
        carriageAngle += angle;
        break;
        
        case 'F':
        float xF = carriage.x + cos(radians(carriageAngle)) * len;
        float yF = carriage.y + sin(radians(carriageAngle)) * len;
        stroke(0);
        strokeWeight(4);
        point(carriage.x, carriage.y);
        stroke(0, 255, 0);
        strokeWeight(1);
        line(carriage.x, carriage.y, xF, yF);
        carriage.x = xF; carriage.y = yF;
        break;
        
        case '{':
        matrices.add(new PVector(carriage.x, carriage.y, carriageAngle));
        //carriageAngle += angle;
        break;
        
        case '}':
        carriage = matrices.get(matrices.size() - 1);
        carriageAngle = matrices.get(matrices.size() - 1).z;
        matrices.remove(matrices.size() - 1);
        //carriageAngle -= angle;
        break;
        
        case '+':
        carriageAngle += angle;
        break;
        
        case '-':
        carriageAngle -= angle;
        break;
        

    }
    
  }
   
  //carriage ends here
  stroke(0, 0, 255);
  strokeWeight(4.0);
  point(carriage.x, carriage.y);
  
}
