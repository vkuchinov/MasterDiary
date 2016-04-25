class Floor{
  
  ArrayList<Cross> points = new ArrayList();
  
  Floor(int w_, int h_){
    
    for(int z = -h_/2; z < h_/2; z += 10){
      for(int x = -w_/2; x < w_/2; x += 10){
      points.add(new Cross(x, z));
      } 
    }
    
  }
  
  void draw(){
    
    for(int p = 0; p < points.size(); p++){
    points.get(p).draw();  
    }
    
  }
  
}

class Cross{
  
 int dim = 4;
 PVector pos;
 Cross(int x_, int z_){
 
 pos = new PVector(x_, 0.0, z_);
 
 } 
 
 void draw(){
  
 stroke(128);
 strokeWeight(0.75);
 line(pos.x + -dim/2, 0.0, pos.z, pos.x + dim/2, 0.0, pos.z);
 line(pos.x, 0.0, pos.z + -dim/2, pos.x, 0.0, pos.z + dim/2);
 }
  
}

class Sun{
  
  PVector pos;
  float radius = 32.0;
  
  Sun(PVector p_){
  
  pos = new PVector(p_.x, p_.y, p_.z);
  
  }
  
  void draw(){
    
  stroke(200, 200, 64);
  strokeWeight(3);
  line(pos.x - radius, pos.y, pos.z, pos.x + radius, pos.y, pos.z);
  line(pos.x, pos.y - radius, pos.z, pos.x, pos.y + radius, pos.z);
  line(pos.x, pos.y, pos.z - radius, pos.x, pos.y, pos.z + radius);
    
  }
  
}

interface Dot {
  void cast();
}

