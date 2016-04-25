/*

 Symmetrical Adjacency Patterns Mark IV
 by Vladimir V. Kuchinov
 
 There are only angles! 
 
 [o] negbours to IntList
 [o] shift neighbours instead of children
 
 
 */

import java.util.Random;
import java.util.Collections;

Random seed = new Random(99);

static int MAX_LEVELS = 18;
ArrayList<AdjacencyMatrix> levels = new ArrayList();

void setup() {

  size(800, 800, "processing.core.PGraphicsRetina2D");  

  //maximal levels, initial # of nodes, node increment
  //level 0
  for (int l = 0; l < MAX_LEVELS; l++) {
    if (l == 0) { 
      levels.add(new AdjacencyMatrix(l, 8));
    } else
    { 
      println("LEVEL:", l);
      int rand = 4 + seed.nextInt(16);
      levels.add(new AdjacencyMatrix(l, levels.get(levels.size()-1).children.size() + rand, (AdjacencyMatrix)levels.get(l - 1)));
    }
  }
  
 float a_inc = 0.0;
  
  for (int a = 0; a < levels.size (); a++) {
     levels.get(a).shiftMatrix(a_inc); 
     //levels.get(a).shiftByID((int)a_inc); 
     a_inc += 0.0;
  }
  //reflectMatrix(levels);
  
}

void draw() {

  background(0);
  translate(width/2, height/2);

  float parentRad = 0.0;
  float rad = 40.0;
  
  float aaa = 0.0; 
  
  for (int a = 0; a < levels.size (); a++) {

    pushMatrix();
    rotate(radians(aaa));
    
    for (int n = 0; n < levels.get (a).children.size(); n++) {
      if (levels.get(a).children.get(n).state) { 
        float x = sin(radians(levels.get(a).children.get(n).angle))*rad;
        float y = cos(radians(levels.get(a).children.get(n).angle))*rad;

        colorMode(HSB);
        //noStroke();
        stroke(map(a, 0, MAX_LEVELS, 0, 255), 240, 240);
        //ellipseMode(CENTER);
        //ellipse(x, y, 20, 20);
        strokeWeight(3.0);
        point(x, y);

        if (levels.get(a).children.get(n).neighbours != null) {
          //println(n, levels.get(a).children[n].neighbours[0]);
          for (int c = 0; c < levels.get(a).children.get(n).neighbours.length; c++) {
            strokeWeight(1.0);

            //levels.get(a-1).children[levels.get(a).children[n].neighbours[c]].angle)
            float  x2 = sin(radians(levels.get(a - 1).children.get(levels.get(a).children.get(n).neighbours[c]).angle))*parentRad;
            float  y2 = cos(radians(levels.get(a - 1).children.get(levels.get(a).children.get(n).neighbours[c]).angle))*parentRad;
            line(x, y, x2, y2);
          }
        }
      } else {

        float x = sin(radians(levels.get(a).children.get(n).angle))*rad;
        float y = cos(radians(levels.get(a).children.get(n).angle))*rad;

        stroke(255);
        strokeWeight(1.0);
        point(x, y);
      }
    }

    parentRad = rad;
    rad += 20.0;
    //aaa += 9.0;
    popMatrix();
    
  }
  
  parentRad = 0.0;
  rad = 40.0;
  aaa = 0.0;

  for (int a = 0; a < levels.size (); a++) {

    pushMatrix();
    rotate(radians(aaa));
    for (int n = 0; n < levels.get (a).children.size(); n++) {
      if (levels.get(a).children.get(n).state) { 
        float x = sin(radians(180.0 + levels.get(a).children.get(n).angle))*rad;
        float y = cos(radians(180.0 + levels.get(a).children.get(n).angle))*rad;

        colorMode(HSB);
        //noStroke();
        stroke(map(a, 0, MAX_LEVELS, 0, 255), 240, 240);
        //ellipseMode(CENTER);
        //ellipse(x, y, 20, 20);
        strokeWeight(3.0);
        point(x, y);

        if (levels.get(a).children.get(n).neighbours != null) {
          //println(n, levels.get(a).children[n].neighbours[0]);
          for (int c = 0; c < levels.get (a).children.get(n).neighbours.length; c++) {
            strokeWeight(1.0);

            //levels.get(a-1).children[levels.get(a).children[n].neighbours[c]].angle)
            float  x2 = sin(radians(180.0 + levels.get(a - 1).children.get(levels.get(a).children.get(n).neighbours[c]).angle))*parentRad;
            float  y2 = cos(radians(180.0 + levels.get(a - 1).children.get(levels.get(a).children.get(n).neighbours[c]).angle))*parentRad;
            line(x, y, x2, y2);
          }
        }
      } else {

        float x = sin(radians(180.0 + levels.get(a).children.get(n).angle))*rad;
        float y = cos(radians(180.0 + levels.get(a).children.get(n).angle))*rad;

        stroke(255);
        strokeWeight(1.0);
        point(x, y);
      }
    }

    parentRad = rad;
    rad += 20.0;
    //aaa += 9.0;
    popMatrix();
  }
  
  noLoop();
}

void reflectMatrix(ArrayList levels_){
  
    ArrayList<AdjacencyMatrix> updatedLevels = new ArrayList();
    
    for(int l = 0; l < levels_.size(); l++){
      
    //AdjacencyMatrix updated = (AdjacencyMatrix)levels_.get(l).reflect();
      
    }
}
