class Point
{
  
    float posX, posY;
    color itsColour;
    
    Point()
    {
        posX = random(width);
        posY = random(height);
        colorMode(HSB);
        itsColour = color(random(0, 64), 255, 255);
    }
    
    void change()
    {
        posX = random(width);
        posY = random(height);
    }
    
}
