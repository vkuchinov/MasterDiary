class Agent {

    float x, y;
    float angle = 0.0;
    float dir = 1.0;
    
    Agent() {
    
        float x = cos(radians(angle)) * 220;
        float y = sin(radians(angle)) * 220;
        
    } 
    
    void draw() {
    
        //angle = map(mouseX, 0.0, width, -120, 480);
        
        //repulsor 
        float dist = abs(angle - repulsor.angle); 
        
        float inc = 45.0;
        if(dir < 0) inc = 30.0;
        
        if (dist < inc) {
    
        float sine = sin(map(dist, inc, 0, 0, PI/2)) * 50.0;
        
        x = cos(radians(angle)) * (220 + sine * dir);
        y = sin(radians(angle)) * (220 + sine * dir);

        } else {

        x = cos(radians(angle)) * 220;
        y = sin(radians(angle)) * 220;
        
        }

        
        noStroke();
        fill(0);
        ellipseMode(CENTER);
        ellipse(x, y, 16, 16);
    
    }
}


