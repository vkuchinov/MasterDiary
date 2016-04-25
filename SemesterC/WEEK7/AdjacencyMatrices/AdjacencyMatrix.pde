class AdjacencyMatrix {

  int id;
  ArrayList<Node> children;
  AdjacencyMatrix parent;

  //for zero level
  AdjacencyMatrix(int l_, int n_) {

    id = 0;
    children = new ArrayList();

    for (int n = 0; n < n_; n++) {
      children.add(new Node(n, 180.0/n_*n));
    }
  }  

  //for others
  AdjacencyMatrix(int l_, int n_, AdjacencyMatrix p_) {

    id = l_;
    parent = p_;
    children = new ArrayList();

    for (int n = 0; n < n_; n++) {
      children.add(new Node(n, 180.0/n_*n, parent.children));
    }
  }  
  
  public void shiftMatrix(float a_){
    
     for(int c = 0; c < children.size(); c++){
      
        children.get(c).angle += a_;
       
     }
  }
  
  public void shiftByID(int a_){

   Collections.rotate(children, 2);

  }

 
  //  public AdjacencyMatrix reflect() {
  //
  //    children = expand(children, children.length*2);
  //    for (int c = 0; c < children.length/2; c++) {  
  //      children[children.length + c].id = children[children.length + c];
  //      children[children.length + c].angle = 180.0 + children[c].angle;
  //      if (children[c].neighbours != null) {
  //        children[children.length + c].neigbours = new int[children[children.length + c].neighbours.length];
  //        for (int n = 0; n < children[c].neighbours.length; n++) {
  //          children[children.length + c].neigbours[n] = children[children.length + c].neighbours[n];
  //        }
  //      }
  //    }
  //  }
}

