class kNN{
  
  int skip = 20;

  kNN(){
    
  }
  
  void update(int k_){
    
    for(float y = 0; y < height; y += skip) {
      for(float x = 0; x < width; x += skip) {
        
        ObjectList neighbors = new ObjectList();
        
        for(int i = 0; i < data.size(); i++) {
          
           Object o = data.get(i);
           float d = dist(x, y, o.x, o.y);
  
           neighbors.add(new Object( d, o.category ));
           
        }
        
        Collections.sort(neighbors, new Comparator<Object>() {
        @Override
        public int compare(Object a_, Object b_) {
        return b_.d > a_.d ? -1 : (b_.d < a_.d) ? 1 : 0;
        }
        });
       
     
        HashMap<Integer, Integer> knn = new HashMap<Integer, Integer>();
        
        for (int i = 0; i < k_; i++) {
        
          Object nb = neighbors.get(i);
          if (knn.containsKey(nb.category)) { knn.put(nb.category, knn.get(nb.category) + 1 ); } else { knn.put(nb.category, 1); }
      
        }

        Integer[] options = knn.keySet().toArray(new Integer[knn.size()]);
        
        int record = 0;
        int cls = -1;
      
        for (int i = 0; i < options.length; i++) {
        
           int category = options[i];
           int total = knn.get(category);
        
           if (total > record) { record = total; cls = category; }
           
        }
 
        noStroke();
        fill(scheme[cls]);
        rect(x, y, size * 0.95, size * 0.95);
        
      }
    }
    
  }
  void draw(){
    
    rectMode(CORNER);
    
    for(int y = 0; y < height; y += skip){
      for(int x = 0; x < width; x += skip){
        
        noStroke();
        fill(128);
        rect(x, y, size * 0.9, size * 0.9);
        
      }
    }
    
  }

  
}
