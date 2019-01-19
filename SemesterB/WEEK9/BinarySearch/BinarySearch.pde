/*

BINARY SEARCH

In computer science, binary search, also known as half-interval search,
logarithmic search, or binary chop, is a search algorithm that finds 
the position of a target value within a sorted array.

Binary search compares the target value to the middle element of the array. 
If they are not equal, the half in which the target cannot lie is eliminated 
and the search continues on the remaining half, again taking the middle 
element to compare to the target value, and repeating this until 
the target value is found. If the search ends with the remaining 
half being empty, the target is not in the array. 

Even though the idea is simple, implementing binary search correctly 
requires attention to some subtleties about its exit conditions 
and midpoint calculation, particularly if the values in the array 
are not all of the whole numbers in the range.

For this example, max value is the sum of all r(n);

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float EPSILON = 1E-9;
Binary search;

float[] radiuses = new float[]{ 30.5, 99.0, 10.2, 10.2, 60.5, 60.0, 75.0, 32.0, 24.5, 6.0, 8.0, 32.0, 30.0, 16.0, 12.0 };
ArrayList<PVector> points = new ArrayList<PVector>();

float R = 28.0;
boolean done = false;
float sum = 0.0;
float dt0, dt1;

void setup(){
  
   size(600, 600, "processing.core.PGraphicsRetina2D"); 
   translate(width/2, height/2);

   //classical straight-forward method

   ArrayList<Float> thetas = new ArrayList<Float>();  
   int t0 = millis();
   
   while(!done){
     
       sum = 0.0;
       
       background(220);
       stroke(255, 0, 255);
       strokeWeight(1.0);
       ellipse(0, 0, R * 2, R * 2);
  
       Circle first = new Circle( new PVector(0, -R - radiuses[0], 0), radiuses[0]);
       first.draw(128);
       Circle previous = first;
       
       for(int i = 1; i <= radiuses.length; i++){
         
       Circle next;
       
       if(i < radiuses.length) { next = circlesToTangent(new Circle(new PVector(0, 0, 0), R), previous, radiuses[i], -1.0); }
       else { next = circlesToTangent(new Circle(new PVector(0, 0, 0), R), previous, radiuses[0], -1.0); } 

       float theta = getDoubleAngle(previous, next);
       sum += theta;
       
       color c = 128;
       if(i == radiuses.length) { c = color(255, 255, 0); }
       next.draw(c, previous); 
       previous = next;

       if(sum > TWO_PI) { R += 0.1; break; }
       
       }

       if(sum < TWO_PI) { dt0 = (millis() - t0) / 1000.0; println("CLASSIC: R:", R, dt0); done = true; }
  
   }

   //binary search
   search = new Binary(32.0, getSum(radiuses));
   done = false;
   t0 = millis();
   R = search.getMedian();

    while(!done){
     
       sum = 0.0;
       
       background(220);
       stroke(255, 0, 255);
       strokeWeight(1.0);
       ellipse(0, 0, R * 2, R * 2);
   
       Circle first = new Circle( new PVector(0, -R - radiuses[0], 0), radiuses[0]);
       first.draw(128);
       Circle previous = first;
       
       for(int i = 1; i <= radiuses.length; i++){
         
       Circle next;
       
       if(i < radiuses.length) { next = circlesToTangent(new Circle(new PVector(0, 0, 0), R), previous, radiuses[i], -1.0); }
       else { next = circlesToTangent(new Circle(new PVector(0, 0, 0), R), previous, radiuses[0], -1.0); } 

       float theta = getDoubleAngle(previous, next);
       sum += theta;
       
       color c = 128;
       if(i == radiuses.length) { c = color(255, 255, 0); }
       next.draw(c, previous); 
       previous = next;

       }

       if(abs(TWO_PI - sum) < EPSILON) { float dt1 = (millis() - t0) / 1000.0; println("BINARY R:", R, dt1, (int)(dt0/dt1) + "xFASTER"); done = true; }
       else if((TWO_PI - sum) < 0) {  search.right(); R = search.getMedian(); }
       else if((TWO_PI - sum) > 0) {  search.left(); R = search.getMedian();  }

   }

}

float getSum(float[] r_) { float out = 0.0; for(float v : r_) { out += v; }  return out; }

PVector getTangents(Circle c_, PVector p_, int index_){
 
   PVector[] out = new PVector[]{new PVector(0, 0), new PVector(0, 0)};
 
   PVector median = PVector.lerp(new PVector(c_.center.x, c_.center.y), p_, 0.5);
   float dist = median.dist(p_);

        float dx = p_.x - median.x;
        float dy = p_.y - median.y;

        float d = sqrt((dy*dy) + (dx*dx));

        if (d > (c_.radius + dist)) { return new PVector(0, 0); }
        if (d < abs(c_.radius - dist)) { return new PVector(0, 0); }

        float a = (pow(c_.radius, 2) - pow(dist, 2) + pow(d, 2)) / (2.0 * d) ;

        float x2 = c_.center.x + (dx * a/d);
        float y2 = c_.center.y + (dy * a/d);

        float h = sqrt(pow(c_.radius, 2) - pow(a, 2));

        float rx = -dy * (h/d);
        float ry = dx * (h/d);

        out[0] = new PVector(x2 + rx, y2 + ry);
        out[1] = new PVector(x2 - rx, y2 - ry);

   return out[index_];
   
}

Circle circlesToTangent(Circle c1_, Circle c2_, float radius_, float side_) {
    
      float x1 = c1_.center.x, y1 = c1_.center.y, r1 = c1_.radius;
      float x2 = c2_.center.x, y2 = c2_.center.y, r2 = c2_.radius;

      PVector v = new PVector(x1 - x2, y1 - y2);
      
      double  l3 = modulus(v);
      
      float isens = 1.0;
      
      if (c1_.type == "IN" || c2_.type == "IN") { isens *= -1.0; }
      
      double l1 = r1 + isens*radius_;
      double l2 = r2 + radius_;
      
      double cosv = (l3 * l3 - l1 * l1 + l2 * l2)/(2.0 * l2 * l3);
      
      if (cosv < -1.0 || cosv > 1.0) { return null; }
        
      double angle = Math.acos( cosv ) * side_;
      PVector vnew = rotateVector(v, angle, l2);
      PVector newcenter = PVector.add( c2_.center, vnew);

      return new Circle(newcenter, radius_);
}

double modulus(PVector v_){
  
  return Math.sqrt(v_.dot(v_));
  
}

PVector rotateVector(PVector v_, double angle_, double l_){
  
   double xTmp = v_.x;
   double x = v_.x*Math.cos(angle_) - v_.y*Math.sin(angle_);
   double y = xTmp * Math.sin(angle_) + v_.y*Math.cos(angle_);
   
   PVector output = new PVector((float)x, (float)y);
   output.normalize();
   output.mult((float)l_);
   return output;
  
}

boolean checkCollision(Circle a_, Circle b_){

   float dist = PVector.dist(new PVector(a_.center.x, a_.center.y), new PVector(b_.center.x, b_.center.y)); 
   
   if(dist > (a_.radius + b_.radius) - 1) { return false; }
   else if(dist <= abs(a_.radius - b_.radius) + 1) { return true; }
   else { return true; }


}

float getDoubleAngle(Circle p_, Circle n_){
  
   PVector p1 = new PVector(n_.center.x, n_.center.y);
   PVector p2 = new PVector(p_.center.x, p_.center.y);
   
   return acos((((p1.x * p2.x) + (p1.y * p2.y)) / (sqrt(pow(p1.x, 2) + pow(p1.y, 2)) * sqrt(pow(p2.x, 2) + pow(p2.y, 2)))));
    
}



float getFullAngle(Circle l_){
  
      float a = l_.radius, b = R + l_.radius;
      return 2.0 * asin(a / sqrt(a * a + b * b));

}

float getAngle(PVector center_, PVector p0_, PVector p1_){
  
      float phi = atan2(p1_.y, p1_.x) - atan2(p0_.y, p0_.x);
      phi *= 360.0 / (2.0 * PI);
      if (phi < 0){ phi = phi + 360;}

      return radians(phi);

}

