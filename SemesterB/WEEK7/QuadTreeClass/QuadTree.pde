import java.util.Map;
import java.util.TreeMap;
import java.util.SortedMap;

class QuadTree {

static final int MAX_LEVELS = 6;

    Node n;
    QuadTree parent;
    QuadTree[] children;
    int level;
    
    QuadTree(Node n_) {
      
        this.n = n_;
        parent = null;
        children = null;
        level = 0;
    
    }
    
    QuadTree(QuadTree parent_, Node n_, int level) {
    
        parent = parent_;
        this.n = n_;
        children = null;
        this.level = level;
        
    }

    QuadTree[] divide() {
      
        if (children == null && level < MAX_LEVELS) {
          
            children = new QuadTree[4];
            Node[] n2 = n.quarter();
            for (int i = 0; i < 4; ++i) {
            children[i] = new QuadTree(this, n2[i], level + 1);
            
            }
        }
        
        return children;
    
    }
    
    void draw() {
      
        n.draw();
        if (children == null) return;
        
        for (int i = 0; i < 4; ++i) {
          
        children[i].draw();
        
        }
    
    }
    
    QuadTree getSmallestIntersect(Agent a_) {
      
        if (children == null) {
          
            if (n.pointInside(a_.position.x, a_.position.y)) {
              
                n.objects.add(a_);
                return this;
            
            } else {
              
                n.filled = false;
                return null;
            
            }
            
        }
        
        for (int i = 0; i < 4; ++i) {
    
        QuadTree q = children[i].getSmallestIntersect(a_);
        if (q != null) {
          
            if( q.children == null) { q.n.filled = true; n.objects.add(a_); } else {  q.n.filled = false; }
            return q;
            
            }
            
        }
    
        return null;
    
    }
    
    void neighboursByRadius(Agent a_, float radius_){
    
        AgentList neighbours = new AgentList();
        
        if(this.children != null){
          
            for (int i = 0; i < 4; ++i) { if(this.children[i].intersect(a_.position.x, a_.position.y, radius_)) { this.children[i].neighboursByRadiusDown(a_, radius_, neighbours);  } }
        
        }
        
        if(intersect(a_.position.x, a_.position.y, radius_) && parent != null) { { parent.neighboursByRadiusUp(this, a_, radius_, neighbours); }}
         
        neighbours.connectAgents(a_, radius_);
        
        }
        
        void neighboursByRadius(Agent a_, float radius_, AgentList agents_){
        
        if(this.children != null){
          
            for (int i = 0; i < 4; ++i) { if(this.children[i].intersect(a_.position.x, a_.position.y, radius_)) { this.children[i].neighboursByRadiusDown(a_, radius_, agents_);  } }
        
        }
        
        if(intersect(a_.position.x, a_.position.y, radius_) && parent != null) { { parent.neighboursByRadiusUp(this, a_, radius_, agents_); }}
     
    }
    
    void neighboursByRadiusDown(Agent a_, float radius_, AgentList agents_){
    
        if(this.children == null){
         
            if(this.intersect(a_.position.x, a_.position.y, radius_)) { agents_.addAll(this.n.objects); }
        
        }
        else{
          
            for (int i = 0; i < 4; ++i) {
              
                if(this.children[i].intersect(a_.position.x, a_.position.y, radius_)) { this.children[i].neighboursByRadiusDown(a_, radius_, agents_);  }
            
            }
        
        }
    
    }
    
    void neighboursByRadiusUp(QuadTree q_, Agent a_, float radius_, AgentList agents_){
    
 
    for (int i = 0; i < 4; ++i) {
    
        if(this.children[i] != q_){
          
            if(this.children[i].children != null) {  this.children[i].neighboursByRadiusDown(a_, radius_, agents_); } else { 
            
            //this.children[i].blueHighlight();  
            agents_.addAll(this.children[i].n.objects);}
            
            }
            
        }
        
        if(intersect(a_.position.x, a_.position.y, radius_) && parent != null) { { parent.neighboursByRadiusUp(this, a_, radius_, agents_); }}
     
    }
    
