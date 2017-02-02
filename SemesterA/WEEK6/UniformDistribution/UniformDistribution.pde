/*

ANOTHER TYPE OF UNIFORM DISTRIBUTION

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

void setup(){
 
   size(500, 500);
   translate(width/2, height/2);
  
   strokeWeight(2);
  
   for(int i = 0; i < 5000; i++){
   float n = 1E4;
   float rho = sqrt(random(n));
   float theta = random(0, TWO_PI);
   float x = rho * cos(theta);
   float y = rho * sin(theta);
   
   point(x, y);
   
   }
   
  
}
