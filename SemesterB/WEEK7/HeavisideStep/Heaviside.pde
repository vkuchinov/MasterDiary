class Heaviside{
 
    int value;
    
    Heaviside(int value_){ value = value_; } 
    
    int get(){ return int(value >= 0); }
  
}
