/*

METABALLS + CV

REFERENCES:
https://mathematica.stackexchange.com/questions/3345/how-to-make-an-inkblot

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;

Random seed = new Random(45454);
ArrayList<PVector> centers = new ArrayList<PVector>();
ArrayList<PVector> points = new ArrayList<PVector>();

void drawCircles(ArrayList<PVector> circles_) {
  
  for(int i = 0; i < circles_.size(); i++){
    
      PVector c = circles_.get(i);
      fill(255, 8);
      noStroke();
      for(int j = 0; j < c.z; j ++){
      ellipse(c.x, c.y, j * 2, j * 2);
      }
  }
  
}

void setup() {
  
  size(500, 500);
  background(0);
  smooth();

  for(int k = 0; k < 8; k++){
 
  float x = width / 2 - 90 + seed.nextInt(180);
  float y = height / 2 - 90 + seed.nextInt(180);
  float r = 32 + seed.nextInt(56);
  
  centers.add(new PVector(x, y, r));
  
  }
  
  drawCircles(centers);
  filter(POSTERIZE, 2);
  
  for(float theta = -PI; theta <= PI; theta += 0.05){
    
       boolean found = false;
       float r = width * height;
       
       while(!found){
         
           float x = width/2 + r * cos(theta);
           float y = height/2 + r * sin(theta);
           
           color c =  get((int)x, (int)y);
           if((red(c)+green(c)+blue(c)) / 3 > 128){
            
           points.add(new PVector(x, y));
           found = true;
           
           }
           
           r--;
      }

  }
  
  fill(255, 0, 255);
  stroke(0, 255, 255);
  strokeWeight(2);
  beginShape();
  for(int i = 0; i < points.size(); i += 1){
  vertex(points.get(i).x, points.get(i).y);
  point(points.get(i).x, points.get(i).y);
  }
  endShape(CLOSE);

}


