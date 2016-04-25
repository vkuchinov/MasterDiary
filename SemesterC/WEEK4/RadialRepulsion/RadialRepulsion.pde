/*

RADIAL REPULSION 
a very short experiment

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Agent agent;
Repulsor repulsor;

void setup() {
    
      size(700, 700);
      agent = new Agent();
      repulsor = new Repulsor();
      
}

void draw() {

      background(220);
      translate(width/2, height/2);
      
      stroke(0);
      noFill();
      ellipseMode(CENTER);
      ellipse(0, 0, 440, 440);
      
      stroke(0);

      agent.draw();
      repulsor.draw();
      
}


