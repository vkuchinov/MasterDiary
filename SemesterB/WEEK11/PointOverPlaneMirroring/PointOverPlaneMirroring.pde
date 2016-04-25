/*

PointOverPlaneMirroring3D

REFERENCES
http://tube.geogebra.org/m/1714817
https://en.wikipedia.org/wiki/Reflection_(mathematics)
http://mathforum.org/library/drmath/view/54763.html

@author    Vladimir V. KUCHINOV  
@email     helloworld@vkuchinov.co.uk

*/

PVector point = new PVector(-40.0, 50.0, 120.0);
PVector A, B, C;

void setup(){
  
     size(800, 800, P3D); 
  
     A = new PVector(80.0, 10.0, -40.0);
     B = new PVector(-70.0, -10.0, 50.0);
     C = new PVector(0.0, 99.0, 20.0);
     
}

void draw(){
  
     background(240);
     translate(width/2, height/2);
     rotateX(radians(frameCount *  0.2 ));
     rotateY(radians(frameCount * -0.1 ));
     rotateZ(radians(frameCount *  0.05 ));
  
     //point
     stroke(0);
     strokeWeight(5.0);
     point(point.x, point.y, point.z);
     
     fill(128, 64);
     strokeWeight(1.0);
     beginShape();
     vertex(A.x, A.y, A.z);
     vertex(B.x, B.y, B.z);
     vertex(C.x, C.y, C.z);
     endShape(CLOSE);
     
     PVector pM = reflect3D(point, A, B, C);
     stroke(255, 0, 255);
     strokeWeight(5.0);
     point(pM.x, pM.y, pM.z);
     
      if (keyPressed) {
        
          if (key == 'q' || key == 'Q') A.x += 2.0;
          if (key == 'w' || key == 'W') A.x -= 2.0;
          if (key == 'a' || key == 'a') A.y += 2.0;
          if (key == 's' || key == 'S') A.y -= 2.0;
          if (key == 'z' || key == 'Z') A.z += 2.0;
          if (key == 'x' || key == 'X') A.z -= 2.0;
          if (key == 'e' || key == 'E') B.x += 2.0;
          if (key == 'r' || key == 'R') B.x -= 2.0;
          if (key == 'd' || key == 'D') B.y += 2.0;
          if (key == 'f' || key == 'F') B.y -= 2.0;
          if (key == 'c' || key == 'C') B.z += 2.0;
          if (key == 'v' || key == 'V') B.z -= 2.0;
          if (key == 't' || key == 'T') C.x += 2.0;
          if (key == 'y' || key == 'Y') C.x -= 2.0;
          if (key == 'g' || key == 'G') C.y += 2.0;
          if (key == 'h' || key == 'H') C.y -= 2.0;
          if (key == 'b' || key == 'B') C.z += 2.0;
          if (key == 'n' || key == 'N') C.z -= 2.0;
      
      }

}

PVector reflect3D(PVector p_, PVector A_, PVector B_, PVector C_){
 
     float x, y, z,nx, ny, nz;
     
     //plane normal
     //n = cross(P1 - P3, P2 - P3);
     nx = (B_.y - A_.y)*(C_.z - A_.z) - (B_.z - A_.z)*(C_.y - A_.y);
     ny = (B_.z - A_.z)*(C_.x - A_.x) - (B_.x - A_.x)*(C_.z - A_.z);
     nz = (B_.x - A_.x)*(C_.y - A_.y) - (B_.y - A_.y)*(C_.x - A_.x);
     
     PVector n = new PVector(nx, ny, nz);
     n.normalize();
     
     PVector centroid = getCentroid(A_, B_, C_);
     strokeWeight(4.0);
     point(centroid.x, centroid.y, centroid.z);
     
     PVector sub = new PVector(A_.x, A_.y, A_.z);
     sub.sub(p_);
     float dot = 2.0 * PVector.dot(sub, n);
 
     n.mult(dot);
     PVector out = new PVector(p_.x, p_.y, p_.z);
     out.add(n);
     
     return out;
  
}

PVector getCentroid(PVector p0_, PVector p1_, PVector p2_){
  
    PVector centroid = new PVector();
    centroid.add(p0_); centroid.add(p1_); centroid.add(p2_);
    centroid.div(3);
    return centroid;
  
}


