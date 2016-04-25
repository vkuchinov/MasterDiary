class Triangle{
  
      final int NUM_DOTS = 33000;
      
      PVector[] points = new PVector[3];
      color[] cc = new color[3];
      
      Triangle(){
       
            points[0] = new PVector(280.0, 80.0);
            points[1] = new PVector(80.0, 370.0);
            points[2] = new PVector(400.0, 425.0);
           
            cc[0] = color(190, 235, 159);
            cc[1] = color(255, 255, 157);
            cc[2] = color(121, 189, 143);
            
      } 
      
      void draw(int side_){
        
        int[][] order = {{0, 1, 2}, {1, 2, 0}, {2, 0, 1}};
        
        strokeWeight(1.0);
        stroke(#79BD8F, 200);
        
        for(PVector v : points) point(v.x, v.y);
          
          
        for(int dot = 0; dot < NUM_DOTS; dot++){ 

        float r1 = monteCarlo(1.0); //random(1.0);
        float r2 = monteCarlo(1.0); //random(1.0);
        
        PVector l1 = PVector.lerp(points[order[side_][0]], points[order[side_][1]], r1);  
        PVector l2 = PVector.lerp(points[order[side_][0]], points[order[side_][2]], r2); 
    
        color c1 = lerpColor(cc[order[side_][0]], cc[order[side_][1]], r1);
        color c2 = lerpColor(cc[order[side_][0]], cc[order[side_][2]], r1);
        
        float r3 = random(1.0);
        PVector pos = PVector.lerp(l1, l2, r3);
        
        color c3 = lerpColor(c1, c2, r3);
        stroke(c3, 200);
        point(pos.x, pos.y);
                
            
        }

      }
  
      float monteCarlo(float value_){
  
        while (true) {
        float r1 = random(1.0);
        float probability = r1;
        float r2 = random(1.0);
        if (r2 < probability) {
            return r1 * value_;
        }
    } 
}
 
}
