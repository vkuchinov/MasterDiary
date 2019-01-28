class Line{
  
      PVector position;
      float theta = 0.0; float thetaInc;
      float step;
      int currentStep = 0;
      int maxSteps;

      int type = 0; //0: linear, 1: radial
      
      Line(float x_, float y_, float radius_, float step_, int max_){
       
           position = new PVector(x_, y_);
           thetaInc = 1.0 / ((2.0 * PI * radius_ / (2.0 * PI)) / step_);
           println(thetaInc);
           step = step_;
           
           maxSteps = max_;
           
           
      }
      
      Line(float x_, float y_, float thetaInc_, float step_, int max_, int type_){
       
           position = new PVector(x_, y_);
           thetaInc = thetaInc_;
           step = step_;
           
           maxSteps = max_;
           
           
      } 
      
      Line(float x_, float y_, float theta_, float thetaInc_, float step_, int max_, int type_){
       
           position = new PVector(x_, y_);
           thetaInc = thetaInc_;
           step = step_;
           
           maxSteps = max_;
           
           
      } 
      
      void draw(){
        
          if(currentStep < maxSteps){
            
              stroke(0);
              strokeWeight(1.5);
              
              PVector next = new PVector( cos(theta) * step, sin(theta) * step);
              line(position.x, position.y, position.x + next.x, position.y + next.y);
              
              position.add(next);
              currentStep++;
              theta += thetaInc;
            
          }
          else{
           
             strokeWeight(8.0);
             point(position.x, position.y); 
            
          }
            
        
      }
  
}

class LineList extends ArrayList<Line>{
  
       PVector origin;
       int segments;
       float gap;
      
       LineList(float x_, float y_, int segments_, float gap_){
         
              origin = new PVector(x_, y_);
              segments = segments_;
              gap = gap_;
              
              for(int l = 0; l < segments; l++){
               
                  this.add(new Line(x_, y_ + gap * l, 250.0 - gap * l, 3.0, (int)random(32, 92)));  
                
              }
              
       }
       
       void draw(){ for(Line l : this) l.draw(); }
  
}
