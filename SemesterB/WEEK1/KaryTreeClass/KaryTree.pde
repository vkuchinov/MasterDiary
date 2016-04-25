class KaryTree{
  
   int level, K, maxK;
   KaryTree[] children;
   
   ArrayList<Node> nodes = new ArrayList<Node>();
   
   int counter;
   
   KaryTree(int k_, int levels_){ 
  
      K = k_;
      level = 0;
      counter = 0;

      nodes.add(new Node(counter, null));
      
      children = new KaryTree[K];
      
      for(int k = 0; k < K; k++){
          
          children[k] = new KaryTree(K, level + 1, levels_ , counter, this);
          counter++;
      }

   }
   
   KaryTree(int k_, int level_, int levels_, int counter_, KaryTree parent_){ 
     
      K = k_;
      level = level_;
      
      int counter = counter_;

      nodes.add(new Node(counter, parent_));
      
      if(level < levels_){
      
      children = new KaryTree[K];
      
          for(int k = 0; k < K; k++){
              children[k] = new KaryTree(K, level + 1, levels_, counter, this);
              counter++;
          }
      }
 
   }
   
   KaryTree(int k_, int levels_, Random seed_){ 
  
        
      maxK = k_;
      K = k_;
      level = 0;
      counter = 0;

      nodes.add(new Node(counter, null));
      
      children = new KaryTree[K];
      
      for(int k = 0; k < K; k++){
          
          children[k] = new KaryTree(maxK, seed_.nextInt(maxK), level + 1, levels_ , counter, this, seed_);
          counter++;
      }

   }
   
   KaryTree(int maxK_, int k_, int level_, int levels_, int counter_, KaryTree parent_, Random seed_){ 
  
      maxK = maxK_;
      K = k_;
      level = level_;
      
      int counter = counter_;

      nodes.add(new Node(counter, parent_));
      
      if(level < levels_){
      children = new KaryTree[K];
      
          for(int k = 0; k < K; k++){
              children[k] = new KaryTree(maxK, seed_.nextInt(maxK), level + 1, levels_, counter, this, seed_);
              counter++;
          }
      }
 
   }
   
   void radialDrawing(PVector position_, float radius_, float inc_, float angle_){
     
     //have to do an extra procedure to increase distance for farest nodes in Random mode,
     //they are to close to each other. Should be like http://i.stack.imgur.com/nSehS.png
     //TO DO some research on it.
     
     //wrong, it's just for this node and its children,
     //but I need to count everything on this level...
     
     int sumOfK = 0;
     if(children != null){ 
           for(int k = 0; k < K; k++){
               sumOfK += children[k].K;
           }
     }
     
     //levels = radius
     stroke(#F5009F);
     strokeWeight(4.0);
     point(position_.x, position_.y);
     
     if(children != null){ 
       
           PVector[] childrenPosition = new PVector[K];
           float maxNodes = pow(maxK, level + 1);
           println(maxK, sumOfK);
       
           for(int k = 0; k < K; k++){
             
               float angle = angle_ + radians(360.0/maxNodes*k - (30.0*(K + 1))/maxNodes*K);
               float xk = sin(angle) * radius_;
               float yk = cos(angle) * radius_;
               childrenPosition[k] = new PVector(xk, yk);
               children[k].radialDrawing(childrenPosition[k], radius_ + inc_, inc_ , angle); 
               strokeWeight(1.0);
               line(position_.x, position_.y, childrenPosition[k].x, childrenPosition[k].y);
           }
     }
     
   }
   
   
}
class Node extends PVector{
  
    int id;
    Node parent;
    
    Node(int id_, KaryTree parent_){ 
      
  
    }
    
}
