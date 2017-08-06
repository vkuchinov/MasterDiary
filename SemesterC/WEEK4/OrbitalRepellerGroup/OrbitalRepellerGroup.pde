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
      
      for(int i = 0; i < 512; i++){
        
          agents.add(new Agent());
        
      }
      
      r = new Repulsor();
      repulsors.add(r);
      
      
      for(int j = 0; j < 256; j++){
            
      float r = random(160, 240);
      float a = random(-PI, PI);
      float s = random(3, 5);
      
      Repulsor r2 = new Repulsor(r * cos(a), r * sin(a), s);
      repulsors.add(r2);
     
      }
      
      
}

void draw() {

      //background(0);
      fill(0, 32);
      rect(0, 0, width, height);
      translate(width/2, height/2);

      stroke(0);

      agents.draw();
      repulsors.draw();
      
      if(frameCount % 50 == 0) { repulsors.addNew(); }
      

}

