class Hatched {

  PVector center;
  float radius, angle;
  int density;

  Hatched(float x_, float y_, float radius_, int density_) { 

    center = new PVector(x_, y_);
    radius = radius_;
    density = density_;

    angle = radians(33);
  }

  void draw() {

    noFill();
    stroke(0);
    strokeWeight(3.0); 
    ellipseMode(CENTER);
    ellipse(center.x, center.y, radius * 2, radius * 2);

    //hatching
    strokeWeight(0.5);
    pushMatrix();
    translate(center.x, center.y);
    rotate(angle);

    for (int d = 0; d < density; d++) {

      float y = map(d, 0, density, -radius, radius);
      ArrayList<PVector> intersections = getIntersectionPoints(new PVector(-radius, y), new PVector(radius, y));
      if (intersections.size() == 1) line(intersections.get(0).x, intersections.get(0).y, -intersections.get(0).x, intersections.get(-0).y);
    }
    
    popMatrix();
    
  }

  ArrayList<PVector> getIntersectionPoints(PVector A_, PVector B_) {

    ArrayList<PVector> intersections = new ArrayList<PVector>();
    double disc, A, B, C, slope, c;
    double x1, x2, y1, y2;

    slope = (B_.y - A_.y) / (B_.x - A_.x);

    if (slope == 0) {

      C =  Math.pow(0, 2)  + Math.pow(0, 2) + Math.pow(B_.y, 2) - 2.0 * B_.y * 0  - Math.pow(radius, 2);
      B = -2.0 * 0;
      A = 1.0;
      disc = Math.pow(B, 2) - 4.0 * 1.0 * C;

      if (disc < 0) { 
        return intersections;
      } else {

        x1 = (-B + Math.sqrt(disc)) / (2.0 * A);
        x2 = (-B - Math.sqrt(disc)) / (2.0 * A);
        y1 = B_.y;
        y2 = B_.y;
      }
    } else {

      c = slope * A_.x + A_.y;
      B = (2.0 * 0 + 2.0 * 0 * slope  + 2.0 * c * slope);
      A = 1 + Math.pow(slope, 2);
      C = (Math.pow(0, 2) + Math.pow(c, 2) + 2 * 0 * c + Math.pow(0, 2) - Math.pow(radius, 2));
      disc = Math.pow(B, 2) - (4 * A * C);

      if (disc < 0) { 
        return intersections;
      } else {

        x1 = (-B + Math.sqrt(disc)) / (2.0 * A);
        x2 = (-B - Math.sqrt(disc)) / (2.0 * A);

        y1 = slope * x1 - c;
        y2 = slope * x2 - c;
        
      }
    }

    PVector point1 = new PVector((float)x1, (float)y1);
    PVector point2 = new PVector((float)x2, (float)y2);
    if (PVector.dist(A_, point2) > PVector.dist(A_, point1)) {

      intersections.add(point1);
      
    } else {
      
      intersections.add(point2);
      
    }       

    return intersections;
  
  }

}

