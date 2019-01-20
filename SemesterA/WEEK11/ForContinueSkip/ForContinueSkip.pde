/*

TO BE 'CONTINUE'

When run inside of a for or while, it skips the remainder of the block and starts 
the next iteration.

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

for(int i = 0; i < 9; i++){
  
    if (i == 7) continue;  //skips '7'  
    
    println(i);        
  
}


for(int i = 0; i < 9; i++){
  
    if (i > 5) continue;  //skips i > 5  
    
    println(i);        
  
}


for(int i = 0; i < 9; i++){
  
    if (i > 2 && i < 7) continue;  //skips 2 < i > 7 
    println(i);        
  
}

for(int j = 0; j < 9; j++){
  
 if(j == 4) break; //wouldn't print 4-9, useful if something found
 println(j);
 
}


