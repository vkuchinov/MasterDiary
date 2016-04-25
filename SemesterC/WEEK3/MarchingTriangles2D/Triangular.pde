class Triangular{
  
     PGraphics visualization;
     Scalar field;
     
     PVector dimensions;
     PVector[] bounds;
     
     int resolution;
     float[] ratios = {0.0, 0.3, 0.4, 0.5, 0.6, 0.7, 1.0};
     boolean contour = true, stroke = true, label = false;
     
     Triangular(int[] width_, int[] height_, int dims_){
       
          dimensions = new PVector(dims_, dims_);
          resolution = dims_;
          
          //[0]: minX, minY, [1]: maxX, maxY
          bounds = new PVector[2];
          bounds[0] = new PVector(width_[0], height_[0]);
          bounds[1] = new PVector(width_[1], height_[1]);
          
          field = new Scalar(resolution);
          
          //visualization = createGraphics((int)abs(bounds[1].x - bounds[0].x), (int)abs(bounds[1].y - bounds[0].y));
        
     }
    
     void update(){
       
         field.update(resolution);
       
     }
     
     void draw(){
       
          visualization = createGraphics((int)abs(bounds[1].x - bounds[0].x), (int)abs(bounds[1].y - bounds[0].y));
           
          visualization.beginDraw();
          
          visualization.beginShape();
          visualization.noStroke();
          visualization.colorMode(HSB);
          visualization.fill(32, 240, 240);
          visualization.vertex(abs(bounds[1].x - bounds[0].x) / 2, 0);
          visualization.vertex(abs(bounds[1].x - bounds[0].x), abs(bounds[1].y - bounds[0].y) * 0.88);
          visualization.vertex(0, abs(bounds[1].y - bounds[0].y) * 0.88);
          visualization.endShape(CLOSE);
         
          visualization.scale(700.0/(resolution - 1), 700.0/(resolution - 1) * 0.88);
          
          for(int y = 0 ; y < resolution - 1; y++){
                for(int x = 0; x < field.values.get(y).length; x++){
          
                float a = 0.0, b = 0.0, c = 0.0;
                
                    if(x % 2 == 0){
                      
                            b = field.values.get(y)[x];
                            if(x > 1 && y < field.values.size() - 2) a = field.values.get(y + 1)[x - 1];
                            if( x < field.values.get(y).length - 2) c = field.values.get(y)[x + 1];
                    
                    }
                    
                    else{
                     
                            b = field.values.get(y)[x];
                            if(y > 1 && x > 1) a = field.values.get(y - 1)[x - 1];
                            if(x < field.values.get(y).length - 2) c = field.values.get(y)[x + 1];
                            
                    }
                 
                for(int r = 0; r < ratios.length; r++){
                  
                    if(a < ratios[r] && b < ratios[r] && c < ratios[r] && contour) continue;
                    
                    float ab = (ratios[r] - a) / (b - a);
                    float ac = (ratios[r] - a) / (c - a);
                    float bc = (ratios[r] - b) / (c - b);
                    
                    visualization.colorMode(HSB);
                    visualization.noStroke();
                    
                    if(stroke){
                           visualization.strokeWeight(0.025);
                           visualization.stroke(map(r, 0, ratios.length, 16, 64), 240, 240); visualization.noFill();
                    }
                    else{
                           visualization.fill(map(r, 0, ratios.length, 16, 64), 240, 240); visualization.noStroke();
                    }
                    
                    if(x % 2 == 0){
                      
                    visualization.beginShape();
                    
                    visualization.vertex((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5*x, y);
                    visualization.vertex((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 - 0.5 + 0.5*x, y + 1);
                    visualization.vertex((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5 + 0.5*x, y + 1);
                    
                    visualization.endShape(CLOSE);
                    
                    //PVector aa = new PVector((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5*x, y);
                    //PVector cc = new PVector((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 - 0.5 + 0.5*x, y + 1);
                    //PVector bb  = new PVector((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5 + 0.5*x, y + 1);

                    //visualization.stroke(200, 240, 240);
                    //visualization.strokeWeight(0.1);
                    //println(ab, bc, ac);
                    
                    //if(a < ratios[r]) visualization.vertex(aa.x, aa.y);
                    //if(a > 0 && a < 1.0 && ab > 0 && ab < 1) { PVector abV = PVector.lerp(aa, bb, ab); visualization.vertex(abV.x, abV.y); }
                    //if(b < ratios[r]) visualization.vertex(bb.x, bb.y);
                    //if(b > 0 && b < 1.0 && bc > 0 && bc < 1) { PVector bcV = PVector.lerp(bb, cc, bc); visualization.vertex(bcV.x, bcV.y); }
                    //if(c < ratios[r]) visualization.vertex(cc.x, cc.y);
                    //if(c > 0 && c < 1.0 && ac > 0 && ac < 1) { PVector acV = PVector.lerp(aa, cc, ac); visualization.vertex(acV.x, acV.y); }

               
                    }
                    
                    else{
                                  
                    visualization.beginShape();
                      
                    visualization.vertex((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 - 0.5 + 0.5*x, y);
                    visualization.vertex((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5 + 0.5*x, y);
                    visualization.vertex((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5*x, y + 1);
                    
                    visualization.endShape(CLOSE);
                    
                    //PVector cc = new PVector((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 - 0.5 + 0.5*x, y);
                    //PVector bb = new PVector((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5 + 0.5*x, y);
                    //PVector aa = new PVector((-(field.values.get(y).length - y)/ (2.0)) + resolution/2 + 0.5*x, y + 1);
 
                    //visualization.stroke(128, 240, 240);
                    //visualization.strokeWeight(0.1);
  
                    //if(a < ratios[r]) visualization.vertex(aa.x, aa.y);
                    //if(a > 0 && a < 1.0 && ab > 0 && ab < 1) { PVector abV = PVector.lerp(aa, bb, ab); visualization.vertex(abV.x, abV.y); }
                    //if(b < ratios[r]) visualization.vertex(bb.x, bb.y);
                    //if(b > 0 && b < 1.0 && bc > 0 && bc < 1) { PVector bcV = PVector.lerp(bb, cc, bc); visualization.vertex(bcV.x, bcV.y); }
                    //if(c < ratios[r]) visualization.vertex(cc.x, cc.y);
                    //if(c > 0 && c < 1.0 && ac > 0 && ac < 1) { PVector acV = PVector.lerp(aa, cc, ac); visualization.vertex(acV.x, acV.y); }
                      
                    }
                    
                    //label
                    if(label){
                      
                        //visualization.pushMatrix();
                        //visualization.translate(x + 0.15, y + 0.55);
                        //visualization.scale(0.45);
                        //visualization.noStroke();
                        //visualization.fill(255);
                        //visualization.textSize(0.5);
                        //visualization.text(nfs(field.values[x][y] * 100, 2, 1), 0, 0);
                        //visualization.popMatrix();
                        
                    }
          
                }
         
            }
         }
         
         visualization.endDraw();
         image(visualization, 50, 50);
        
     }
     
     
    void keyPressed(){
  
    if(key == 'c' || key == 'C') contour ^= true;
    if(key == 'l' || key == 'L') label ^= true;
    if(key == 's' || key == 'S') stroke ^= true;
    if(key == '-') if(resolution > 4) resolution -= 2; field.update(resolution);
    if(key == '=') if(resolution < 64) resolution += 2; field.update(resolution);
  
    }
  
  
}
