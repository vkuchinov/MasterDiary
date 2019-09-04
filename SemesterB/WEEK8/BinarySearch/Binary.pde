class Binary{
 
   float min, max, median;
  
   Binary(float min_, float max_) {  min = min_; max = max_; median = min + (max - min) / 2.0; } 
  
   float getMedian() { return median; }
   
   void left() { max = median; median = min + (max - min) / 2.0;}
   void right() { min = median; median = min + (max - min) / 2.0; }
   void info() { println(min, max, median); }
  
}
