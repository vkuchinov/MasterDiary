class Connection{
  
      Neuron a, b;
      float weight;
      
      Connection(Neuron a_, Neuron b_, float weight_){
        
              a = a_; b = b_; weight = weight_;
              
      } 
     
      void draw(){
           
              stroke(0);
              strokeWeight(weight * 2.0);
              line(a.location.x, a.location.y, b.location.x, b.location.y);
        
      } 
  
}

class ConnectionList extends ArrayList<Connection>{
  
      void draw(){
       
              for(Connection c : this){ c.draw(); } 
        
      }
  
  
}
