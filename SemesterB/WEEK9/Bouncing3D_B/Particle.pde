class Particle extends PVector {

  PVector v;
  PVector b, b1, b2;
  PVector n;

  Particle(float x_, float y_, float z_) {

    x = x_; 
    y = y_; 
    z = z_;
    v = new PVector(random(-1.0, 1.0), random(-1.0, 1.0), random(-1.0, 1.0));
    b = new PVector(0.0, 0.0, 0.0);
    b1 = new PVector(0.0, 0.0, 0.0);
    b2 = new PVector(0.0, 0.0, 0.0);
    n = new PVector(0.0, 0.0, 0.0);
  } 

  void setPoints(Sphere walls_) {

    PVector c = new PVector(walls_.center.x, walls_.center.y, walls_.center.z); 
    while (PVector.dist (b, c) < 100.0) {

      b.x += v.x; 
      b.y += v.y; 
      b.z += b.z;
      
    }
  }

  void draw(Sphere walls_) {

    PVector c = new PVector(walls_.center.x, walls_.center.y, walls_.center.z);
    stroke(0);  
    strokeWeight(5);
    point(x, y, z); 
    point(b.x, b.y, b.z);

    stroke(#FF00FF);
    strokeWeight(2);
    line(x, y, z, b.x, b.y, b.z); 
    //line(c.x, c.y, c.z, b.x, b.y, b.z);

    //n
    PVector n1 = new PVector(0.0, 0.0, 0.0);
    n1.x = (c.x - x) / abs(c.x - x);
    n1.y = (c.y - y) / abs(c.y - y);
    n1.z = (c.z - z) / abs(c.z - z);
    n1.normalize();

    b1.x = n1.x; 
    b1.y = n1.y; 
    b1.z = n1.z;

    stroke(#FFFF00);
    line(b.x, b.y, b.z, b1.x, b1.y, b1.z);

    stroke(0);  
    strokeWeight(5);
    point(b1.x, b1.y, b1.z);

    stroke(#00FFFF);
    strokeWeight(2);

    PVector n2 = new PVector(0.0, 0.0, 0.0);
    n2.x = (c.x - b1.x) / abs(c.x - b1.x);
    n2.y = (c.y - b1.y) / abs(c.y - b1.y);
    n2.z = (c.z - b1.z) / abs(c.z - b1.z);
    n2.normalize();

    b2.x = n2.x; 
    b2.y = n2.y; 
    b2.z = n2.z;

    while (PVector.dist (b2, c) < 100.0) {

      b2.x += n2.x; 
      b2.y += n2.y; 
      b2.z += n2.z;
    }

    line(b1.x, b1.y, b1.z, b2.x, b2.y, b2.z);

    stroke(0);  
    strokeWeight(5);
    point(b2.x, b2.y, b2.z);
  }
}

class ParticleSystem extends ArrayList<Particle> {
}

