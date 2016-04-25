class Neural {
  

  NeuronList neurons = new NeuronList();
  ConnectionList connections = new ConnectionList();
  PVector location;

  Neural(float x_, float y_) { location = new PVector(x_, y_); }

  void addNeuron(Neuron n_) {
    neurons.add(n_);
  }

  void connect(Neuron a_, Neuron b_, float weight_) {
    Connection c = new Connection(a_, b_, weight_);
    a_.addConnection(c);
    connections.add(c);
  } 
  
  void connect(int a_, int b_, float weight_) {
    if(b_ != -1){
    Connection c = new Connection(this.neurons.get(a_), this.neurons.get(b_), weight_);
    this.neurons.get(a_).addConnection(c);
    connections.add(c);
    }
  } 

  void feedForward(float input_) {
    Neuron start = neurons.get(0);
    start.feedForward(input_);
  }

  void update() {
     connections.update();
  }
  

  void draw() {
    
    pushMatrix();
    translate(location.x, location.y);
    
    connections.draw();
    neurons.draw();
    
    popMatrix();
    
  }
  
}

