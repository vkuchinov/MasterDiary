/*

NEURAL NETWORKS
[or Artificial neural network with biases and backpropagation]

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

BIAS

Every neuron has its own bias, they are learnable, determing
if A NEURON IS ACTIVATED OR NOT.

Biases are increasing the flexibility of NNs.

    
      WITHOUT BIAS
    
      3
         -0.34            
         >
                
                
                 >  3 * -0.34 + 2 * 0.20 = -0.42 (while it's a negative
                                                  value, the neuron is not
                                                  firing and value is 0)
         >                                        relu(-0.42) = 0
         0.20
      2
      
      relu() / reLU() - rectifier = max(0, x);
      
      WITH BIAS where actually bias is a threshold
      
      3
         -0.34            
         >
                                            b = 1.0
                
                 >  3 * -0.34 + 2 * 0.20  + b  = 0.58
                                                  
                                                  
         >                                        
         0.20
      2
      
Bias could be also a negative value, for example -5.
   
CROSS-ENTROPY [error]

crossentropy = -(1/n)(sigma{3, i=3}(yi * log(Oouti))+((1 - yi) * log((1 - Oouti))))

I.e. 

error = -1((1 * log(0.22698) + 0 + 0 * log(0.3223) + 1 * log(1 - 0.3223) + 0 * log(0.4078) + 1 * log(1 - 0.4078))
or
error = 0.985

BACKPROPOGATION

Backpropagation is a method used in artificial neural networks to calculate a gradient 
that is needed in the calculation of the weights to be used in the network.

It is commonly used to train deep neural networks, a term referring to neural networks with 
more than one hidden layer.

Backpropagation is a special case of an older and more general technique called automatic 
differentiation. In the context of learning, backpropagation is commonly used by the gradient 
descent optimization algorithm to adjust the weight of neurons by calculating the gradient of 
the loss function. This technique is also sometimes called backward propagation of errors, 
because the error is calculated at the output and distributed back through the network layers.

Backpropagation = error — (Hidden Layer2 — Output Layer) Weights

Backpropagation algorithm (two phases):

Phase A: propagation

  1. Propagation forward through the network to generate the output value(s)
  2. Calculation of the cost (error term)
  3. Propagation of the output activations back through the network using 
     the training pattern target in order to generate the deltas (the difference between 
     the targeted and actual output values) of all output and hidden neurons.
     
Phase B: weight update

  1. The weight's output delta and input activation are multiplied to find 
     the gradient of the weight.
  2. A ratio (percentage) of the weight's gradient is subtracted from the weight.

PSEUDOCODE

initialize network weights (often small random values)
  do
     forEach training example named ex
        prediction = neural-net-output(network, ex)  // forward pass
        actual = teacher-output(ex)
        compute error (prediction - actual) at the output units
        compute delta Δw(h) for all weights from hidden layer to output layer  // backward pass
        compute delta Δw(i) for all weights from input layer to hidden layer   // backward pass continued
        update network weights // input layer not modified by error estimate
  until all examples classified correctly or another stopping criterion satisfied
  return the network

REFERENCE:
http://natureofcode.com/book/chapter-10-neural-networks/

FURTHER READINGS:
http://synaptic.juancazala.com/#/

UPDATED: [2017]
https://medium.com/@14prakash/back-propagation-is-very-simple-who-made-it-complicated-97b794c97e5c
http://galaxy.agh.edu.pl/~vlsi/AI/backp_t_en/backprop.html

@auhtor  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Neural network;

void setup(){
 
      size(620, 620, "processing.core.PGraphicsRetina2D"); 
     
      network = new Neural(width/2, height/2);
      
      Neuron a = new Neuron(-200,0, 0.5);
      Neuron b = new Neuron(0,100, -0.2);
      Neuron c = new Neuron(0,-100, 0.8);
      Neuron d = new Neuron(200,0, 1.2);
      
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
