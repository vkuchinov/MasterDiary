/*

HATCHED ARC SEGMENT

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float r = 150.0;
float theta = 2.70;
float phi = PI / 4.0;

float sigma = 4.53;
float g = 12.0;

void setup(){
  
   size(512, 512);
   translate(width/2, height/2);
   
   noFill();
   stroke(0);
   
   PVector center = new PVector(-30.0, -60.0);
   
   ellipse(center.x, center.y, 2.0 * r, 2.0 * r);
   strokeWeight(2.0);
   
   PVector dl = new PVector(center.x + r * cos(theta - phi / 2.0), center.y + r * sin(theta - phi / 2.0));
   PVector dr = new PVector(center.x + r * cos(theta + phi / 2.0), center.y + r * sin(theta + phi / 2.0));
   
   line(center.x, center.y, dl.x, dl.y);
   line(center.x, center.y, dr.x, dr.y);
   
   arc(center.x, center.y, r * 2.0, r * 2.0, theta - phi / 2.0, theta + phi / 2.0);
   
   stroke(255, 0, 255);
      
   float gamma = -g;

   //line(center.x + r * cos(theta - PI / 2.0), center.y + r * sin(theta - PI / 2.0), center.x - r * cos(theta - PI / 2.0), center.y - r * sin(theta - PI / 2.0));
   //line(center.x - r * cos(sigma), center.y - r * sin(sigma), center.x - r * cos(sigma - PI), center.y - r * sin(sigma - PI));
   //line(center.x + r * cos(0), center.y + r * sin(0), center.x + r * sin(0 - PI), center.y + r * cos(0 - PI));
      
   while(gamma <= r){

      gamma += g;
      float beta1 = sigma + asin(gamma / r);
      float beta2 = sigma - asin(gamma / r) + PI;

      strokeWeight(2.0);
      stroke(0, 255, 255);
      
      line(center.x - r * cos(beta1), center.y - r * sin(beta1), center.x - r * cos(beta2), center.y - r * sin(beta2));
      line(center.x + r * cos(beta1), center.y + r * sin(beta1), center.x + r * cos(beta2), center.y + r * sin(beta2));

      PVector p3 = new PVector(center.x - r * cos(beta1), center.y - r * sin(beta1));
      PVector p4 = new PVector(center.x - r * cos(beta2), center.y - r * sin(beta2));
     
      PVector p5 = new PVector(center.x + r * cos(beta1), center.y + r * sin(beta1));
      PVector p6 = new PVector(center.x + r * cos(beta2), center.y + r * sin(beta2));
      
      strokeWeight(1.0);
      stroke(255, 255, 0);
      
      if(!new Float(p3.x).isNaN() && !new Float(p3.y).isNaN() && !new Float(p4.x).isNaN() && !new Float(p4.y).isNaN()){
        
          PVector d0 = twoLineItersection(center, dl, p3, p4);
          PVector d1 = twoLineItersection(center, dr, p3, p4);

          if(d0 != null ) { point(d0.x, d0.y); }
          if(d1 != null ) { point(d1.x, d1.y); }
          
          if(d0 != null && d1 != null) { line(d0.x, d0.y, d1.x, d1.y); }
          if(d0 == null && d1 != null ) {  line(p3.x, p3.y, d1.x, d1.y); }
          if(d0 != null && d1 == null ) {  line(d0.x, d0.y, p4.x, p4.y); }
          
          PVector d2 = twoLineItersection(center, dl, p5, p6);
          PVector d3 = twoLineItersection(center, dr, p6, p5);

          if(d2 != null ) { point(d2.x, d2.y); }
          if(d3 != null ) { point(d3.x, d3.y); }
          
          if(d2 != null && d3 != null) { line(d2.x, d2.y, d3.x, d3.y); }
          if(d2 != null && d3 == null ) { line(d2.x, d2.y, p6.x, p6.y); }
          if(d2 == null && d3 != null ) { line(p5.x, p5.y, d3.x, d3.y); }
          
          float phi3 = atan2(p3.y - center.y, p3.x - center.x);
          float phi4 = atan2(p4.x - center.x, p4.x - center.x);
          float phi5 = atan2(p5.y - center.y, p5.x - center.x);
          float phi6 = atan2(p6.y - center.y, p6.x - center.x);
                    
          //println(theta - phi / 2.0, theta + phi / 2.0, phi3, phi4);
          
          if(abs(theta - phi3) <= phi / 2.0 && abs(theta - phi4) <= phi / 2.0) { line(p3.x, p3.y, p4.x, p4.y); }
          if(abs(theta - phi5) <= phi / 2.0 && abs(theta - phi6) <= phi / 2.0) { line(p5.x, p5.y, p6.x, p6.y); }
          
      }
      
   }
  
}

PVector twoLineItersection(PVector p1_, PVector p2_, PVector p3_, PVector p4_) {
 
    float bx = p2_.x - p1_.x;
    float by = p2_.y - p1_.y;
    float dx = p4_.x - p3_.x;
    float dy = p4_.y - p3_.y;
   
    float b_dot_d_perp = bx * dy - by * dx;
           
    if(b_dot_d_perp == 0) { println("parallel"); return null; };
   
    float cx = p3_.x - p1_.x;
    float cy = p3_.y - p1_.y;
   
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if(t < 0 || t > 1) { return null; };
   
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if(u < 0 || u > 1) { return null; };
   
    return new PVector(p1_.x + t * bx, p1_.y + t * by);
    
  }
