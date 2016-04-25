class Circle{
  
     String type; //IN, OUT
     PVector center;
     float radius;
     boolean selected = false;
     
     Circle(PVector center_, float radius_, String type_){
       
         center = new PVector(center_.x, center_.y, 0.0);
         radius = radius_;
         
         type = type_;
       
     }
  
     void draw(color c_){
      
          noStroke();
          fill(c_);
          ellipseMode(CENTER);
          ellipse(center.x, center.y, radius*2, radius*2);
       
     }
}

class CircleList extends ArrayList<Circle>{
  
     HashMap<Integer, Integer> selected = new HashMap<Integer, Integer>();
     
     void draw(){
      
           for(int c = 0; c < this.size(); c++){
             
                //retro air color scheme from kuler.adobe.com
                if(c < 2) this.get(c).draw(color(#F24C27)); else this.get(c).draw(#F2EFDC);
             
           }
       
     } 
  
     void draw(float mx_, float my_){
      
           for(int c = 0; c < this.size(); c++){
             
                //retro air color scheme from kuler.adobe.com
                if(c < 2) { this.get(c).draw(color(#F24C27)); } else if(mouseOver(this.get(c), mx_, my_) || this.get(c).selected) { this.get(c).draw(#037E8C); } else { this.get(c).draw(#F2EFDC); }
             
           }
       
     } 
     
     void mousePressed(){
       
               for(int c = 0; c < this.size(); c++){
             
                //retro air color scheme from kuler.adobe.com
                if(mouseOver(this.get(c), mouseX, mouseY)) { if(selected.containsKey(c)) { selected.remove(c); this.get(c).selected = false; } else {selected.put(c, c); this.get(c).selected = true;}}
             
                }
           
     }
     
     void keyPressed(){
       
       
       if(selected.size() == 2){

              if(circleTangency(circles.get((Integer)selected.values().toArray()[0]), circles.get((Integer)selected.values().toArray()[1]))){
        
                    float nextRadius = -3.0 + seed.nextInt(6000)/1000.0;
          
                    Circle c3a = circlesToTangent(circles.get((Integer)selected.values().toArray()[0]), circles.get((Integer)selected.values().toArray()[1]), 8.0 + nextRadius, inc);
                    if(!circleIntersection(c3a, circles.size(), circles) && circleTangency(c3a, circles.get((Integer)selected.values().toArray()[0]), circles.get((Integer)selected.values().toArray()[1]))) { circles.add(c3a);}
          
                    Circle c3b = circlesToTangent(circles.get((Integer)selected.values().toArray()[0]), circles.get((Integer)selected.values().toArray()[1]), 8.0 + nextRadius, -inc);
                    if(!circleIntersection(c3b, circles.size(), circles) && circleTangency(c3b, circles.get((Integer)selected.values().toArray()[0]), circles.get((Integer)selected.values().toArray()[1]))) { circles.add(c3b);}
                    
                    circles.get((Integer)selected.values().toArray()[0]).selected = false;
                    circles.get((Integer)selected.values().toArray()[1]).selected = false;
                    
                    selected = new HashMap<Integer, Integer>();
                    
              }        
         
       }
      
       
     }
   
     boolean mouseOver(Circle c, float mx_, float my_){
       
           PVector mouse = new PVector(mx_, my_);
           if(PVector.dist(c.center, mouse) < c.radius) return true;
           return false;
           
     }
}
