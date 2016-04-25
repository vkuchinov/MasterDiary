class Markov extends TreeMap{
  
  int counter = 0;
  MarkovNode currentNode;
  
  void draw(){
    
  }
  
   void setConnection(String this_, String destination_, float value_){
   
   MarkovNode m = (MarkovNode)this.get(this_); 
   m.addConnection(destination_, value_);
     
   }
   
   void nextStep(){
     
     if(counter == 0) { currentNode = (MarkovNode)this.firstEntry().getValue();}
     else {
     
     ArrayList<String> chances = new ArrayList();
     
       for(Entry<String, Float> entry : currentNode.connections.entrySet()){
              
           float num = entry.getValue() * 99;
           
           for(int c = 0; c < num; c++){
              chances.add(entry.getKey()); 
           }
         
       }
       
     long seed = System.nanoTime();
     Collections.shuffle(chances, new Random(seed));
     currentNode = (MarkovNode)this.get(chances.get(0));
       
     }
     
     counter++;
     
   }
   
   String getCurrentName(){ return currentNode.name; }
   void printCurrentNode(){ println("current node is " + currentNode.name); }
   
   float sum(Collection<Float> list_){
     
     Float[] values = list_.toArray(new Float[list_.size()]);
     float out = 0.0;
     
     for (Float val : values){
     out += val;
     }
     
     return out;
     
   }

}

class MarkovNode{
 
 int id;
 String name;
 
 HashMap<String, Float> connections = new HashMap<String, Float>();
 
 MarkovNode(int id_, String name_){
  
   id = id_;
   name = name_;
   
 } 
 
 void addConnection(String destination_, float value_){
   
   if(destination_ == "self") { connections.put(this.name, value_); } 
   else{
   connections.put(destination_, value_); }
   
 }
  
}
