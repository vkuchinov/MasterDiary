/*

NEURAL NETWORKS
[or Artificial neural network]

In machine learning and cognitive science, artificial neural 
networks (ANNs) are a family of models inspired by biological 
neural networks (the central nervous systems of animals, 
in particular the brain) and are used to estimate or approximate 
functions that can depend on a large number of inputs and 
are generally unknown. Artificial neural networks are generally 
presented as systems of interconnected "neurons" which exchange 
messages between each other. The connections have numeric weights 
that can be tuned based on experience, making neural nets adaptive 
to inputs and capable of learning.

REFERENCE:
http://natureofcode.com/book/chapter-10-neural-networks/

FURTHER READINGS:
http://synaptic.juancazala.com/#/

@auhtor  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Neural network;

void setup(){
 
      size(620, 620, "processing.core.PGraphicsRetina2D"); 
     
      network = new Neural(width/2, height/2);
      
      Neuron a = new Neuron(-200,0);
      Neuron b = new Neuron(0,100);
      Neuron c = new Neuron(0,-100);
      Neuron d = new Neuron(200,0);
      
      network.addNeuron(a);
      network.addNeuron(b);
      network.addNeuron(c);
      network.addNeuron(d);
      
      network.connect(a,b);
      network.connect(a,c);
      network.connect(b,d);
      network.connect(c,d);
      
      network.draw();
  
}
