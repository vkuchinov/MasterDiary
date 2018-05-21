class Point
{
  float posX, posY;
  color voronoiColour;

  Point()
  {
    posX = random(width);
    posY = random(height);
    voronoiColour = color(128 + random(128));
    
  }

  void change()
  {
    posX = random(width);
    posY = random(height);
  }
}