    void neighboursByK(Agent a_, int K_){
    
        AgentList neighbours = new AgentList();
         
        //goes down
        if(this.children != null){
        
        for (int i = 0; i < 4; ++i) {
         
         AgentList objs = children[i].n.objects;
         for(int o = 0; o < objs.size(); o++){ neighbours.add(objs.get(o)); }
         if(this.children[i].children != null) { this.children[i].neighboursByKDown(a_, K_, neighbours); }
        }
        
        }
        
        //goes up
        if(neighbours.size() < K_){ parent.neighboursByKUp(a_, K_, neighbours); }
        
        //gets worst distance
        float worstDistance = Float.MIN_VALUE;
        for(int n = 0; n < neighbours.size(); n++){ float dist = PVector.dist(a_.position, neighbours.get(n).position); worstDistance = max(worstDistance, dist); }
        
        //clear neighbours
        neighbours.clear();
        neighboursByRadius(a_, worstDistance, neighbours);
        
        //sort neighbourst by distance
        neighbours.sortByDistance(a_);
        
        //select and highlight all apropriate neighbours
        neighbours.connectAgents(a_, K_);

    }
    
    void neighboursByKDown(Agent a_, int K_, AgentList agents_){
     
        if(this.children != null){
        
            for (int i = 0; i < 4; ++i) {
             
             AgentList objs = children[i].n.objects;
             for(int o = 0; o < objs.size(); o++){ agents_.add(objs.get(o)); }
             if(this.children[i].children != null) { this.children[i].neighboursByKDown(a_, K_, agents_); }
            }
        
        }
     
    }
    
    void neighboursByKUp(Agent a_, int K_, AgentList agents_){
     
        if(this.children != null){
        
            for (int i = 0; i < 4; ++i) {
             
             AgentList objs = children[i].n.objects;
             for(int o = 0; o < objs.size(); o++){ agents_.add(objs.get(o)); }
             if(this.children[i].children != null) { this.children[i].neighboursByKDown(a_, K_, agents_); }
            }

    }
    
    //goes up
    if(agents_.size() < K){ parent.neighboursByKUp(a_, K_, agents_); }
     
    }
    
     AgentList sortByDistance(Agent a_, int K_, AgentList agents_){
    
     AgentList outputs = new AgentList();
     SortedMap<Float, Agent> sorted = new TreeMap<Float, Agent>();
     
     for(int a = 0; a < agents_.size(); a++){
    
     if(agents_.get(a) != a_) sorted.put(PVector.dist(a_.position, agents_.get(a).position), agents_.get(a));
     
     }
    
     int count = 0;
     for (Map.Entry entry : sorted.entrySet()) {
    
     if (count >= K_) break;
     outputs.add((Agent)entry.getValue());
     count++;
     
     }
    
     println(outputs.size());
     return outputs;
    
    }
    
    boolean intersect(float x_, float y_, float radius_){
     
        float x1 = n.Xl; float x2 = n.Xh;
        float y1 = n.Yl; float y2 = n.Yh;
        
        //horizontal
        double recthalfWidth = (x2 - x1) / 2.0;
        double recthalfHeight= (y2 - y1) / 2.0;
        
        double cx = Math.abs(x_ - x1 - recthalfWidth);
        double distByX = recthalfWidth + radius_;
        
        if (cx > distByX) return false;
        
        //vertical
        double cy = Math.abs(y_ - y1 - recthalfHeight);
        double distByY = recthalfHeight + radius_;
        
        if (cy > distByY)  return false;
        
        //diagonals
        if (cx <= recthalfWidth || cy <= recthalfHeight) return true;
        
        double xCornerDist = cx - recthalfWidth;
        double yCornerDist = cy - recthalfHeight;
        double xCornerDistSq = xCornerDist * xCornerDist;
        double yCornerDistSq = yCornerDist * yCornerDist;
        double maxCornerDistSq = radius_ * radius_;
        
        return xCornerDistSq + yCornerDistSq <= maxCornerDistSq;
    
    }
    
      void greenHighlight() {
      
        n.greenHighlight();
        if (children == null) return;
        
        for (int i = 0; i < 4; ++i) {
          
        children[i].greenHighlight();
        
        }
    
    }
    
    void blueHighlight() {
      
        n.blueHighlight();
        if (children == null) return;
        for (int i = 0; i < 4; ++i) {
          
        children[i].blueHighlight();
        
        }
    
    }
    
 
}
