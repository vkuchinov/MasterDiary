class Point
{
  float posX, posY;
  color voronoiColour;
  color manhattanColour;

  Point()
  {
    posX = random(width);
    posY = random(height);
    voronoiColour = color(random(255));
    manhattanColour = color(random(255));
    
  }

  void change()
  {
    posX = random(width);
    posY = random(height);
  }
}

