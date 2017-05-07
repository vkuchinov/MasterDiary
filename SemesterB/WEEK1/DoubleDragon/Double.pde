class Double{
 
   int size;
   int steps;
   ArrayList<PVector> nodes = new ArrayList<PVector>();
   
   Double(int x_, int y_, int size_, int steps_){

       size = size_;
       nodes.add(new PVector(x_, y_));   
       this.generate(steps_);
       
   }
   
   void generate(int level_){
     
   }
  
   void draw(){
     
       noStroke();
       fill(0);
       
       for(PVector n : nodes){
       rectMode(CENTER);
       rect(n.x, n.y, size, size);
       }
       
   }
   
}
