class RedBlack extends ArrayList<Node>{
  
    Node root;
    
    RedBlack(Node root_){ root = root_; }
    
    Node RedBlackFirst(Node node_){
      
         while (node_.L != null) { node_ = node_.L; };
         return node_;
      
    }
    void insert(Node after_, Node node_){
      
         Node P, GP, U;
         
         if(after_ != null){
           
              node_.P = after_; 
              node_.N = after_.N;
              if(after_.N != null) { after_.N.P = node_; }
              after_.N = node_;
              if(after_.R != null) { after_ = after_.R; while(after_.L != null) { after_ = after_.L; } after_.L = node_; }
              else{ after_.R = node_; }
              
              P = after_;
           
         }
         else if(root != null){
           
              after_ = RedBlackFirst(root);
              node_.P = null;
              node_.N = after_;
              after_.P = after_.L = node_;
              P = after_;
           
         }
         else{
          
              node_.P = node_.N = null;
              root = node_;
              P = null; 
           
         }
         
         node_.L = node_.R = null;
         node_.U = P;
         node_.C = true;
         after_ = node_;
         
         while(P != null && P.C != null){
           
             GP = P.U;
             
             if(P == GP.L){
               
                 U = GP.R;
                 if(U != null && U.C != null) { P.C = U.C = false; GP.C = true; after_ = GP; }
                 else{
                   
                      if(after_ == P.R){ RedBlackRotateLeft(P); after_ = P; P = after_.U; }
                      P.C = false;
                      GP.C = true;
                      RedBlackRotateRight(GP);
                   
                 }

             }
             else{
               
                  U = GP.L;
                  if(U != null && U.C != null){ P.C = U.C = false; GP.C = true; after_ = GP; }
                  else{
                    
                       if(after_ == P.L){ RedBlackRotateRight(P); after_ = P; P = after_.U; }
                       P.C = false;
                       GP.C = false;
                       RedBlackRotateLeft(GP);
                    
                  }
               
             }
           
             P = after_.U;
           
         }

         root.C = false;
         
    }
    
    void RedBlackRotateLeft(Node node_){
      
        Node p = node_, q = node_.R, P = node_.U;
        
        if (P != null) {
    
             if (P.L == p) {  P.L = q; } else { P.R = q; }
         } 
         
        else { root = q; }
         
        q.U = P;
        p.U = q;
        p.R = q.L;
        if (p.R != null) { p.R.U = p; } 
        q.L = p;

    }
    
    void RedBlackRotateRight(Node node_){
      
        Node p = node_, q = node_.L, P = node_.U;
        
        if (P != null) {
    
             if (P.L == p) {  P.L = q; } else { P.R = q; }
         } 
         
        else { root = q; }
         
        q.U = P;
        p.U = q;
        p.L = q.R;
        if (p.L != null) { p.L.U = p; } 
        q.R = p;

    }

}

class Node{
  
   Node U, L, R, P, N; //parent, left, right, previous, next
   Boolean C;          //color f:black, t: red
   int value;          //could be anything
  
   Node(int value_){  value = value_; } 
 
}
