
    PVector[] shiftArray(PVector[] nodes_){
      
      if(nodes_.length != 0){
        
          PVector[] shiftedArray = new PVector[nodes_.length];
          
          //first is last
          for(int n = 0; n < nodes_.length - 1; n++){
             shiftedArray[n + 1] = nodes_[n];
          }
          shiftedArray[0] = nodes_[nodes_.length - 1];
        
          return shiftedArray;
       }
       else{
             println("array is empty"); 
             return null;
       }
    }  

