/*

Space Colonization 2D 

FURTHER READING:
http://algorithmicbotany.org/papers/colonization.egwnp2007.pdf
Xylem / Hyphae algorithms by Nervous Systems

ISSUES:

Attractos spread mathmeticaly equally withing circle, 
however visually centre looks condensed.

Hypothesis: to use Gaussian function to create visual gomogeneous
(uniform) field. 

TODO LIST

[-] Set of starting points [roots] – Roots, Bloody, Roots!
[-] Hypothesis: mix with Voronoi / Manhattan diagrams
[-] Growing speed of different roots, flexible direction
[-] Color inheritance
[-] L-System mix <> growth direction
[-] Lifetime

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

ArrayList segments = new ArrayList();
ArrayList attractors = new ArrayList();

int numAttractors = 10000;
int startTrunk = 1;

float growthDistance  = 4; //2.0;
float max_attract_dist = 16;
float min_attract_dist = 4;

boolean spaceEnd = false;

Segment root;

void setup(){
  
size(750, 750, "processing.core.PGraphicsRetina2D"); 
//smooth();
generatePoints();
//drawPoints();

//create root segments
for(int r = 0; r < 1; r++){
root = new Segment(new PVector(-250 + random(500) + width/2 ,-250 + random(500) + height/2), null);
segments.add(root);
}

//create initial trunk
for (int i = 1; i < startTrunk+1; i++) {
  Segment s = new Segment(
  new PVector(root.position.x, root.position.y -(i*growthDistance)), 
  (Segment) segments.get(segments.size()-1));
  segments.add(s);
}
  
println(segments.size());

}

void draw(){
  
  background(204);
  
  for (int i = segments.size()-1; i > 0; i--) {
    Segment s = (Segment) segments.get(i);
    s.draw();
  }
  
  if (!finished) {

    for (int ai = 0; ai < attractors.size(); ai++) {
      
      Attractor ap = (Attractor) attractors.get(ai);
      //then, compare it to all the segments, and find the direction and distance
      float leastDist = max_attract_dist;
      PVector closestDir = null;
      Segment closest = null;
      for (int si = 0; si < segments.size(); si++) {
        Segment s = (Segment) segments.get(si);
        PVector dir = PVector.sub(ap, s.position);
        float d = dir.mag();

        //if d > max_attract_dist then continue, we don't care about this one
        if (d > max_attract_dist) continue;
        //if d < min_attract_dist, then this branch has arrived, and this node is taken
        if (d < min_attract_dist) attractors.remove(ap);

        //keep track of the closest segment, and direction + distance to it
        if (closest == null || d <= leastDist) closest = s;
        if (closestDir == null || d <= leastDist) closestDir = dir;
        if (d <= leastDist) leastDist = d;
      }

      //now that we have the closest, tell it to grow towards us
      if (closest != null) {
        closest.grow_count++; //mark the segment for growth
        closestDir.normalize();
        closest.growDir.add(closestDir);
        //System.out.println(closest);
      }
    }

    //now we can iterate through each segment, and update it
    finished = true;
    int s_len = segments.size();
    for (int si = s_len-1; si > 0; si--) {
      Segment s = (Segment) segments.get(si);
      if (s.grow_count > 0) { //grow a new branch
        finished = false;
        s.growDir.div(s.grow_count);

        s.growDir.normalize();
       // s.growDir.limit(growth_distance);
        s.growDir.mult(growthDistance);
        PVector newBranchLoc = PVector.add(s.position, s.growDir);
        Segment newSegment = new Segment(newBranchLoc, s);
        segments.add(newSegment);

        s.growDir.set(0, 0, 0);
        s.grow_count = 0;
        s.area = 0;
      }
    }
  }
  
}

void generatePoints() {
  
  PVector volumeCenter = new PVector(width/2, height/2);
  float volumeRadius = 300;

  int numToGo = numAttractors;

  while(numToGo != 0) {
    
    /*
    
    Just under 70% of instances will tend to have a value one standard deviation either side of the average (in this case, values between -15 and 15: see highlighted area of graph)1;
    Just under 95% of instances will tend to have a value two standard deviations either side of the average (between -30 and 30 in this case);
    More than 99% of instances will tend to have a value three standard deviations either side of the average (between -45 and 45 in this case).
    
    40 - 45 gives more less good visual result in terms of uniform
    
    */
    
    float randRadius = map(randomGaussian()*15, 0, 42, 300, 0);
    float randAngle = random(360);
    
    PVector p = new PVector(
    (float) randRadius*sin(radians(randAngle)) + volumeCenter.x, 
    (float) randRadius*cos(radians(randAngle)) + volumeCenter.y, 
    (float) 0);
    
    if (PVector.dist(p, volumeCenter) < volumeRadius){
      attractors.add(new Attractor(p.x, p.y, p.z));
      numToGo--;
    }
  }
}

void drawPoints() {
  for(int p = 0; p < numAttractors; p++){
     Attractor a = (Attractor) attractors.get(p);
     a.draw();
  }
}
