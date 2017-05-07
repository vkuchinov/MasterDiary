class Fisheye {

  PImage outcome;
  
  PVector size = new PVector(128, 128);
  float mag = 2.0f;
  float k = -0.000016f;

  Fisheye(float size_, float mag_) {

    size = new PVector(size_, pow(size_, 2));
    mag = mag_;
    
  } 

  void showDistortion(int x, int y) {

    outcome = createImage(width, height, ARGB);
    
    int u, v, r2;
    float f;

    for (int vd = - (int)size.x; vd < (int)size.x; vd++) {
      for (int ud = - (int)size.x; ud < (int)size.x; ud++) {

        r2 = ud * ud + vd * vd;
        
        if (r2 <= (int)size.y) {
          
          f = mag + k * r2;
          
          u = floor(ud / f) + x - (int)offset.x;
          v = floor(vd / f) + y - (int)offset.y;
          
          if (u >= 0 && u < grid.width && v >= 0 && v < grid.height)
            outcome.set(ud + x * 2, vd + y, grid.get(u, v));
          else 
            outcome.set(ud + x * 2, vd + y, color(0));
        }
      }
    }

  }
}

