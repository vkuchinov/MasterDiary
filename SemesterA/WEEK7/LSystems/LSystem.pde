class LSystem{
  
  
     PVector origin;   
     String seed;
     Carriage carriage; 
     float lastX, lastY;

     
     LRule rule;
     LDictionary dictionary = new LDictionary();
     
     ArrayList<Segment> segments = new ArrayList<Segment>();
     
     LSystem(PVector origin_, LRule rule_, float len_, float angle_, int levels_){
      
           origin = origin_;
           rule = rule_;
           rule.construct(levels_);
           
           println(rule.expand());

           carriage = new Carriage(origin_.x, origin_.y, angle_, len_);
           
     } 
     
     void build(){
       
       stroke(colors.stroke);
       strokeWeight(1.0);
       
       lastX = origin.x; lastY = origin.y;
       
       for(int r = 0; r < rule.expand().length(); r++){
         
           lastX = carriage.x; lastY = carriage.y;
           dictionary.process(carriage, rule.expand().charAt(r));
           segments.add(new Segment(new PVector(carriage.x, carriage.y), new PVector(lastX, lastY), color(255, 255, 255))); 
           
       }
       
       println(segments.size());
       removeDuplicates(segments);
       println(segments.size());
       
     }
     
     void removeDuplicates(ArrayList<Segment> segments_){
       
       ArrayList<Segment> newSegments = new ArrayList<Segment>();
       
       for(int s = 0; s < segments.size(); s++){
         
         boolean valid = true;
         
         for(int ss = 0; ss < newSegments.size(); ss++){
           
             if(newSegments.size() != 0) { if(segments.get(s).hash == newSegments.get(ss).hash) { valid = false; println("false"); }}
           
         }
         
          if(valid) newSegments.add((Segment)(segments.get(s)));
          
       }
       
       println(newSegments.size());
       segments = newSegments;
       
     }
     
     void draw(){
       
       for(int s = 0; s < segments.size(); s++){
         
               stroke(segments.get(s).tint);
               strokeWeight(0.75);
  
               line(segments.get(s).p0.x, segments.get(s).p0.y, segments.get(s).p1.x, segments.get(s).p1.y);
               
       }
  
     }
     
     void origin(){
      
           stroke(colors.highlightedStroke);
           strokeWeight(6.0);
           point(origin.x, origin.y); 
       
     }     
  
}

class Carriage extends PVector{
       
           Carriage last;
           float angle, len, ratio;
           
           Carriage(){
                   
           }
           
           Carriage(float x_, float y_, float angle_, float len_){
             
                   x = x_; y = y_; z = -90.0;
                   angle = angle_;
                   len = len_;
                   ratio = 0.6;
                   
           }
           
           Carriage(Carriage c_){
             
                   this.x = c_.x; this.y = c_.y; this.z = c_.z;
                   this.angle = c_.angle;
                   this.len = c_.len;
                   this.ratio = c_.ratio;
           }
           
           void replicate(Carriage parent_){
            
                   x = parent_.x; y = parent_.y; z = parent_.z;
                   angle = parent_.angle;
                   len = parent_.len;
                   ratio = parent_.ratio;
                   
           }
       
     }
     
class Segment{
  
     PVector p0, p1;
     color tint;
     
     float hash;
  
     Segment(PVector p0_, PVector p1_, color color_){
  
          p0 = new PVector(p0_.x, p0_.y);
          p1 = new PVector(p1_.x, p1_.y);
          tint = color_;
          hash = (str(p0.x) +  str(p0.y) +  str(p1.x) +  str(p1.y)).hashCode();
     }
     
}
