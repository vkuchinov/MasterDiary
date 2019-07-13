class Quadratic{
  
      PVector parent;
      
      float a, b, c;
      PVector[] points = new PVector[3];
      ArrayList<PVector> outers = new ArrayList<PVector>();
      ArrayList<PVector> inners = new ArrayList<PVector>();
      
      //setting limits along x asix, x: start, y: end
      ArrayList<PVector> limits = new ArrayList<PVector>();
      
      Quadratic(PVector parent_, PVector p0_, PVector p1_, PVector p2_){
       
          parent = parent_;
          
          points[0] = p0_; points[1] = p1_; points[2] = p2_;
          
          for(float s = 0; s < 1.0; s += 0.025){
            
              PVector l1 = PVector.lerp(points[0], points[1], s);
              PVector l2 = PVector.lerp(points[1], points[2], s);
              
              PVector l3 = PVector.lerp(l1, l2, s);
    
              //point(l3.x, l3.y);
              
              PVector ll1 = PVector.lerp(points[0], points[1], 0.5);
              PVector ll2 = PVector.lerp(points[1], points[2], 0.5);
 
              PVector ll3 = PVector.lerp(ll1, ll2, 0.5);
    
              getQuadraticParameters(points[0], points[2], ll3);

          }
          
        
      } 
      
      void getIntersections(Quadratic other_){
       
            float a = this.a; float b = this.b; float c = this.c;
            float d = other_.a; float e = other_.b; float f = other_.c;
            
            //calculating x
            //a1 * x2 + b1 * x + c1 = a2 * x2 + b2 * x + c2
            //b1 * x  + c1 = (a2 * x2 - a1 * x2) + b2 * x + c2 //substracting a1 * x2 from both sides
            //c1 = (a2 * x2 - a1 * x2) + (b2 * x - b1 * x) + c2 //substracting b1 * x from both sides
            //0 = (a2 - a1) * x2 + (b2 - b1) * x + (c2 - c1)
            
            float x1 = (-(b-e) + sqrt(pow((b-e), 2) - 4.0*((a - d) * (c -f))))/(2.0*(a - d));
            float x2 = (-(b-e) - sqrt(pow((b-e), 2) - 4.0*((a - d) * (c -f))))/(2.0*(a - d));

            float y1 = a * x1*x1 + b * x1 + c;
            float y2 = a * x2*x2 + b * x2 + c;
            
            stroke(255, 0, 0);
            strokeWeight(4);
            
            point(x1, y1);
            
            stroke(0, 0, 255);
            point(x2, y2);
            
            if(other_.parent.y > parent.y){
              
            outers.add(new PVector(x1, x2)); } else { inners.add(new PVector(0, x1)); inners.add(new PVector(x2, width)); }
           
            
      }
      
      void draw(){
        
          for(int x = 0; x < width; x++){
 
                boolean skip = false;
                
                for(PVector limit: outers){
                if(x < limit.x && x > limit.y) skip = true;
                }
                
                for(PVector limit: inners){
                if(x > limit.x && x < limit.y) skip = true;
                }
                
                if(skip) continue;
                
                float x_1, y_1, x_2, y_2, x_3, y_3;
           
                x_1 = points[0].x; y_1 = points[0].y;
                x_2 = points[1].x; y_2 = points[1].y;
  
                PVector l1 = PVector.lerp(points[0], points[1], 0.5);
                PVector l2 = PVector.lerp(points[1], points[2], 0.5);
 
                PVector l3 = PVector.lerp(l1, l2, 0.5);
          
                x_1 = points[0].x; y_1 = points[0].y;
                x_2 =  points[2].x; y_2 =  points[2].y;
                x_3 = l3.x; y_3 = l3.y;
                
                float yy1 = y_1 * (x-x_2)*(x-x_3)/((x_1-x_2)*(x_1-x_3));
                yy1 +=  + y_2 * (x-x_1)*(x-x_3)/((x_2-x_1)*(x_2-x_3));
                yy1 += y_3 * (x-x_1)*(x-x_2)/((x_3-x_1)*(x_3-x_2));
              
              
                getQuadraticParameters(points[0], points[2], l3);
              
                stroke(0);
                strokeWeight(1.0);
          
                point(x , a * x*x + b * x + c);
          
              }
        
        
        
      }
      

      void getQuadraticParameters(PVector p0_, PVector p2_, PVector p1_){
        
           float x_1, y_1, x_2, y_2, x_3, y_3;
           
           x_1 = p0_.x; y_1 = p0_.y;
           x_2 = p1_.x; y_2 = p1_.y;
           x_3 = p2_.x; y_3 = p2_.y;

           a = y_1/((x_1-x_2)*(x_1-x_3)) + y_2/((x_2-x_1)*(x_2-x_3)) + y_3/((x_3-x_1)*(x_3-x_2));
           
           b = -y_1*(x_2+x_3)/((x_1-x_2)*(x_1-x_3));
           b += -y_2*(x_1+x_3)/((x_2-x_1)*(x_2-x_3));
           b += -y_3*(x_1+x_2)/((x_3-x_1)*(x_3-x_2));
           
           c = y_1*x_2*x_3/((x_1-x_2)*(x_1-x_3));
           c += y_2*x_1*x_3/((x_2-x_1)*(x_2-x_3));
           c += y_3*x_1*x_2/((x_3-x_1)*(x_3-x_2));
           
      }
  
}    

