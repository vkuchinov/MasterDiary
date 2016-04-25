class Scalar{
   
     ArrayList<Float[]> values = new ArrayList<Float[]>();
     
     Scalar(int dims_){
      
    
           for(int y = 0; y < dims_ ; y++){
             
               Float[] valuesByX = new Float[1 + y * 2];
               
               for(int x = 0 ; x < 1 + y * 2 ; x++){
                 
                    valuesByX[x] = noise((float)x / dims_ * 2,(float)y / dims_ * 2, frameCount / 99.0);

               }
               
               values.add(valuesByX);
          
           }        
           
     } 
     
     void update(int dims_){
       
           values.clear();
       
           for(int y = 0; y < dims_ ; y++){
             
               Float[] valuesByX = new Float[1 + y * 2];
               
               for(int x = 0 ; x < 1 + y * 2 ; x++){
                 
                    valuesByX[x] = noise((float)x / dims_ * 2,(float)y / dims_ * 2, frameCount / 99.0);

               }
               
               values.add(valuesByX);
          
           }     
       
     }
  
}
