/*

PARALLEL LINES
set n- parallel lines to given one

REFERENCES:
none

 [{x: v0_.x + offset_ * (v1_.y - v0_.y) / L, y: v0_.y + offset_ * (v0_.x - v1_.y) / L}, {x: v1_.x + offset_ * (v1_.y - v0_.y) / L, y:v1_.y + offset_ * (v0_.x - v1_.x) / L }]
@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

PVector p0 = new PVector(100, 100);
PVector p1 = new PVector(400, 400);

void setup(){
  
    size(500, 500);
    
    stroke(255, 0, 255);
    line(p0.x, p0.y, p1.x, p1.y);
     
    drawLines(9, 10);
    
}

void drawLines(int n_, float offset_){
  
    float thikness = offset_ * (n_ - 1);
    float offsets[] = new float[n_];
    
    for(int j = 0; j < n_; j++){
      
      offsets[j] = -thikness / 2 + thikness / n_ * j;
      offsets[j] += thikness / n_ / 2; 
        
    }
    
    for(int i = 0; i < n_; i++){
      
        float n = offsets[i];
        float dx = p0.x - p1.x;
        float dy = p0.y - p1.y;
        
        float dist = sqrt(dx*dx + dy*dy);
        dx /= dist;
        dy /= dist;
        
        float x1 = p0.x + dy * n;
        float y1 = p0.y - dx * n;
        float x2 = p1.x + dy * n;
        float y2 = p1.y - dx * n;
         
        stroke(0);
        line(x1, y1, x2, y2);
    
    }
  
}
