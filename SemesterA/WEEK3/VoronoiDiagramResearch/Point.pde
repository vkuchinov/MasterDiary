class Point
{
  float posX, posY;
  color voronoiColour;

  Point()
  {
    posX = random(width);
    posY = random(height);
    voronoiColour = color(0 + random(256));
    
  }
  
  Point(float x_, float y_, int i_, int n_)
  {

    posX = x_;
    posY = y_;
    voronoiColour = color(0.0 + 256.0/n_ * i_);
    
  }
  
  void change()
  {
    posX = random(width);
    posY = random(height);
  }
}

