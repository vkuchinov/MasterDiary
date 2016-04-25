class Neuron{
  
      PVector location;
      ConnectionList connections = new ConnectionList();
      
      Neuron(float x_, float y_){
        
             location = new PVector(x_, y_);
       
      } 
      
      void addConnection(Connection c_){
        
            if(c_.a == this){
            connections.add(c_); }
            else{
            println("Invalid connection");
            }
      }
      
      void draw(){
       
           connections.draw();
           
           fill(255);
           ellipseMode(CENTER);
           ellipse(location.x, location.y, 8.0, 8.0); 
           
      }
  
}

class NeuronList extends ArrayList<Neuron>{
  
      void draw(){
      
        for(Neuron n : this) {  n.draw(); } 
        
      }
  
}
