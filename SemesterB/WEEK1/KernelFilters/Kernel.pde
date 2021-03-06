class Kernel{
 
   int step;
   Matrix m;
   
   Matrix gauss3x3 = new Matrix(new int[]{1, 2, 1, 2, 4, 2, 1, 2, 1}, 1/16f);
   Matrix gauss5x5 = new Matrix(new int[]{1, 4, 6, 4, 1, 4, 16, 24, 16, 4, 6, 24, 36, 24, 6, 4, 16, 24, 16, 4, 1, 4, 6, 4, 1}, 1/256f);

   Kernel(PImage bitmap_){
       
     
       int t0 = millis();
       
       m = new Matrix(17);
       step = m.d;
       float sum = 0.0;
       int offset = floor(m.d / 2.0);

       for(int x = 0; x < bitmap_.width; x++){
         for(int y = 0; y < bitmap_.height; y++){
           
             sum = 0.0;
             
             for( int cx = x - offset; cx < x + offset + 1; cx++){
               for( int cy = y - offset; cy < y + offset + 1; cy++){
                 
                 if(cx > -1 && cx < bitmap_.width) { 
                   if(cy > -1 && cy < bitmap_.height){
                     
                       int dx = cx - x + offset;
                       int dy = cy - y + offset;
                       color c = bitmap_.get(cx, cy);
                       sum += red(c) * m.m[dx][dy];
                                            
                   } 
                 }
 
               }
             }

             color gray = color(int(sum));
             bitmap_.set(x, y, gray);            
             bitmap_.updatePixels();
                 
         }
       } 

     println((millis() - t0) / 1000.0);
   
   } 
  
  
}
