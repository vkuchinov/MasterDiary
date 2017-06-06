class Pair {
  
     int a, b;
     
     Pair(int a_, int b_){
       
       a = a_; //min(a_, b_);
       b = b_; //max(a_, b_);
       
     }
  
     void display(){ println(a + ", " + b); }
}
