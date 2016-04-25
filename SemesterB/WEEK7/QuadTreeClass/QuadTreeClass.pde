/*

QUADTREE [non-adaptive, with level limits]

Quite similar with KD Tree, but you are evaluating boundaries
and its distances to determine there the point is and the you 
are going through ancerstors.

MAX_LEVELS by default is 6, shiuld be updated manually at QuadTree class

getNeighboursByK()
getNeighboursByRadius()
getNeighboursByBoth()

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

static int NUM_AGENTS = 512;
static float RADIUS = 64.0;
static int K = 16;

Node n;
QuadTree q;

AgentList agents = new AgentList();

void setup() {
  
  size(500, 500, "processing.core.PGraphicsRetina2D");
  frameRate(30);
  
  for(int a = 0; a < NUM_AGENTS; a++){
    
      Agent newBorn = new Agent(random(width), random(height));  
      agents.add(newBorn);
      
  }
  
  //last agent as reference
  agents.get(agents.size() - 1).type = 1;
  agents.get(agents.size() - 1).velocity.mult(2);
  agents.get(agents.size() - 1).setRadius(RADIUS);
  
}

void draw() {
  
  background(255);
  
  n = new Node(0, 0, width, height);
  q = new QuadTree(n);
  
  //building QuadTree
  if (agents.size() > 0) {
    for (int a = 0; a < agents.size (); a++) {
      
      agents.get(a).update();
      agents.get(a).draw();
       
      QuadTree insect = q.getSmallestIntersect(agents.get(a));
      agents.get(a).setNode(insect);
      
      if (insect != null) {
      insect.divide();
        
      }
   
    }
  }
  
  //NEIGHBOURS BY GIVEN RADIUS
  
  //reference radius
  //stroke(255, 255, 0);
  //strokeWeight(1.0);
  //ellipseMode(CENTER);
  //ellipse(agents.get(agents.size() - 1).position.x, agents.get(agents.size() - 1).position.y, agents.get(agents.size() - 1).radius * 2, agents.get(agents.size() - 1).radius * 2);
  //if(agents.get(agents.size() - 1).parent != null) //agents.get(agents.size() - 1).parent.greenHighlight();
  
  //neighbours by radius
  //if(agents.get(agents.size() - 1).parent != null) agents.get(agents.size() - 1).parent.neighboursByRadius(agents.get(agents.size() - 1), RADIUS);
  
  //NEIGHBOURS BY GIVEN K [# OF NEIGHBOURS]
  if(agents.get(agents.size() - 1).parent != null) agents.get(agents.size() - 1).parent.neighboursByK(agents.get(agents.size() - 1), K);
  
  //VISUALIZE QUADTREE
  //q.draw();

}
