class Point
{
  float posX, posY;
  color voronoiColour;

  Point()
  {
    posX = random(width);
    posY = random(height);
    voronoiColour = color(0 + random(256), 240, 240);
    
  }
  
  Point(float x_, float y_)
  {
    posX = x_;
    posY = y_;
    voronoiColour = color(0 + random(256), 240, 240);
    
  }

  void change()
  {
    posX = random(width);
    posY = random(height);
  }
}

