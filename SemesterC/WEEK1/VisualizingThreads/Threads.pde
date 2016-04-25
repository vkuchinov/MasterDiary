class runnable implements Runnable{
  
    int index;
    int[] data;
    PVector last;
    
    runnable(int index_){
      
      index = index_;
      data = new int[99];
      
      for(int d = 0; d < 99; d++){
        
           data[d] = d;
           
      }
      
      //shuffle data
      shuffle(data);
   
    }
    
    public void run(){
      
       try {
         
        String name = Thread.currentThread().getName();
        TimeUnit.SECONDS.sleep(1);
        int l = Integer.parseInt(name.replaceAll("Thread-", ""));
        float x = cos(radians(l*4.0)) * 256;
        float z = sin(radians(l*4.0)) * 256;
        float inc = millis() % 3000;
        lines.add(new Line(new PVector(x, -128 + inc, z), new PVector(x, 0 + inc, z), new PVector(x, -128 + inc + map(data[index], 0, 99, 0, 128), z)));

        }
        catch (InterruptedException e) {
          
            e.printStackTrace();
            
        }
    
    }    
   
    void shuffle(int[] a) 
    { 
      
        int temp; 
        int pick; 
        
         for(int i = 0; i < a.length; i++){ 
           
             temp = a[i]; 
             pick  = (int)random(5); 
             a[i] = a[pick]; 
             a[pick]= temp; 
         
         } 
    } 
    
};
