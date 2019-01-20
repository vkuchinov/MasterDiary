/*

PARALLEL CURVES
set n- parallel Bezier curves to given one

REFERENCES:
Parallel Lines by myself

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

PVector p0 = new PVector(100, 100);
PVector p1 = new PVector(300, 200);
PVector p2 = new PVector(400, 400);

void setup(){
  
    size(500, 500);
    
    stroke(255, 0, 255);
    noFill();
    beginShape();
    curveVertex(p0.x, p0.y);
    curveVertex(p0.x, p0.y);
    curveVertex(p1.x, p1.y);
    curveVertex(p2.x, p2.y);
    curveVertex(p2.x, p2.y);
    endShape();
     
    drawLines(12, 10);
    
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
        
        float dx0 = p0.x - p1.x;
        float dy0 = p0.y - p1.y;
        
        float dx1 = p1.x - p2.x;
        float dy1 = p1.y - p2.y;
        
        float dist0 = sqrt(dx0*dx0 + dy0*dy0);
        dx0 /= dist0;
        dy0 /= dist0;
        
        float dist1 = sqrt(dx1*dx1 + dy1*dy1);
        dx1 /= dist1;
        dy1 /= dist1;
        
        float x1 = p0.x + dy0 * n;
        float y1 = p0.y - dx0 * n;
        float x2 = p1.x + dy0 * n;
        float y2 = p1.y - dx0 * n;
        float x3 = p2.x + dy1 * n;
        float y3 = p2.y - dx1 * n;
        
         
        stroke(0);
        beginShape();
        curveVertex(x1, y1);
        curveVertex(x1, y1);
        curveVertex(x2, y2);
        curveVertex(x3, y3);
        curveVertex(x3, y3);
        endShape();
    
    }
  
}
