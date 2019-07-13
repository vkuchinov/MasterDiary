class Node {

    final static float EPSILON = 1E-20;
    
    float Xl, Yl;
    float Xh, Yh;
    boolean filled = false;
    int type = 0;
    
    //alway would be only one
    AgentList objects = new AgentList();    
    Node(float X_1, float Y_1, float X_2, float Y_2) {
    
        Xl = min(X_1, X_2);
        Xh = max(X_1, X_2);
        Yl = min(Y_1, Y_2);
        Yh = max(Y_1, Y_2);
    
    }
    
    //migrating agents
    Node(ArrayList<Agent> objects_, float X_1, float Y_1, float X_2, float Y_2) {
    
        Xl = min(X_1, X_2);
        Xh = max(X_1, X_2);
        Yl = min(Y_1, Y_2);
        Yh = max(Y_1, Y_2);
        
        for(int a = 0; a < objects_.size(); a++){ if(objects_.get(a).position.x > Xl && objects_.get(a).position.x <= Xh && objects_.get(a).position.y > Yl && objects_.get(a).position.y <= Yh) objects.add(objects_.get(a)); }
    
    }
    
    boolean pointInside(float x, float y) { return x > Xl && x < Xh && y > Yl && y < Yh; }
    
    Node[] quarter() { return quarter(0); }
    
    Node[] quarter(float d) {
    
        float Xm = 0.5*(Xl+Xh);
        float Ym = 0.5*(Yl+Yh);
        Node[] quads = new Node[4];
        
        if(objects.size() == 0){
          
            quads[0] = new Node(Xm-d, Yh+d, Xh+d, Ym-d);
            quads[1] = new Node(Xl-d, Yh+d, Xm+d, Ym-d);
            quads[2] = new Node(Xl-d, Ym+d, Xm+d, Yl-d);
            quads[3] = new Node(Xm-d, Ym+d, Xh+d, Yl-d);
        
        }
        else{
          
            quads[0] = new Node(objects, Xm-d, Yh+d, Xh+d, Ym-d);
            quads[1] = new Node(objects, Xl-d, Yh+d, Xm+d, Ym-d);
            quads[2] = new Node(objects, Xl-d, Ym+d, Xm+d, Yl-d);
            quads[3] = new Node(objects, Xm-d, Ym+d, Xh+d, Yl-d);
        
        }
        
        objects.clear();
        
        return quads;
        
    }
    
    void draw() {
    
        stroke(0);
        strokeWeight(0.5);
        if(filled) { fill(255, 0, 0, 4); }
        else { noFill(); }
        rect(Xl, Yl, Xh-Xl, Yh-Yl);
    
    }
    
    void greenHighlight() {
    
        noStroke();
        fill(0, 255, 0, 8); 
        rect(Xl, Yl, Xh-Xl, Yh-Yl);
    
    }
    
    void blueHighlight() {
    
        noStroke();
        fill(0, 0, 255, 8); 
        rect(Xl, Yl, Xh-Xl, Yh-Yl);
    
    }

}

