class Dijkstra{
  
  ArrayList<Integer> fromA = new ArrayList<Integer>();
  ArrayList<Integer> fromB = new ArrayList<Integer>();
  
  Dijkstra(){
    
  }
  
  float euclidianHeuristic(PVector a_, PVector b_){
    
    return a_.dist(b_);
    
  }
  
}
