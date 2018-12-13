class Neuron {

  PVector location;
  ConnectionList connections = new ConnectionList();
  
  float sum = 0.0;
  float r = 16.0;
  float bias;
  
  Neuron(float x_, float y_, float bias_) {
    
    bias = bias_;
    location = new PVector(x_, y_);

  }


  void addConnection(Connection c) {
    connections.add(c);
  } 
  

  void feedForward(float input) {

    sum += input;

    if (sum > 1) {
      fire();
      sum = 0;  
    } 
  }
  

  void fire() {
    //r = 64.0;
    connections.feedForward(sum);
  }
  

  void draw() {
    
    if(sum == 0.0){
    fill(#404040);
    strokeWeight(1.5);
    stroke(#D2EFDC);
    ellipse(location.x, location.y, r, r);
    }
    else{
    noStroke();
    fill(#404040);
    ellipse(location.x, location.y, r*1.5, r*1.5);
    //stroke(#037E8C);
    //strokeWeight(1.5);
    noStroke();
    fill(#037E8C);
    ellipse(location.x, location.y, r*0.8, r*0.8);
    
    noFill();
    stroke(#037E8C);
    strokeWeight(2);
    float a_ = map(sum, 0.0, 1.0, 0.0, 360.0);
    arc(location.x, location.y, r*1.2, r*1.2, radians(-90), radians(-90 + a_));
    }
 
    
    //r = lerp(r,16,0.1);
  }
}

class NeuronList extends ArrayList<Neuron>{
  
      void draw(){
      
        for(Neuron n : this) {  n.draw(); } 
        
      }
  
}

