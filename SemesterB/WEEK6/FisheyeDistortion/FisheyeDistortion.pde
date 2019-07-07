/*

FISHEYE DISTORTION


REFERENCES:
https://en.wikipedia.org/wiki/Distortion_(optics)

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Fisheye distortion;

customPGraphics grid;


PVector offset;

int lsize = 641 / 2, lsize2 = lsize * lsize;
float mag = 12.0f;
float k = -0.00016f;int border, borderViaLens;

public void setup() {
  
  size(641, 641, "processing.core.PGraphicsRetina2D");
  background(255);
  
  grid = new customPGraphics(this, width, height, 16, 2);
  distortion = new Fisheye(width / 2, 3.0);

  offset = new PVector((width - grid.width) / 2, (height - grid.height) / 2);
  
  image(grid, 0, 0);
}

public void draw() {
  
  background(255);
  image(grid, 0, 0);
  
  distortion.showDistortion(mouseX, mouseY);
  image(distortion.outcome, 0, 0, width, height);
  
}

