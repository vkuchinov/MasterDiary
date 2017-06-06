/*

BI-DIRECTIONAL DIJKSTRA'S AGORITHM

REFERENCES:
https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
https://rosettacode.org/wiki/Dijkstra%27s_algorithma
https://en.wikipedia.org/wiki/Heuristic

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

import java.util.Random;

Random seed = new Random(12345);
PointList points = new PointList();

void setup(){
  
    size(600, 600, "processing.core.PGraphicsRetina2D");
    
    for(int i = 0; i < 128; i++){
    points.add(new PVector(50 + seed.nextInt(500), 50 + seed.nextInt(500)));
    }
    
    points.pickAB();
    points.draw();
  
}

class PointList extends ArrayList<PVector>{
 
     int a, b;
     void draw() { for(PVector p : this) { noFill(); stroke(0); strokeWeight(4); point(p.x, p.y);  this.highlightA(); this.highlightB(); } } 
     void pickAB() { a = seed.nextInt(this.size()); b = seed.nextInt(this.size()); }
     void highlightA() { stroke(255, 0, 255); strokeWeight(6); point(this.get(a).x, this.get(a).y); }
     void highlightB() { stroke(0, 255, 255); strokeWeight(6); point(this.get(b).x, this.get(b).y); }
     
}
