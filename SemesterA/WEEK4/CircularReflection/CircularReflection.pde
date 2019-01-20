/*

CIRCULAR REFLECTION

      Ms, rs - parent circle
      Mc, rc, v - agent
      
      P = (Ms * rs + Mc * rc) / rs + rc
      
      →'  →         →         →             
      v = v - 2(v * Ms * P) * Ms * P
      
      →
      Ms * P should be normalised
      
      REFERENCES:
      https://math.stackexchange.com/questions/81269/angle-of-reflection-off-of-a-circle
      http://jsfiddle.net/klenwell/3ZdXf/

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Particle p;

void setup(){
 
     size(500, 500, "processing.core.PGraphicsRetina2D");
     translate( width / 2, height / 2 );
     
     float ang = random(-PI, PI);
     float r = random (16, 112);
     p = new Particle(r * cos(ang), r * sin(ang));

  
}

void update(){  p.update(); }

void draw(){
  
   
    background(240);
    translate( width / 2, height / 2 );
    
    update();
        
    fill(255);
    ellipseMode(CENTER);
    ellipse(0, 0, 256, 256);
  
    p.draw();
  
}

PVector calculateVelocity(PVector center0_, float radius0_, PVector center1_, float radius1_, PVector velocity1_){
  
      float Px = (center0_.x * radius0_ + center1_.x * radius1_) / (radius0_ + radius1_);
      float Py = (center0_.y * radius0_ + center1_.y * radius1_) / (radius0_ + radius1_);
      
      PVector P = new PVector(Px, Py);
      
      fill(255, 0, 255);
      ellipseMode(CENTER);
      ellipse(P.x, P.y, 64, 64);
  
      return new PVector(velocity1_.x * -1, velocity1_.y * -1);
  
}
