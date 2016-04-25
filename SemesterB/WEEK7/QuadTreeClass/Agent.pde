class Agent{
  
    PVector position;
    PVector velocity;
    
    QuadTree parent;
    
        int type = 0;
        float radius = 0;
        Agent(float x_, float y_){
        position = new PVector(x_, y_);
        velocity = new PVector(random(-6, 6), random(-6, 6));
    
    }
    
    void update(){
    
        if(position.x < 5 || position.x > width - 5) velocity.x *= -1;  
        if(position.y < 5 || position.y > height - 5) velocity.y *= -1;   
        position.add(velocity);
    
    }
    
    void setRadius(float radius_){ radius = radius_; }
    void setNode(QuadTree quadTree_){ parent = quadTree_; }
    
    void draw(){
    
        if(this.type == 0) { strokeWeight(5); } else { strokeWeight(10); }
        stroke(0);
        point(this.position.x, this.position.y);    
    
    }
    
    void highlight(){
    
        if(this.type == 0) { strokeWeight(5); } else { strokeWeight(10); }
        stroke(255, 255, 0);
        point(this.position.x, this.position.y);    
    
    }
    
}
    
class AgentList extends ArrayList<Agent>{
    
    void connectAgents(Agent a_){
     
        for(int a = 0; a < this.size(); a++){ if(a_ != this.get(a)) { stroke(0); strokeWeight(0.5); line(a_.position.x, a_.position.y, this.get(a).position.x, this.get(a).position.y); } } 
     
    }
    
    void connectAgents(Agent a_, int K_){
     
        if(this.size() >= K_) for(int a = 0; a < K_; a++){ if(a_ != this.get(a)) { stroke(0); strokeWeight(0.5); line(a_.position.x, a_.position.y, this.get(a).position.x, this.get(a).position.y); } } 
     
    }
    
     
    void connectAgents(Agent a_, float radius_){
     
        for(int a = 0; a < this.size(); a++){ if(PVector.dist(a_.position, this.get(a).position) < radius_ && a_ != this.get(a)) { stroke(0); strokeWeight(0.5); line(a_.position.x, a_.position.y, this.get(a).position.x, this.get(a).position.y); } } 
     
    }
    
    void sortByDistance(Agent a_){
     
        //bubble sort
        for(int i = 0; i < this.size(); i++) {
            for(int j = i + 1; j < this.size(); j++) {
            
                Agent tmp;
                if(PVector.dist(a_.position, this.get(i).position) > PVector.dist(a_.position, this.get(j).position)) {
                  
                    tmp = this.get(i);
                    this.set(i, this.get(j));
                    this.set(j, tmp);
                    
                }
          
            }
        }
      
    }

}
