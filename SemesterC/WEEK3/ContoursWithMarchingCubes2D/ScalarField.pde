class Scalar{
   
     float[][] values;
     
     Scalar(int dims_){
      
           values = new float[dims_][dims_];
           
           for(int y = 0; y < dims_ ; y++){
               for(int x = 0 ; x < dims_ ; x++){
                 
                    values[x][y] = noise((float)x / dims_ * 2,(float)y / dims_ * 2, frameCount / 99.0);

               }
          
           }        
           
     } 
     
     void update(int dims_){
       
           values = new float[dims_][dims_];
       
           for(int y = 0; y < dims_ ; y++){
               for(int x = 0 ; x < dims_ ; x++){
                 
                    values[x][y] = noise((float)x / dims_ * 2,(float)y / dims_ * 2, frameCount / 99.0);

               }
          
           }   
       
     }
  
}
