class Graph{
 
    int level;
    IntList nodes;
    ArrayList<Graph> children = new ArrayList<Graph>();
    Graph parent;
    
    Graph(int n_, int level_){
      
      level = level_;
      parent = null;
      nodes = hailstone( n_ );
      
      for(Integer n : nodes.array()){
        
          children.add(new Graph(n, level--, this));
        
      }
      
    }
    
    Graph(int n_, int level_, Graph parent_){
      
      level = level_;
      parent = this;
      nodes = hailstone( n_ );
      
      if(level > 0){
        
        for(Integer n : nodes.array()){
          
            children.add(new Graph(n, level-- , this));
          
        }
      
      }
      
    }
    
    void draw(){
      
      
    }
    
    IntList hailstone( int n_ ){
     
       IntList sequence = new IntList();
       sequence.append(n_);
      
       while( n_ > 1 ) {
      
       n_ = n_ % 2 != 0 ? 3 * n_ + 1 : n_ / 2;
       sequence.append(n_);
       
       } 
    
    return sequence;
  
    }
  
}
