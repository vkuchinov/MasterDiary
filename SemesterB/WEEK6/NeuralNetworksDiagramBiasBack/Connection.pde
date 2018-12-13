class Connection {

  Neuron a;
  Neuron b;

  float weight;
  boolean sending = false;
  PVector sender;
  float output = 0;

  Connection(Neuron a_, Neuron b_, float weight_) {
    
    a = a_; b = b_; weight = weight_;
    
  }
  
  void feedForward(float value_) {
    
    output = value_*weight;        
    sender = a.location.get();  
    sending = true;            
    
  }
  

  void update() {
    
    if (sending) {
      
      
      sender.x = lerp(sender.x, b.location.x, 0.1);
      sender.y = lerp(sender.y, b.location.y, 0.1);
      float d = PVector.dist(sender, b.location);

      if (d < 1) {
       
        b.feedForward(output);
        sending = false;
        
      }
    }
  }

  void draw() {
    
    stroke(#D2EFDC);
    strokeWeight(1.5);
    line(a.location.x, a.location.y, b.location.x, b.location.y);

        if (sending) {
          strokeWeight(1.5);
          stroke(#F24C27);
          line(a.location.x, a.location.y, sender.x, sender.y);
          
          fill(#F24C27);
          noStroke();
          ellipse(sender.x, sender.y, 8.0, 8.0);

        }
  }
  
}

class ConnectionList extends ArrayList<Connection>{
  
      void draw(){ for(Connection c : this){ c.draw(); } }
      void update(){ for(Connection c : this){ c.update(); } }
      void feedForward(float sum_){ for(Connection c : this) { c.feedForward(sum_); } }
}

