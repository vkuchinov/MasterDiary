class Agent {

    float x, y;
    float angle = 0.0;
    float dir = 1.0;
    float r = 220;
    float ns;
    float size;
    
    Agent() {
    
        ns = random(0.01, 0.05);
        size = random(3, 8);
        
        if(random(1) > 0.5) { dir = 1; } else { dir = -1; }
        angle = random(0, 360);
        float x = cos(radians(angle)) * r;
        float y = sin(radians(angle)) * r;
        
    } 
    
    void draw() {
  
        float noiseScale = ns;
        float noiseVal = -32 + 64.0 * noise( x * noiseScale, y * noiseScale);
        
        //repulsor 
        float dist2 = PVector.dist(new PVector(x, y), new PVector(repulsor.x, repulsor.y));
    
        if(dist2 < 128) { 
          
        float dist = acos(cos(angle - repulsor.angle));
        float inc = 45.0;
   
        float sine = sin(map(dist, inc, 0, 0, PI/2)) * 64.0;
        
        println(sine);
        
        x = cos(radians(angle)) * (r + noiseVal + sine * dir * map(dist2, 0, 128, 1.0, 0.01));
        y = sin(radians(angle)) * (r + noiseVal + sine * dir * map(dist2, 0, 128, 1.0, 0.01));
        } else {

        x = cos(radians(angle)) * (r + noiseVal);
        y = sin(radians(angle)) * (r + noiseVal);
        
        }
        
        noStroke();
        fill(255, 255, 255, 192);
        ellipseMode(CENTER);
        ellipse(x, y, size, size);
    
    }
}

class AgentList extends ArrayList<Agent>{
 
     void draw() { for(Agent a : this) { if(a.angle < 360) { a.angle += 1.5; } else { a.dir *= -1; a.angle = 0; } a.draw(); } } 
  
}
