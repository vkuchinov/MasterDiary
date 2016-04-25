
class Pin {

  // We need to keep track of a Body and a radius
  Body body;
  float r;
  float x, y;

  Pin(float x_, float y_, float r_) {
    r = r_;
    x = x_; y = y_;
    makeBody(x, y, r);
    body.setUserData(this);

  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      return true;
    }
    return false;
  }


  // 
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(0);
    stroke(0);
    strokeWeight(1);
    ellipse(0, 0, r*2, r*2);
    // Let's add a line so we can see the rotation
    line(0, 0, r, 0);
    popMatrix();
  }

  void makeBody(float x, float y, float r) {

    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    // Attach fixture to body
    body.createFixture(fd);

    body.setAngularVelocity(0.0);
  }
}

class PinList extends ArrayList<Pin>{
  
    int cols, rows;
    float gap;
    
    PinList(int cols_, int rows_, float gap_){
     
          cols = cols_; rows = rows_;
          gap = gap_;
          
          for(int y = 0; y < rows; y++){
            for(int x = 0; x < cols; x++){
              
                float shift = 0.0;
                if(y % 2 == 1) shift =  300.0/cols / 2.0;
                this.add(new Pin(50 + 300.0/cols * x + shift, 102 + 300.0/cols * y, 4.0));
                
            }
          }
      
    }
    
    void display(){
     
         for(int p = 0; p < this.size(); p++){
         this.get(p).display();
         } 
      
    }
}
