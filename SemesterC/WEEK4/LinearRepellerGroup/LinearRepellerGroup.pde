/*

ORBITAL REPELLER

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

AgentList agents;
Repulsor r;
RepulsorGroup repulsors = new RepulsorGroup();

void setup() {
    
      size(700, 700);
      agents = new AgentList();
      
      for(int i = 0; i < 2000; i++){
        
          agents.add(new Agent());
        
      }
      
      r = new Repulsor();
      repulsors.add(r);
      
      
      for(int j = 0; j < 104; j++){
            
      float r = random(150, 250);
      float a = random(-PI, PI);
      float s = random(1, 12);
      
      Repulsor r2 = new Repulsor(r * cos(a), r * sin(a), s);
      repulsors.add(r2);
     
      }
      
      
}

void draw() {

      //background(0);
      fill(0, 8);
      rect(0, 0, width, height);
      translate(width/2, height/2);

      stroke(0);

      agents.draw();
      repulsors.draw();
      
      if(frameCount % 60 == 0) { agents.renew(512); }
      
      if(frameCount % 50 == 0) { repulsors.addNew(); }
      

}

