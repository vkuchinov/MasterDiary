/*

Markov Chain or DTMC [discrete-time Markov chain]

A Markov chain is named after Andrey Markov, is a random process that 
undergoes transitions from one state to another on a state space. 
It must possess a property that is usually characterized as "memorylessness": 
the probability distribution of the next state depends only on the current state 
and not on the sequence of events that preceded it. This specific kind of 
"memorylessness" is called the Markov property. Markov chains have many 
applications as statistical models of real-world processes.

DTMC is something in the middle between graphs (theory of graphs) and neural networks,
as long as it has weighed decision-making model.

In my example, I would have chain as an extended ArrayList() with some methods and
MarkivNode class as children (elements). Could be an elegant solution for futher 
experiments.

Example
Node A: 0.2 (20%) to itself, 0.8 (80%) to Node B
Node B: 0.5 (50%) to itself, 0.5 (50%) to Node A


An ideal structure for passing weighted connection parameters
could be something {self: 0.2, B: 0.8} like in JavaScript...

  self: 0.2   <String, Float>
  
HashMap is a sub class of AbstractMap, there is also a InterfaceMap in JAVA
references. Interesting... Besides, JAVA has also a TreeMap class (implementing
NavigableMap). All of those have <K, V> structure with lots of contrasts in methods
and parameters.


REFERENCES:
https://en.wikipedia.org/wiki/Markov_chain

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/
import java.util.TreeMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Iterator;
import java.util.Collection;
import java.util.Collections;
import java.util.Arrays;
import java.util.Random;


//extended ArrayList();
Markov chain = new Markov();

PVector point;

void setup(){
  
  size(800, 800);
  
  point = new PVector(width/2, height/2);
  
  //an ideal structure for passing weighted connection parameters
  //could be something {self: 0.2, B: 0.8} like in JavaScript
  //maybe a List, HashMap or something similar with undefined length
  
  chain.put("A", new MarkovNode(0, "A"));
  chain.setConnection("A", "A", 0.2);
  chain.setConnection("A", "B", 0.5);
  chain.setConnection("A", "C", 0.3);

  chain.put("B", new MarkovNode(0, "B"));
  chain.setConnection("B", "B", 0.1);
  chain.setConnection("B", "A", 0.5);
  chain.setConnection("B", "C", 0.4);
  
  chain.put("C", new MarkovNode(0, "C"));
  chain.setConnection("C", "C", 0.4);
  chain.setConnection("C", "B", 0.4);
  chain.setConnection("C", "D", 0.2);
  
  chain.put("D", new MarkovNode(0, "D"));
  chain.setConnection("D", "A", 0.4);
  chain.setConnection("D", "B", 0.6);

  //still looks clumsy
    
}

void draw(){

  chain.nextStep();
  chain.printCurrentNode();

  if(chain.getCurrentName() == "A") { point.x += 2; }
  if(chain.getCurrentName() == "B") { point.y -= 2; }
  if(chain.getCurrentName() == "C") { point.x -= 2; }
  if(chain.getCurrentName() == "D") { point.y += 2; }
  
  stroke(0);
  strokeWeight(4);
  point(point.x, point.y);
  
}
