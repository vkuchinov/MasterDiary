class Neural{
  
      PVector center;
      NeuronList neurons = new NeuronList();
      
      Neural(float x_, float y_){
        
            center = new PVector(x_, y_);
        
      }
      
      void addNeuron(Neuron n_){
       
            neurons.add( n_ ); 
        
      }
      
      void connect(Neuron a_, Neuron b_){
        
           Connection c = new Connection(a_, b_, random(1.0));
           a_.addConnection(c);
        
      }
    
      void draw(){
       
            pushMatrix();
            translate(center.x, center.y);
            neurons.draw();
            popMatrix();
            
      }
}
