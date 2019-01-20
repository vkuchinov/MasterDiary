class Particle{
  
     PVector position;
     PVector velocity;
     float d = 16;
 
     Particle(float x_, float y_){
       
         position = new PVector(x_, y_);
         velocity = new PVector(random(-4, 4), random(-4, 4));
      
     } 
     
     void update(){
       
       position.add(velocity);
       
       if(position.dist(new PVector(0, 0)) > 128 - d / 2) {
     
           velocity = calculateVelocity(new PVector(0, 0), 512, position, d / 2, velocity);

       }
       
     }
     
     void draw(){
       
       fill(128);
       ellipse(position.x, position.y, d, d);
       
     }

  
}
