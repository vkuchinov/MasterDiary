/*

CONVEX HULL + [pseudo] METABALLS

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;

import java.util.Comparator;
import java.util.Collections;
import java.util.Stack;

final int POINT_SIZE = 3;
final color POINT_COLOR = #C42F59;
final float HULL_SIZE = 1;
final color HULL_STROKE = #5E3F50;
final color HULL_FILL = #264750;

ArrayList<Point> pointList;
Random seed = new Random(1245678);

ArrayList<Point> buildHull(ArrayList<Point> points_) {
  
  if (points_.size() < 3)
    return null;

  Point p0 = null;
  for (int i = 0; i < points_.size(); ++i) {
    Point curr = (Point) points_.get(i);
    if (p0 == null ||
        curr.y < p0.y ||
        (curr.y == p0.y && curr.x < p0.x))
      p0 = curr;
  }

  class PointAngleComparator implements Comparator {
    private Point p0;
    public PointAngleComparator(Point p0_) { p0 = p0_; }
    private float angle(Point pt) {
      return atan2(pt.y - p0.y, pt.x - p0.x);
    }
    public int compare(Object o1, Object o2) {
      Point p1 = (Point) o1, p2 = (Point) o2;
      float a1 = angle(p1), a2 = angle(p2);
      if (a1 > a2) return 1;
      if (a1 < a2) return -1;
      return Float.compare(dist(p0.x, p0.y, p1.x, p1.y), dist(p0.x, p0.y, p2.x, p2.y));
    }
  }
  Collections.sort(points_, new PointAngleComparator(p0));

  Stack hull = new Stack();
  hull.push(points_.get(0)); hull.push(points_.get(1)); hull.add(points_.get(2));
  for (int i = 3; i < points_.size(); ++i) {
    Point cur = (Point) points_.get(i);
    while (hull.size() >= 3) {
      Point snd = (Point) hull.get(hull.size() - 2);
      Point top = (Point) hull.peek();
      int crossproduct = (top.x - snd.x) * (cur.y - snd.y) - (cur.x - snd.x) * (top.y - snd.y);
      if (crossproduct > 0) break;
      hull.pop();
    }
    hull.push(cur);
  }

  ArrayList<Point> h = new ArrayList(hull);
  return h;
}

void drawPoint(Point pt_) {
  
  stroke(POINT_COLOR);
  strokeWeight(POINT_SIZE);
  point(pt_.x, pt_.y);
  
}

void drawCircles(ArrayList<PVector> circles_) {
  
  for(int i = 0; i < circles_.size(); i++){
    
      PVector c = circles_.get(i);
      fill(255, 8);
      noStroke();
      for(int j = 0; j < c.z; j ++){
      ellipse(c.x, c.y, j * 2, j * 2);
      }
  }
  
}

void drawHull(ArrayList<Point> hull_) {
  
  if (hull_ == null) return;

  fill(HULL_FILL, 32);
  stroke(HULL_STROKE);
  strokeWeight(HULL_SIZE);

  beginShape();
  
  for (int i = 0; i < hull_.size(); ++i) {
    
    Point pt = (Point) hull_.get(i);
    vertex(pt.x, pt.y);
    
  }
  
  endShape(CLOSE);
  
}

ArrayList<PVector> centers = new ArrayList<PVector>();

void setup() {
  
  size(500, 500);
  background(#103339);
  smooth();
  
  pointList = new ArrayList<Point>();
  
  for(int k = 0; k < 8; k++){
 
  float x = width / 2 -64 + seed.nextInt(128);
  float y = height / 2 - 64 + seed.nextInt(128);
  float r = 8 + seed.nextInt(56);
  
  centers.add(new PVector(x, y, r));
  
  }
  
  for(int i = 0; i < centers.size(); i++){
    
      for(int j = 0; j < 16; j++){
       
           float x = centers.get(i).x + centers.get(i).z * cos(TWO_PI / 16 * j);
           float y = centers.get(i).y + centers.get(i).z * sin(TWO_PI / 16 * j);
           
           pointList.add(new Point((int)x, (int)y));

      }
    
  }

}

void draw() {

  background(#103339);
  drawCircles(centers);
  filter(POSTERIZE, 4);
  drawHull(buildHull(pointList));
  for (int i = 0; i < pointList.size(); ++i){
    drawPoint((Point) pointList.get(i));
  }
  

}

