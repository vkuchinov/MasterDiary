class LSystem{
  
  
     PVector origin;   
     String seed;
     Carriage carriage; 
     float lastX, lastY;

     
     LRule rule;
     LDictionary dictionary = new LDictionary();
     
     LSystem(PVector origin_, LRule rule_, float len_, float angle_, int levels_){
      
           origin = origin_;
           rule = rule_;
           rule.construct(levels_);
           
           println(rule.expand());

           carriage = new Carriage(origin_.x, origin_.y, angle_, len_);
           
     } 
     
     void draw(){
       

       strokeWeight(1.0);
       
       lastX = origin.x; lastY = origin.y;
       
       for(int r = 0; r < rule.expand().length(); r++){
         
           strokeWeight(0.75);
          
           dictionary.process(carriage, rule.expand().charAt(r));
           line(carriage.x, carriage.y, carriage.last.x, carriage.last.y);

       }
  
     }
     
     void origin(){
      
           stroke(colors.strokeA);
           strokeWeight(6.0);
           point(origin.x, origin.y); 
       
     }     
  
}

class Carriage extends PVector{
       
           PVector last;
           float angle, len, ratio;
           
           Carriage(){
                   
           }
           
           Carriage(float x_, float y_, float angle_, float len_){
             
                   x = x_; y = y_; z = -90.0;
                   angle = angle_;
                   len = len_;
                   ratio = 0.6;
                   last = new PVector(x_, y_);
                   
           }
           
           Carriage(Carriage c_){
             
                   this.x = c_.x; this.y = c_.y; this.z = c_.z;
                   this.angle = c_.angle;
                   this.len = c_.len;
                   this.ratio = c_.ratio;
                   this.last = c_.last;
           }
           
           void replicate(Carriage parent_){
            
                   x = parent_.x; y = parent_.y; z = parent_.z;
                   angle = parent_.angle;
                   len = parent_.len;
                   ratio = parent_.ratio;
                   
           }
       
     }
