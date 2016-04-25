int[] data = {3, 6, 12, 19, 29, 31, 33, 34, 40, 49, 69, 88, 89, 90, 91, 98};
NodeList nodes = new NodeList();

void setup(){
  
 size(800, 800, "processing.core.PGraphicsRetina2D"); 
  
 for(int n = 0; n < data.length; n++){
  
    float angle = radians(map(data[n], 0, 100, 0, 360)); 
    float x = sin(angle) * 300.0;
    float y = cos(angle) * 300.0;
    
    nodes.add(new Node(n, x, y));
    
 }

}

void draw(){
  
 background(140);
 translate(width/2, height/2);
 nodes.render();
  
 noLoop();
 
}

class NodeList extends ArrayList{
  
  void render(){
    
     stroke(96);
     strokeWeight(3);
     
     for(int p = 0; p < 360; p++){
       
       point(sin(radians(p)) * 300, cos(radians(p)) * 300);
      
     } 
     
     for(int n = 0; n < this.size(); n++){
       
       Node current = (Node)this.get(n);
       current.render();
      
     } 
    
  }
  
}

class Node extends PVector{
  
 int id;
 int tint;
 
 Node(int id_, float x_, float y_){
  
 id = id_;
 x = x_; y = y_; 
 
 tint = (int)random(0, 255);
   
 }
  
 void render(){
    
    Node related;
    
    colorMode(HSB);
    
    noFill();
    stroke(tint, 240, 240);
    strokeWeight(2);
    
    int randomRelationship = (int)random(0, data.length);
    if(id != randomRelationship) { related = (Node)nodes.get(randomRelationship); }
    else { related = this; }
    
    //through point(0, 0)
    PVector[] mid = getMidPoints(this.x, this.y, related.x, related.y);
    
    if(related != null){
    //beginShape();
    //curveVertex(this.x, this.y); 
    bezier(this.x, this.y, mid[0].x, mid[0].y, mid[1].x, mid[1].y, related.x, related.y);
    //curveVertex(related.x, related.y);
    //endShape();
    }
    
    stroke(tint, 240, 240);
    strokeWeight(9);
    point(this.x, this.y);

 }
 
 PVector[] getMidPoints(float x1, float y1, float x2, float y2){
   
 PVector[] output = new PVector[2];

 //P(t) = P0*t^2 + P1*2*t*(1-t) + P2*(1-t)^2
 output[0] = new PVector(0, 0);
 output[0].x = x1 * pow(0.33, 2) + 0.0 * 2 * 0.33 * (1 - 0.33) + x2 * pow(1 - 0.33, 2);
 output[0].y = y1 * pow(0.33, 2) + 0.0 * 2 * 0.33 * (1 - 0.33) + y2 * pow(1 - 0.33, 2);
 
 output[1] = new PVector(0, 0);
 output[1].x = x1 * pow(0.66, 2) + 0.0 * 2 * 0.33 * (1 - 0.66) + x2 * pow(1 - 0.66, 2);
 output[1].y = y1 * pow(0.66, 2) + 0.0 * 2 * 0.33 * (1 - 0.66) + y2 * pow(1 - 0.66, 2);

 return output; 
 }
  
}
