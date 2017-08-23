class Agent {

    float x, y;
    float angle = 0.0;
    float dir = 1.0;
    float r = random(150, 250);
    float ns;
    float size;
    float speed;
    
    Agent() {
    
        speed = random(0.4, 1.2);
        
        ns = random(0.01, 0.05);
        size = random(0.8, 1.2);
        
        if(random(1) > 0.5) { dir = 1; } else { dir = -1; }
        angle = random(0, 360);
        float x = cos(radians(angle)) * r;
        float y = sin(radians(angle)) * r;
        
    } 
    
    void draw() {
  
        float noiseScale = ns;
        float noiseVal = -32 + 64.0 * noise( x * noiseScale, y * noiseScale);
        
        //repulsor 
        
        float rr = r;
        float sine = 0.0;
        
        for(Repulsor rep : repulsors) {
          
        float dist2 = PVector.dist(new PVector(x, y), new PVector(rep.x, rep.y));
    
        if(rep.type == 1) { 
          
            if(dist2 < rep.size * 2) { 
              
            float dist = acos(cos(angle - rep.angle));
            float inc = rep.size;
       
            sine = sin(map(dist, inc, 0, 0, PI/2)) * rep.size * 1.5 * dir * map(dist2, 0, rep.size * 2, 1.0, 0.01);
            rr += sine;
            
            }
            
            } else {
              
            if(dist2 < rep.size) { 
              
            //should be exponential mapping
            if(rep.angle > angle) { speed *= 0.95; } else { speed /= sqrt(0.95); }
            float dist = acos(cos(angle - rep.angle));
            float inc = rep.size;
       
            sine = sin(map(dist, inc, 0, 0, PI/2)) * rep.size * 1. * dir * map(dist2, 0, rep.size, 1.0, 0.01);
            rr += sine;
            if(dir == 1) { r = max(rr, r); } else { r = min(rr, r); }
            }
        
        }
        
        x = cos(radians(angle)) * (rr);
        y = sin(radians(angle)) * (rr);
      
        }
        
        if(angle < 360) { angle += speed; } else { dir *= -1; angle = 0.0; }
             
        noStroke();
        fill(255, 255, 255, 192);
        ellipseMode(CENTER);
        ellipse(x, y, size, size);
    
    }
}

class AgentList extends ArrayList<Agent>{
 
     void draw() { for(Agent a : this) { a.draw(); } } 
  
}