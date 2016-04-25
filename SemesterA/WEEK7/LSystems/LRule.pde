class LRule{
    
     //char[] variables;       // "A" > 'A' > as case in LDictionary
     //char[] constants;       // "B" > "B"
     String axiom;           //starting rule
     String[] rules;         //[0]: F, [1] = ..., [2]: X, [3]: ...
     
     HashMap<Character, String> variables = new HashMap<Character, String>();

     String expanded = "";
     
     LRule(){
      
           //           axiom = "A";
           //           variables = new char[]{'A', 'B'};
           //           constants = new char[]{'[', ']'};
           //           rules = new String[]{"BB", "B[A]A"};
           
     } 

     LRule(String axiom_, char[] consts_, String[] rules_){
      
           axiom = axiom_;
           setVariables(rules_);        //rules_ array % 2 == 0
           setConstants(consts_);
           
     }
    
    void setVariables(String[] rules_){
      
      for(int v = 0; v < rules_.length; v += 2){
          variables.put(rules_[v].charAt(0), rules_[v + 1]);
      }
    }
    
    void setConstants(char[] consts_){
      
       for(int c = 0; c < consts_.length; c ++){
          variables.put(consts_[c], str(consts_[c]));
      }
      
    }
    
    //initial method
    void construct(int levels_){
     
           String output = "";
           
           for(int c = 0; c < axiom.length(); c++){
                 
               output += variables.get(axiom.charAt(c));
               
           }
         
           this.construct(levels_ - 1, output);

    } 
    
    //recursive part
    void construct(int levels_, String temporary_){
     
           
           if(levels_ > 0){
           String output = "";  
           
           for(int c = 0; c < temporary_.length(); c++){
                 
               output += variables.get(temporary_.charAt(c));
               
           }
     
           this.construct(levels_ - 1, output);
           
           }
           else{

               expanded = temporary_;
             
           }
    } 
    
    String expand(){
     
         return expanded; 
      
    }
  
}
