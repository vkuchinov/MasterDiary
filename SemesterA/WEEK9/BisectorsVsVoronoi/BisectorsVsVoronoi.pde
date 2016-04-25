/*

Delaunay, Bisectors & Voronoi
some bisectors are matching Voronoi diagram, some not. 
In the same time, there are two missing lines for building
a proper Voronoi.

Have to dig further, read more articles and books.
Why I am doing it? To master my skills in geometry and
to train my abstract thinking.

And, still, there is a problem how to pick proper cross points 
among dozens...

FURTHER READINGS:
https://www.topcoder.com/community/data-science/data-science-tutorials/geometry-concepts-line-intersection-and-its-applications/

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

ArrayList<PVector> nodes = new ArrayList<PVector>();
ArrayList<PVector> centers = new ArrayList<PVector>();
ArrayList<Integer> colors = new ArrayList<Integer>();
PImage voronoi;

void setup() {  
  
  size(600, 600, "processing.core.PGraphicsRetina2D");
  background(64);  
  
  voronoi = createImage(600, 600, RGB);

  nodes.add(new PVector(105, 150));
  nodes.add(new PVector(210, 450));
  nodes.add(new PVector(255, 300));
  nodes.add(new PVector(315, 150));
  nodes.add(new PVector(465, 90));
  nodes.add(new PVector(465, 300));
  nodes.add(new PVector(465, 510));

  for(int c = 0; c < nodes.size(); c++){
     colors.add((int)random(128, 224)); 
  }
  
  PVector[] nodesArray = nodes.toArray(new PVector[nodes.size()]);
  
  for(int pp = 0; pp < nodes.size(); pp++){
      for(int p = 2; p < nodes.size(); p++){
          centers.add(getCircumcircleCenter(nodesArray[0], nodesArray[p - 1], nodesArray[p]));
      }
      //centers.add(getCircumcircleCenter(nodesArray[nodes.size() - 2], nodesArray[nodes.size() - 1], nodesArray[0]));
      //centers.add(getCircumcircleCenter(nodesArray[nodes.size() - 1], nodesArray[0], nodesArray[1]));
      nodesArray = shiftArray(nodesArray);
      println(nodesArray);
  }
  
  //render voronoi test
  drawVoronoi();
  image(voronoi, 0, 0);
  
  //perpendicular bisectors
  for (int i = 0; i < nodes.size(); i++)
  {
      for (int j = i+1; j < nodes.size(); j++)
      {
          float midx = (1.0 * nodes.get(i).x + nodes.get(j).x) / 2.0;
          float midy = (1.0 * nodes.get(i).y + nodes.get(j).y) / 2.0;
          
          float slope = (1.0 * nodes.get(i).y - nodes.get(j).y)/(1.0 * nodes.get(i).x - nodes.get(j).x);
          slope = -1.0 / slope;
          float x1 = midx + width;
          float x2 = midx - width;
          float y1 = midy + height * slope;
          float y2 = midy - height * slope;
          stroke(0, 128);
          strokeWeight(1.0);
          line( x1, y1, x2, y2);
          
          //have to find a way to show scene border points, p1/p2 are offscreen
          //intersecting with (0,0)(width,0), (0,0)(0,height), (width, height)(width,0), (0,height)(width, height)
          
          stroke(255, 0, 0);
          strokeWeight(4);
          
          //top
          PVector[] line = {new PVector(x1, y1), new PVector(x2, y2)};
          PVector[] top = {new PVector(0.0, 0.0), new PVector(width, 0.0)};
          PVector[] right = {new PVector(width, 0.0), new PVector(width, height)};
          PVector[] bottom = {new PVector(0.0, height), new PVector(width, height)};
          PVector[] left = {new PVector(0.0, 0.0), new PVector(0.0, height)};
          
          PVector topPoint = findIntersection(line, top);
          PVector rightPoint = findIntersection(line, right);
          PVector bottomPoint = findIntersection(line, bottom);
          PVector leftPoint = findIntersection(line, left);
         
          if(topPoint != null) { point(topPoint.x, topPoint.y); }
          if(rightPoint != null) { point(rightPoint.x, rightPoint.y); }
          if(bottomPoint != null) { point(bottomPoint.x, bottomPoint.y); }
          if(leftPoint != null) { point(leftPoint.x, leftPoint.y); }

       }
  }
  
  for (int i = 0; i < nodes.size(); i++)
  {
      stroke(255);
      strokeWeight(6.0);
      point(nodes.get(i).x, nodes.get(i).y);
  }
  
  for (int i = 0; i < centers.size(); i++)
  {
      stroke(0, 255, 255);
      strokeWeight(3.0);
      point(centers.get(i).x, centers.get(i).y);
  }
  
       
}

void draw() {  

}

PVector getCircumcircleCenter(PVector a_, PVector b_, PVector c_){
  
    final double EPSILON = Math.ulp(1.0);
    PVector center = new PVector(0.0, 0.0);
    
    double xc, yc, m1, m2, mx1, mx2, my1, my2, dx, dy;
    double y1y2 = Math.abs(a_.y - b_.y);
    double y2y3 = Math.abs(b_.y - c_.y);
    
    if(y1y2 < EPSILON && y2y3 < EPSILON) println("coincident points");
    
    if(y1y2 < EPSILON){
        m2  = -((c_.x - b_.x) / (c_.y - b_.y));
        mx2 = (b_.x + c_.x) / 2.0;
        my2 = (b_.y + c_.y) / 2.0;
        xc  = (b_.x + a_.x) / 2.0;
        yc  = m2 * (xc - mx2) + my2;
    }
    else if(y2y3 < EPSILON){
        m1  = -((b_.x - a_.x) / (b_.y - a_.y));
        mx1 = (a_.x + b_.x) / 2.0;
        my1 = (a_.y + b_.y) / 2.0;
        xc  = (c_.x + b_.x) / 2.0;
        yc  = m1 * (xc - mx1) + my1;
    }
    else{
        m1  = -((b_.x - a_.x) / (b_.y - a_.y));
        m2  = -((c_.x - b_.x) / (c_.y - b_.y));
        mx1 = (a_.x + b_.x) / 2.0;
        mx2 = (b_.x + c_.x) / 2.0;
        my1 = (a_.y + b_.y) / 2.0;
        my2 = (b_.y + c_.y) / 2.0;
        xc  = (m1 * mx1 - m2 * mx2 + my2 - my1) / (m1 - m2);
        yc  = (y1y2 > y2y3) ? m1 * (xc - mx1) + my1 : m2 * (xc - mx2) + my2;
    }
    
    dx = b_.x - xc;
    dy = b_.y - yc;
    float radius = sqrt((float)(dx * dx + dy * dy));
    
    center.x = (float)xc;
    center.y = (float)yc;
    
    //radius as Z-axis parameter
    center.z = radius;
    
    return center;  
  
}

PVector[] shiftArray(PVector[] nodes_){
  
    PVector[] shiftedArray = new PVector[nodes_.length];
    
    //first is last
    for(int n = 0; n < nodes_.length - 1; n++){
       shiftedArray[n + 1] = nodes_[n];
    }
    shiftedArray[0] = nodes_[nodes_.length - 1];
  
    return shiftedArray;
    
}

PVector findIntersection(PVector[] lineA_, PVector[] lineB_){

    final double EPSILON = Math.ulp(1.0);
    
    float x12 = lineA_[0].x - lineA_[1].x;
    float x34 = lineB_[0].x - lineB_[1].x;
    float y12 = lineA_[0].y - lineA_[1].y;
    float y34 = lineB_[0].y - lineB_[1].y;
    
    float c = x12 * y34 - y12 * x34;
    
    if (abs(c) < EPSILON)
    {
      //lines are parallel
      return null;
    }
    else
    {
      float a = lineA_[0].x * lineA_[1].y - lineA_[0].y * lineA_[1].x;
      float b = lineB_[0].x * lineB_[1].y - lineB_[0].y * lineB_[1].x;
    
      float x = (a * x34 - b * x12) / c;
      float y = (a * y34 - b * y12) / c;
    
      return new PVector(x , y);
    } 
}

