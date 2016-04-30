class Koch{
  
      final int MAX_POINTS = 2048;
      
      float x, y;
      float radius;
      float theta;
      
      PointList points = new PointList();
      
      Koch(float x_, float y_, float radius_, float theta_){
        
           x = x_; y = y_;
           radius = radius_;
           theta = theta_;
        
           for(int p = 0; p < 3; p++){
             
                 float pTheta = theta + 2 * PI / 3.0 * p;
                 float pX = this.x + cos(pTheta) * radius;
                 float pY = this.y + sin(pTheta) * radius;
             
                 points.add(new Point(pX, pY, pTheta));
           }
           
      }
      
      void nextLevel(){
       
            if(points.size() < MAX_POINTS){
              
                 PointList tmpPoints = new PointList();
                 
                 for(int p = 0; p < points.size(); p++){
                  
                      int index1, index2;
                      if(p < points.size() - 1) { index1 = p; index2 = p + 1; } else { index1 = p; index2 = 0; }
                      
                      //add original point 
                      tmpPoints.add(points.get(index1));
                      
                      PVector p0 = PVector.lerp(points.get(index1).v, points.get(index2).v, 1.0 / 3.0);
                      float p0theta = lerp(points.get(index1).theta, points.get(index2).theta, 1.0 / 3.0);
                      tmpPoints.add(new Point(p0.x, p0.y, p0theta));
     
                      PVector p2 = PVector.lerp(points.get(index1).v, points.get(index2).v, 1.0 / 3.0 * 2.0);
                      float p2theta = lerp(points.get(index1).theta, points.get(index2).theta, 1.0 / 3.0 * 2.0);
                      
                      float ACBC = PVector.dist(points.get(index1).v, p0);
                      PVector[] intersections = IntersectionsOfTwoCircles(p0, ACBC, p2, ACBC);
                      tmpPoints.add(new Point(intersections[1].x, intersections[1].y, 0.0));
                      
                      tmpPoints.add(new Point(p2.x, p2.y, p2theta));
                  
                 }
                 
                 points.clear();
                 for(Point p : tmpPoints) points.add(p);
              
            }
      
      }
      
      PVector[] IntersectionsOfTwoCircles(PVector p0_, float radius0_, PVector p1_, float radius1_){
      
          float a = radius1_;
          float b = radius0_;
          float c = sqrt(pow((p0_.x - p1_.x), 2) + pow((p0_.y - p1_.y), 2));
          float d = (pow(b, 2) + pow(c, 2) - pow(a, 2)) / ( 2.0 * c);
          float h = sqrt(pow(b, 2) - pow(d, 2));
          
          float x1 = (p1_.x - p0_.x) * d / c + (p1_.y - p0_.y) * h / c + p0_.x;
          float y1 = (p1_.y - p0_.y) * d / c - (p1_.x - p0_.x) * h / c + p0_.y;
          
          float x2 = (p1_.x - p0_.x) * d / c - (p1_.y - p0_.y) * h / c + p0_.x;
          float y2 = (p1_.y - p0_.y) * d / c + (p1_.x - p0_.x) * h / c + p0_.y;

      return new PVector[]{new PVector(x1, x2), new PVector(x2, y2)};
        
      }
      
      void draw() { points.draw(); }
      
}

class Point{
  
      PVector v;
      float x, y, theta;
      
      Point(float x_, float y_, float theta_){  x = x_; y = y_; v = new PVector(x, y); theta = theta_; }
      
}

class PointList extends ArrayList<Point>{
  
      void draw(){
       
           noFill();
           beginShape();
           for(Point p : this) vertex(p.x, p.y);
           endShape(CLOSE); 
        
      }
  
}
