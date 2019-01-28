class Node{
  
 final int MAX_LIFE = 6;
 int id;
 PVector location;
 int[] neighbours;
 boolean alive = false;
 
 int lifetime = MAX_LIFE;
 int tint;
 
 Node(int id_, float x_, float y_){
  
   id = id_;
   location = new PVector(x_, y_);
   
   tint = (int)random(255);
  
 } 
 
 void update(){
   
 //classical Conway's GoL rules
 int check = 0;
 for(int n = 0; n < 8; n++){
    if(nodes.get(neighbours[n]).alive) check++; 
 }
 if(check > 1 && check < 3 && lifetime > 0) { if(this.alive) {lifetime--; } else { lifetime = MAX_LIFE; } this.alive = true; } else { this.alive = false; }
   
 }
 
 void setNeighbours(){
   
   HashMap<Integer, Float> distances = new HashMap<Integer, Float>();
   
   for(int n = 0; n < NUM_CELLS; n++){
     if(n != id) { distances.put(nodes.get(n).id, this.location.dist(nodes.get(n).location)); }
  }
  
  neighbours = sortByValue(distances, 8);
   
 }
 
 void draw(){
  
  if(alive){
    //stroke(255);
    //strokeWeight(3);
    noStroke();
    ellipseMode(CENTER);
     fill(255, 8); 
    ellipse(location.x, location.y, 64, 64);
    fill(255, 16); 
    ellipse(location.x, location.y, 32, 32);
    fill(255, 64);
    ellipse(location.x, location.y, 18, 18); 
    
      for(int n = 0; n < 8; n++){
      
        if(nodes.get(neighbours[n]).alive){
          
          PVector middle = new PVector(this.location.x, this.location.y);
          //colorMode(HSB);
          //fill(tint, 240, 240, 128);
          ellipse(middle.x, middle.y, 4, 4);
          //colorMode(RGB);
          fill(255, 32);
          middle.lerp(nodes.get(neighbours[n]).location, 0.5);
          ellipse(middle.x, middle.y, 8, 8);
          
        }
        
      }
      
    
  } 
 }
  
}

   private static int[] sortByValue(HashMap<Integer, Float> unsortMap, int val_)
    {

        List<Entry<Integer, Float>> list = new LinkedList<Entry<Integer, Float>>(unsortMap.entrySet());

        Collections.sort(list, new Comparator<Entry<Integer, Float>>()
        {
            public int compare(Entry<Integer, Float> o1, Entry<Integer, Float> o2)
            { return o1.getValue().compareTo(o2.getValue()); }
        });

        int[] sorted = new int[val_];
        int count = 0;
        
        for (Entry<Integer, Float> entry : list)
        {
            if(count < val_) { sorted[count] = entry.getKey(); } count++;
        }

        return sorted;
    }
