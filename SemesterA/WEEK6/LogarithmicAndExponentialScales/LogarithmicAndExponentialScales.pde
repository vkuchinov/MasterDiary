
float lim = 9E4;

void setup(){
  
   size(800, 350);
   background(0);
   
   for(float x = 3; x < lim; x++){
     
       strokeWeight(1);
       
       float y = log(x);
       stroke(255, 0, 255);
       point(map(x, 3, lim, 50, 750), map(y, 0, log(lim), 300, 50));
       
       y = log(log(x));
       stroke(0, 255, 255);
       point(map(x, 3, lim, 50, 750), map(y, 0, log(log(lim)), 300, 50));
       
       y = exp(map(x, 3, lim, -1.0, 1.0));
       stroke(255, 255, 0);
       point(map(x, 3, lim, 50, 750), map(y, 0, exp(1.0), 300, 50));

   }

}

