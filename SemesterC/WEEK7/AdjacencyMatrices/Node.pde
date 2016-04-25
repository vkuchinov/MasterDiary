class Node{
  
int id;
float angle;
boolean state;
int[] neighbours;

  //zero level nodes
  Node(int i_, float a_){
  state = false;
  id = i_;
  angle = a_;
  state = seed.nextBoolean();
  }

  //others
  Node(int i_, float a_, ArrayList<Node> parents){
  state = false;
  id = i_;
  angle = a_;
  neighbours = findAllNeighbours(parents);
  if(neighbours != null ) { printArray(neighbours); state = seed.nextBoolean(); }
  }
  
  private int[] findAllNeighbours(ArrayList<Node> p_){
  
    //3 of a kind
    for(int p = 0; p < p_.size(); p++){
       if(abs(p_.get(p).angle - angle) < 0.01) { 
       
       IntList tmp = new IntList();
       if(p_.get(p).state) tmp.append(p);
       if(p - 1 > 0 && p_.get(p - 1).state) tmp.append(p - 1);
       if(p < p_.size() -1 && p_.get(p + 1).state) tmp.append(p + 1);
       if(tmp.array().length > 0) return tmp.array();
       } 
    }
    
    //two of a kind
    
    float min_angle = 360.0;
    int closest = 0;
    IntList tmp = new IntList();
    
    for(int p = 0; p < p_.size(); p++){
       if(abs(p_.get(p).angle - angle) < min_angle) { min_angle = abs(p_.get(p).angle - angle); closest = p; } 
    }
    
    if(p_.get(closest).state) { tmp.append(closest); }
    if(closest < p_.size() - 1 && p_.get(closest + 1).state) tmp.append(closest + 1);
    if(tmp.array().length > 0) { return tmp.array(); }

    
  return null; 
  
  }
  
  private int[] reduceNeighbours(int[] p_, Node[] parents){
  
    int[] valid = new int[0];
    
    for(int p = 0; p < p_.length; p++){
       if(parents[p_[p]].state) { valid = expand(valid, valid.length + 1); valid[valid.length - 1] = p_[p]; }
    }
    
  if(valid.length > 0) { return valid; } else { return null; }
  
  }
  
}
