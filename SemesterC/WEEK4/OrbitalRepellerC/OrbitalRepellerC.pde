/*

ORBITAL REPELLER

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

AgentList agents;
Repulsor repulsor;

void setup() {
    
      size(700, 700);
      agents = new AgentList();
      
      for(int i = 0; i < 1; i++){
        
          agents.add(new Agent());
        
      }
      
      //repulsor = new Repulsor();
      
}

void draw() {

      background(0);
      translate(width/2, height/2);

      noStroke();
      fill(240, 240, 240, 128);
      ellipseMode(CENTER);
      ellipse(0, 0, 440, 440);
      
      stroke(0);

      agents.draw();
      //repulsor.draw();
      
      //println(agent.angle, repulsor.angle);

}

