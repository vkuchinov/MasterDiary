class Patch {

  float rotateAngle = 290.0;
  PVector axis = new PVector(-1.6, 1.5, 1.7);

  float ink; 
  ArrayList<PVector> points;

  float a;
  float aInc; //gap
  float gap = random(-20, 20);
  float weight = 2.0; //random(0.5, 4);
  
  float y1, y2, middleY;
  float zindex;

  Patch(float y1_, float y2_, float a_) {

    a = a_;
    ink = random(0, 8);

    //0-100:0.5 > 500-600: 8 
    middleY = (y1_ + y2_ / 2);
    y1 = y1_; y2 = y2_;
    
    aInc = map(y1_, -50, 700, 0.4, 8); //map(middleY, 200, 800, 0.002, 64);
    axis.normalize();

    colorMode(HSB);
    color c = color(ink*32, 200, 200, 200);
    noFill();
    stroke(c);
    strokeWeight(weight);
        
    for (int p = 0; p < 16; p++) {
      
        if(p == 7) zindex = cos(radians(a)) * map(masterValue / middleY, 0, 10, 40 + gap, 760 - gap);
      
      }

  }

  void render() {

    colorMode(HSB);
    color c = color(ink*32, 200, 200, 200);
    noFill();
    stroke(c);
    strokeWeight(weight);
        
    for (int p = 0; p < 16; p++) {
      beginShape();
      for (float y = y1; y < y2; y += 1.0) {

        //defining z-index
        if(p == 7) zindex = cos(radians(a)) * map(masterValue / y, 0, 10, 40 + gap, 760 - gap);
        
        //range 10|790
        float x = sin(radians(a)) * map(masterValue / y, 0, 10, 40 + gap, 760 - gap);
        float z = cos(radians(a)) * map(masterValue / y, 0, 10, 40 + gap, 760 - gap);
        PVector point = rotate3D(new PVector(x, -y, z), rotateAngle, axis);
        vertex(point.x, point.y);
      }
      endShape();
      a += aInc;
 
    }
    
  } 

  PVector rotate3D(PVector vert, float angle, PVector axis) {

    PVector clone = new PVector(vert.x, vert.y, vert.z);

    PMatrix3D rMat = new PMatrix3D();
    rMat.rotate(radians(angle), axis.x, axis.y, axis.z);
    rMat.mult(clone, clone);
    return clone;
  }
}

