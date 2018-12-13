/*

TANGENTS FROM POINT

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

class Circle extends PVector{
  
   float radius;
   
   Circle(float x_, float y_, float radius_){
     
       x = x_; y = y_;
       radius = radius_;
    
   } 
  
}

Circle c = new Circle(0.0, 0.0, 128.0);

void setup(){
  
    size(600, 600);

}

void draw(){
  
   background(220); 
   translate(width/2, height/2);
   
   strokeWeight(1);
   stroke(0);
   ellipse(c.x, c.y, c.radius * 2, c.radius * 2);
   
   strokeWeight(8);
   stroke(255, 0, 255);
   
   PVector m = new PVector(-width/2 + mouseX, -height/2 + mouseY);
   point(m.x, m.y);
   
   strokeWeight(1);
   stroke(0);
   line(c.x, c.y, m.x, m.y);
   
   stroke(0, 255, 255);
   PVector[] tans = getTangents(c, m);
   line(c.x, c.y, tans[0].x, tans[0].y);
   line(c.x, c.y, tans[1].x, tans[1].y);
   
   stroke(0);
   line(m.x, m.y, tans[0].x, tans[0].y);
   line(m.x, m.y, tans[1].x, tans[1].y);
  
}

PVector[] getTangents(Circle c_, PVector p_){
 
   PVector[] out = new PVector[]{new PVector(0, 0), new PVector(0, 0)};
 
   PVector median = PVector.lerp(new PVector(c_.x, c_.y), p_, 0.5);
   float dist = median.dist(p_);

        float dx = p_.x - median.x;
        float dy = p_.y - median.y;

        float d = sqrt((dy*dy) + (dx*dx));

        if (d > (c_.radius + dist)) { return null; }
        if (d < abs(c_.radius - dist)) { return null;}

        float a = (pow(c_.radius, 2) - pow(dist, 2) + pow(d, 2)) / (2.0 * d) ;

        float x2 = c_.x + (dx * a/d);
        float y2 = c_.y + (dy * a/d);

        float h = sqrt(pow(c_.radius, 2) - pow(a, 2));

        float rx = -dy * (h/d);
        float ry = dx * (h/d);

        out[0] = new PVector(x2 + rx, y2 + ry);
        out[1] = new PVector(x2 - rx, y2 - ry);

   return out;
   
} 
