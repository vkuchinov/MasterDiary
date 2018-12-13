/*

NEURAL NETWORK DIAGRAM
[or Artificial neural network + biases + backpropagation]

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

RECURRENT NEURAL NETWORKS
A recurrent neural network (RNN) is a class of artificial neural 
network where connections between units form a directed cycle. 
This creates an internal state of the network which allows it to 
exhibit dynamic temporal behavior. Unlike feedforward neural 
networks, RNNs can use their internal memory to process arbitrary 
sequences of inputs. This makes them applicable to tasks such as 
unsegmented connected handwriting recognition or speech recognition.

FEED FORWARD NEURAL NETWORKS
A feedforward neural network is an artificial neural network 
where connections between the units do not form a cycle. 
This is different from recurrent neural networks.

FIRING [FIRING RULE]

The firing rule is an important concept in neural networks and 
accounts for their high flexibility. A firing rule determines 
how one calculates whether a neuron should fire for any input 
pattern. It relates to all the input patterns, not only the ones 
on which the node was trained.

REFERENCE:
Please look at NeuralNetworksBiasAndBackpropagation sketch in 
the same folder

#404040,    #024959,     #037E8C,    #D2EFDC,    #F24C27
background  inactive     idle        neuron      fire

@auhtor  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/


final String JSON_URL = "nn.json";

Neural network;

void setup(){
 
      size(650, 450, "processing.core.PGraphicsRetina2D"); 
     
      network = new Neural(width/2, height/2);
      
      //load JSON
      JSONArray json = loadJSONArray(JSON_URL);
      JSONArray[] connections = new JSONArray[json.size()];
     
      for(int n = 0; n < json.size(); n++){
        
        JSONObject neuron = json.getJSONObject(n);
        int id = neuron.getInt("id");
        float x = neuron.getFloat("x");
        float y = neuron.getFloat("y");
        float bias = neuron.getFloat("bias");
        network.addNeuron(new Neuron(x, y, bias));
        connections[n] = neuron.getJSONArray("connections");
        
      }
      
      println(connections.length);
      for(int c = 0; c < connections.length; c++){
       
         JSONArray tmpConnection = connections[c];
           
              for(int cc = 0; cc < tmpConnection.size(); cc++){
                
                   String ccc = tmpConnection.getJSONArray(cc).toString();
                   ccc = ccc.replace("[", "").replace("]", "").replace("\n", "");
                   //ccc = ccc.replace("]", "");
                   //ccc = ccc.replace("\n", "");
                   String[] cccc = ccc.split(",");
                   network.connect(c, Integer.parseInt(cccc[0].trim()), Float.parseFloat(cccc[1].trim()));
                   
              }
        
      }
      
     
   
}

void draw(){
  
    background(0x404040);
    
    network.update();
    network.draw();
    
    if (frameCount % 30 == 0) {
    network.feedForward(random(0.5));
    }

}
