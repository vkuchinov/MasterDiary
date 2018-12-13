class Neural{
  
  Neural(){
    
  }
  
  void addLayer(){
    
  
  }
  
  void feedForward(){
    
  }
  
  void backPropagation(){
    
  }
  
  float reLU(float x_){ return max(0.0, x_); }
  float sigmoid(float x_){ return 1.0 / (1.0 + exp(-x_)); }
  float tanh(float x_){ return 2.0 / (1.0 + exp(-2.0 * x_)) - 1; }
  float softmax(float x_){ return 0; }
  
}
