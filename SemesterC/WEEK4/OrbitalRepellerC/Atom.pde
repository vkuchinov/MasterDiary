class Agent {

    float x, y;
    float angle = 0.0;
    float dir = 1.0;
    float r = 220;
    float ns;
    float size;
    
    Agent() {
    
        ns = random(0.01, 0.05);
        size = random(8, 16);
        
        if(random(1) > 0.5) { dir = 1; } else { dir = -1; }
        angle = random(0, 360);
        float x = cos(radians(angle)) * r;
        float y = sin(radians(angle)) * r;
        
    } 
    
    void draw() {

        x = cos(radians(angle)) * (r);
        y = sin(radians(angle)) * (r);
  
        noStroke();
        fill(255, 255, 255);
        ellipseMode(CENTER);
        ellipse(x, y, size, size);
    
    }
}

class AgentList extends ArrayList<Agent>{
 
     void draw() { for(Agent a : this) { if(a.angle < 360) { a.angle += 1.5; } else { a.dir *= -1; a.angle = 0; } a.draw(); } } 
  
}
