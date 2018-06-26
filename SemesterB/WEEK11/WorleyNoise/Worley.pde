class Worley{
  
   ArrayList<Point> points = new ArrayList<Point>();
   int seed;
   
   Worley(int num_, Random seed_){
    
    seed = seed_.nextInt(2560);
    
    for(int i = 0; i < num_; i++) {
      
        float x = sin(i + 1) * seed;
        float y = cos(i + 1) * seed;
        points.add(new Point(x - floor(x), y - floor(y)));

    }
    
   } 

   void addPoint(float x_, float y_) { points.add(new Point(x_, y_)); }
   
   float getEuclidean (float x_, float y_, int k_) {
    return sqrt(calculateValue(x_, y_, k_));
   };
   
   float calculateValue (float x_, float y_, int k_) {
     
    float minDist = Float.POSITIVE_INFINITY, dist;
    int minIdx = 0;

    for(int i = 0; i < points.size(); i++) { points.get(i).selected = false; }

    for(int j = 0; j < k_; j++) {

        for(int i = 0; i < points.size(); i++) {
          
            dist = euclidean(x_ - points.get(i).x, y_ - points.get(i).y);
            //dist = manhattan(x_ - points.get(i).x, y_ - points.get(i).y);

            if (dist < minDist && !points.get(i).selected) {
                minDist = dist;
                minIdx = i;
            }
        }

        points.get(minIdx).selected = true;
        
    }

    return minDist;
    
   };
 
   float[] getMap(int resolution_){
     
      float step = 1.0 / (resolution_ - 1);
      float map[] = new float[resolution_ * resolution_];

    for (int y = 0; y < resolution_; y++) {
        for (int x = 0; x < resolution_; ++x) {
          
            float e = sqrt(calculateValue(x * step, y * step, 1));
            map[y * resolution_ + x] = e;
        }
    }

    return map;

   }
   
   float[] getNormalizedMap(int resolution_) {
     
        float map[] = getMap(resolution_);
        float min = Float.POSITIVE_INFINITY;
        float max = Float.NEGATIVE_INFINITY;
        float scale;

  
    for (int i = 0; i < map.length; i++) {
        min = min(min, map[i]);
        max = max(max, map[i]);
    }
  
    scale = 1.0 / (max - min);
  
    for (int i = 0; i < map.length; i++) {
        map[i] = (map[i] - min) * scale;
    }
  
    return map;
    
  };

   float euclidean(float dx_, float dy_) { return dx_ * dx_ + dy_ * dy_; }
   float manhattan(float dx_, float dy_) { return abs(dx_) + abs(dy_); }
}

class Point extends PVector{
   
   boolean selected;
   Point(float x_, float y_){ x = x_; y = y_; }
  
}
