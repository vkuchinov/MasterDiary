class Set{
  
   int NUM;
   int results[];
   int chances[];
   float limit;

   Set(int num_, int[] results_, float[] chances_){
    
       NUM = num_;
       float check = 0.0;
       for(Float f : chances_) { check += f; }
       if(check != 1.0) { println("Invalid proportions"); }
       
       results = results_; chances = new int[chances_.length];
       
       int remainder = num_;
       for(int i = 0; i < chances_.length - 1; i++) { int n = round(NUM * chances_[i]); chances[i] = n; remainder-= n; }
       chances[chances.length - 1] = remainder;

   } 
   
   Set(float limit_, int[] results_, float[] chances_){
    
       limit = limit_;
       float check = 0.0;
       int t = 0;
       for(int i = 0; i < results_.length; i++) { check += chances_[i]; t += (int)(chances_[i] * 1000) * results_[i]; }
       if(check != 1.0) { println("Invalid proportions"); }
       results = results_; 
       
       int sigma = (int)(limit_ / t * 1000);
       
       reinits(sigma, results_, chances_);

   } 
   
   void reinits(int num_, int[] results_, float[] chances_){
     
       NUM = num_;
       float check = 0.0;
       for(Float f : chances_) { check += f; }
       if(check != 1.0) { println("Invalid proportions"); }
       
       results = results_; chances = new int[chances_.length];
       
       int remainder = num_;
       for(int i = 0; i < chances_.length - 1; i++) { int n = round(NUM * chances_[i]); chances[i] = n; remainder-= n; }
       chances[chances.length - 1] = remainder;
       
       int count = 0;
       for(int i = 0; i < results.length; i++) { count += results[i] * chances[i]; }
       chances[0] += limit - count;
       
   }
   
   ArrayList<Integer> get(){
     
      int t = 0;
      ArrayList<Integer> out = new ArrayList<Integer>();
      
      for(int i = 0; i < results.length; i++) { 
      
          for(int j = 0; j < chances[i]; j++) { out.add(results[i]); t += results[i]; }
        
      }

      Collections.shuffle(out);
      return out;
     
   }
  
}
