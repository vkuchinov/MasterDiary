class Invader{
  
 private boolean[] spine, sides; 
 PVector position;
 
 Invader(PVector p, boolean[] b1, boolean[] b2){
   
 spine = b1;
 sides = b2;
 position = p; //left margin
  
 } 
 
 void draw(){
 
 pushMatrix();
 translate(position.x, position.y);
 ///draw spine
 for(int s = 0; s < spine.length; s++)
   {
   if(spine[s])
   rect(3*20, s*20, 20, 20);
   } 
 
  ///draw sides
 for(int ss = 0; ss < sides.length; ss++)
   {
   if(sides[ss]) { rect(floor(ss/7)*20, ss%7*20, 20, 20); } //left side
   if(sides[ss]) { rect(6*20 - floor(ss/7)*20, ss%7*20, 20, 20); } //right side
   } 
   
 popMatrix();
       
 }
 
}
