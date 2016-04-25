/*

MIRRORING POINT OVER A LINE

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

PVector p = new PVector(260.0, 150.0);
PVector A = new PVector(300.0, 30.0);
PVector B = new PVector(400.0, 300.0);

void setup(){
  
     size(700, 400);
    
    
     stroke(0);
     strokeWeight(5.0);
     point(p.x, p.y);
     
     
     strokeWeight(2.0);
     line(A.x, A.y, B.x, B.y);
  
     stroke(255, 0, 255);
     strokeWeight(5.0);
     PVector mirrored = reflect(p, A, B);
     point(mirrored.x, mirrored.y);
}

PVector reflect(PVector p_, PVector A_, PVector B_){
  
     float dx, dy, a, b, x, y;
     
     dx = B_.x - A_.x;
     dy = B_.y - A_.y;
     a = (dx * dx - dy * dy) / (dx * dx + dy * dy);
       
     b = 2 * dx * dy / (dx * dx + dy * dy);
    
    x = Math.round(a * (p_.x - A_.x) + b * (p.y - A_.y) + A_.x); 
    y = Math.round(b * (p_.x - A_.x) - a * (p.y - A_.y) + A_.y); 
  
     return new PVector(x, y);
  
}
