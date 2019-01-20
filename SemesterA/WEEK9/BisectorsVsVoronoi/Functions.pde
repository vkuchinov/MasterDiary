void drawVoronoi() {

  for (int x = 0; x < voronoi.width; x++){
    for (int y = 0; y < voronoi.height; y++){
      
      float minDist = voronoi.width + voronoi.height;
      int closest = 0;

      for (int n = 0; n < nodes.size(); n++){
        
        PVector defPoint = nodes.get(n);
        
        //Eucledean distance sqrt((x1 - x2)^2 + (y1 - y2)^2)
        float dist = dist(x, y, defPoint.x, defPoint.y);
        if (dist<minDist)
        {
          closest = n;
          minDist = dist;
        }
      }
      voronoi.pixels[y * voronoi.width + x] = color(colors.get(closest));
    }
  }
  voronoi.updatePixels();
}

