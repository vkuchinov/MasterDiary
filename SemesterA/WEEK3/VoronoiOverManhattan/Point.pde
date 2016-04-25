/*

VORONOI SWATCHES:
color(150, 45, 62), color(52, 54, 66), color(151, 156, 156)
color(242, 235, 199), color(52, 136, 153)

MANHATTAN SWATCHES:
color(16, 91, 99), color(255, 250, 213), color(255, 211,78)
color(219, 158, 54), color(189, 73, 50)

*/

color[] vcolors = { color(150, 45, 62), color(52, 54, 66), color(151, 156, 156),
                    color(242, 235, 199), color(52, 136, 153) };
 
color[] mcolors = { color(16, 91, 99), color(255, 250, 213), color(255, 211,78),
                    color(219, 158, 54), color(189, 73, 50) };
                    
class Point
{
  float posX, posY;
  color itsColour;
  int type = -1; //-1: voronoi, 1: manhattan
  Point(float type_)
  {
    if(type_ > 0.5) type *= -1;
    
    posX = random(width);
    posY = random(height);
    
    colorMode(RGB);
    if(type == -1){
    itsColour = vcolors[(int)random(5)]; 
    }
    else{
    itsColour = mcolors[(int)random(5)]; 
    }
    
  }

  void change()
  {
    posX = random(width);
    posY = random(height);
  }
}

