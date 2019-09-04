class SeparableKernel{
 
   int step;
   Matrix1D m = new Matrix1D(25);
   
   //Matrix gauss3x3 = new Matrix(new int[]{1, 2, 1, 2, 4, 2, 1, 2, 1}, 1/16f);
   //Matrix gauss5x5 = new Matrix(new int[]{1, 4, 6, 4, 1, 4, 16, 24, 16, 4, 6, 24, 36, 24, 6, 4, 16, 24, 16, 4, 1, 4, 6, 4, 1}, 1/256f);

   SeparableKernel(PImage bitmap_){

       int t0 = millis();

       step = m.d;
       double sum = 0.0;
       int offset = floor(m.d / 2.0);

       int i = 0;
         for(int y = 0; y < bitmap_.height; y++){
           for(int x = 0; x < bitmap_.width; x++){
           
             sum = 0.0;
             
             for( int cx = x - offset; cx < x + offset + 1; cx++){
                 if(cx > -1 && cx < bitmap_.width) { 
                   
                     int dx = cx - x + offset;
                     color c = bitmap_.get(cx, y);
                     sum += red(c) * m.m[dx];
                     i++;
                   
                 }
             }

             color gray = color((int)(sum));
             bitmap_.set(x, y, gray);            
             bitmap_.updatePixels();
                 
         }
       } 
       
        for(int y = 0; y < bitmap_.height; y++){
           for(int x = 0; x < bitmap_.width; x++){
           
             sum = 0.0;
             
               for( int cy = y - offset; cy < y + offset + 1; cy++){
                   if(cy > -1 && cy < bitmap_.height){
                   
                     int dy = cy - y + offset;
                     color c = bitmap_.get(x, cy);
                     sum += red(c) * m.m[dy];
                     i++;
                   
                 }
             }

             color gray = color((int)(sum));
             bitmap_.set(x, y, gray);            
             bitmap_.updatePixels();
                 
         }
       } 

     println(i, "steps in", (millis() - t0) / 1000.0);
      
     //matrix25: separable:    12.947.456 steps in 0.151
     //matrix25x25: classical 159.870.736 steps in 1.371
   
   } 
  
  
}
