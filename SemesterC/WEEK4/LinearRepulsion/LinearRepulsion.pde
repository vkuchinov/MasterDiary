/*

LINEAR FLOW AROUND

@author   Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.uk

*/

Agent agent;
Repulsor repulsor;

void setup() {
    
      size(700, 400);
      agent = new Agent();
      repulsor = new Repulsor();
      
}

void draw() {

      background(220);
      stroke(0);
      line(0, height/2, width, height/2); 
      agent.draw();
      repulsor.draw();
      
}

class Agent {

    float x, y;
    float dir = 1.0;
    
    Agent() {
    
        x = 40;
        y = height/2;
        
    } 
    
    void draw() {
    
        x = mouseX;
        
        //repulsor 
        float dist = dist(x, y, repulsor.x, repulsor.y); 
        if (dist < 120) {
        
        y = height/2 + map(dist, 120, 0, 0, 120) * dir;
        } else {
        dir *= -1;  
        y = height/2;
        }
        
        noStroke();
        fill(0);
        ellipseMode(CENTER);
        ellipse(x, y, 32, 32);
    
    }
}

class Repulsor {

    float x, y;
    
    Repulsor() {
    
          x = width/2;
          y = height/2;
          
    } 

    void draw() {
    
          noStroke();
          fill(255);
          ellipseMode(CENTER);
          ellipse(x, y, 64, 64);
    }
}

