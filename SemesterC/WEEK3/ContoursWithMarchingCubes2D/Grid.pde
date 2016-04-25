class Grid{
  
     PGraphics visualization;
     Scalar field;
     
     PVector dimensions;
     PVector[] bounds;
     
     int resolution;
     float[] ratios = {1.2, 1.0, 0.6, 0.55, 0.5, 0.45, 0.4, 0.0, -0.2};
     boolean contour = true, stroke = false, label = true;
     
     Grid(int[] width_, int[] height_, int dims_){
       
          dimensions = new PVector(dims_, dims_);
          resolution = dims_;
          
          //[0]: minX, minY, [1]: maxX, maxY
          bounds = new PVector[2];
          bounds[0] = new PVector(width_[0], height_[0]);
          bounds[1] = new PVector(width_[1], height_[1]);
          
          field = new Scalar(resolution);
          
          visualization = createGraphics((int)abs(bounds[1].x - bounds[0].x), (int)abs(bounds[1].y - bounds[0].y));
        
     }
    
     void update(){
       
         field.update(resolution);
       
     }
     
     void draw(){
       
          visualization.beginDraw();
          visualization.background(64);
          visualization.scale(700.0/(resolution - 1));
          
          for(int y = 0 ; y < resolution - 1; y++){
                for(int x = 0; x < resolution - 1; x++){
          
                float a = field.values[x][y];
                float b = field.values[x + 1][y];
                float c = field.values[x][y + 1];
                float d = field.values[x + 1][y + 1];
                 
                for(int r = 0; r < ratios.length; r++){
                  
                    if(a < ratios[r] && b < ratios[r] && c < ratios[r] && d < ratios[r] && contour) continue;
                    
                    float ab = (ratios[r] - a) / (b - a);
                    float cd = (ratios[r] - c) / (d - c);
                    float ac = (ratios[r] - a) / (c - a);
                    float bd = (ratios[r] - b) / (d - b);
                    
                    visualization.colorMode(HSB);
                    visualization.noStroke();
                    if(stroke){
                           visualization.strokeWeight(0.02);
                           visualization.stroke(map(r, 0, ratios.length, 0, 64), 240, 240); visualization.noFill();
                    }
                    else{
                           visualization.fill(map(r, 0, ratios.length, 0, 64), 240, 240); visualization.noStroke();
                    }
                    
                    visualization.beginShape();
                    if(a < ratios[r]) visualization.vertex(x, y);
                    if(ab > 0 && ab < 1.0) visualization.vertex(x + ab, y);
                    if(b < ratios[r]) visualization.vertex(x + 1, y);
                    if(bd > 0 && bd < 1.0) visualization.vertex(x + 1,y + bd);
                    if(d < ratios[r]) visualization.vertex(x + 1,y + 1);
                    if(cd > 0 && cd < 1.0) visualization.vertex(x + cd, y + 1);
                    if(c < ratios[r]) visualization.vertex(x, y + 1);
                    if(ac > 0 && ac < 1.0) visualization.vertex(x, y + ac);
                    visualization.endShape(CLOSE);
                    
                    //label
                    if(label){
                      
                        visualization.pushMatrix();
                        visualization.translate(x + 0.15, y + 0.55);
                        visualization.scale(0.45);
                        visualization.noStroke();
                        visualization.fill(255);
                        visualization.textSize(0.5);
                        visualization.text(nfs(field.values[x][y] * 100, 2, 1), 0, 0);
                        visualization.popMatrix();
                        
                    }
          
                }
         
            }
         }
         
         visualization.endDraw();
         image(visualization, 50, 50);
        
     }
     
     
    void keyPressed(){
  
    if(key == 'C' || key == 'c') contour ^= true;
    if(key == 'l' || key == 'L') label ^= true;
    if(key == 's' || key == 'S') stroke ^= true;
    if(key == '-') if(resolution > 2) resolution--; field.update(resolution);
    if(key == '=') if(resolution < 99) resolution++; field.update(resolution);
  
    }
  
  
}
