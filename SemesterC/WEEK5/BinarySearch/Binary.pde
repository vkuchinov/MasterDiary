class Binary{
  
   Binary(){ } 
  
   //recursive
   int processFromTo(int[] array_, int l_, int r_, int x_) 
    { 
        if (r_ >= l_) 
        { 
            int mid = l_ + (r_ - l_)/2; 
 
            if (array_[mid] == x_) 
               return mid; 

            if (array_[mid] > x_) 
               return processFromTo(array_, l_, mid - 1, x_); 

            return processFromTo(array_, mid + 1, r_, x_); 
            
        } 

        return -1; 
    } 
    
    //iterative
    int processEverything(int[] array_, int x_) 
    { 
        int l = 0, r = array_.length - 1; 
        
        while (l <= r) 
        { 
            int mid = l + (r - l) / 2; 

            if (array_[mid] == x_) return mid; 

            if (array_[mid] < x_)  l = mid + 1; 

            else r = mid - 1; 
            
        } 

        return -1; 
    } 
    
}
