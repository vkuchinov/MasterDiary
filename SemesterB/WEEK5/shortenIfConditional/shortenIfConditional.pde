/*

HOW TO SHORTEN IF CONDITION

  if(a > b) { return true; }
  else { return false; }
   
  if a = 1, 2 or 3
  
  return a == 1; 
  return a == 2; //doesn't works, while first line returns true
  return a == 3; //or false
  
  return a == 1 || a == 2 || a == 3 //valid
  
  @author Vladimir V KUCHINOV
  @email  helloworld@vkuchinov.co.uk

*/

void setup(){
  
  println(ifNumberMoreThan(53, 40));
  println(ifNumberIsBetween(30, 20, 25));
  println(ifNumberEqualsTo(4, 6, 5));
  
}

boolean ifNumberMoreThan(float n_, float l_){
  
  return n_ > l_;
  
}

boolean ifNumberIsBetween(float n_, float min_, float max_){
  
  return n_ >= min_ && n_ <= max_;
  
}

boolean ifNumberEqualsTo(float n_, float a_, float b_){
  
  return n_ == a_ || n_ == b_;
  
}

