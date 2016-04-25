/*

CIRCLE COLLISION ALGORITHM

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk
*/

Circle c1, c2;
void setup(){
  
      size(600, 600, "processing.core.PGraphicsRetina2D");
  
      c1 = new Circle(width/2, height/2, 128);
      c2 = new Circle(width/2, height/2, 92);
      
}


void draw(){
  
    background(240);
    c1.draw(0);
    c2.update(mouseX, mouseY);
    if(circleIntersection(c2, c1)[0] && circleIntersection(c2, c1)[1]) c2.draw(color(255, 0, 255)); else if(circleIntersection(c2, c1)[0]) c2.draw(color(0, 255, 255)); else c2.draw(0);
  
}

class Circle{
  
      float x, y, radius;
      
      Circle(float x_, float y_, float radius_){
        
            x = x_; y = y_;
            radius = radius_;
            
      }
      
      void update(float newX_, float newY_){
       
            x = newX_; y = newY_; 
        
      }
      
      void draw(color c_){
        
            noFill();
            stroke(c_);
            strokeWeight(1.5);
            ellipseMode(CENTER);
            ellipse(x, y, radius*2, radius*2);
            stroke(255, 0, 0);
            strokeWeight(8);
            point(x, y);
        
      }
      
}

boolean[] circleIntersection(Circle c1_, Circle c2_){
 
     double dist = Math.sqrt(Math.pow((c2_.x - c1_.x), 2) + Math.pow((c2_.y - c1_.y), 2));
     double rads = c1_.radius + c2_.radius;
     if(dist - rads < Math.ulp(1.0)) if(dist > Math.abs(c1.radius - c2.radius)) {return new boolean[]{true, false}; } else { return new boolean[]{true, true}; }
     return new boolean[]{false, false};
}
