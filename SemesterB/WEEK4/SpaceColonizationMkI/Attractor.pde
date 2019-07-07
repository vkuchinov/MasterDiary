class Attractor extends PVector {
  
  int closestSegment;
  

  public Attractor(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public Attractor(PVector p) {
    this.x = p.x;
    this.y = p.y;
    this.z = p.z;
  }

  
  public int getClosestSegmentIndex() {
    return closestSegment;
  }
  
  public void draw() {
    noFill();
    stroke(0);
    //if(drawAttractors) 
    point(this.x, this.y);
  }
  
}
