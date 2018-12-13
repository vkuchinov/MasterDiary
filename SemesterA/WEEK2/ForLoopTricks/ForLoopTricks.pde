/*

FOR LOOP 'TRICK'

for(int i = 0;;i++){
 
   {condition}
   break;
   
}


@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/


void setup(){
  
   skippingCondition(); 
   skippingInitialization();
   skippingFinalExpression();
   skippingEverything();
   
}


int skippingCondition(){
  
    for(int n = 1 ;; n++){
     
     println(n);
     if(n > 3) break;
     
    }
  
    return 0;
    
}

int skippingInitialization(){
  
    int n = 0;
    
    for(; n < 4; n++){
     
     println(n);
     
    }
  
    return 0;
    
}

int skippingFinalExpression(){

    
    for(int n = 0; n < 10;){
     
     println(n);
     break;
     
    }
  
    return 0;
    
}

int skippingEverything(){
  
    int n = 0;
    
    for(;;){
     
     if(n > 4) break;
     println(n);
     n++;
     
    }
  
    return 0;
    
}
