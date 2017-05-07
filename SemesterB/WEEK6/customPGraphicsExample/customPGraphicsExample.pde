/*

CUSTOM PGRAPHICS 
[extending PGraphics, actually PGraphics2D from JAVA)

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import processing.core.PApplet;
import processing.core.PGraphicsJava2D;

customPGraphics cg;

void setup() {

  size(641, 641, "processing.core.PGraphicsRetina2D");
  background(240);

  cg = new customPGraphics(this, width, height, 16, 2);
  image(cg, 0, 0);
}

class customPGraphics extends PGraphicsJava2D {

  final PApplet p;
  PVector cluster;

  customPGraphics(PApplet pa, int width_, int height_, int dims_, int offset_) {

    setParent(p = pa);
    setSize(width_, height_);
    cluster = new PVector(width_ / (dims_ + offset_ * 2 ), height_ / (dims_ + offset_ * 2 ));

    beginDraw();
    background(0, 255, 255);
    
    for (int i = 0; i <= dims_; i++) {

      line(cluster.x * (i + offset_), offset_ * cluster.y, cluster.x * (i + offset_), height_ - offset_ * cluster.y - 1);

          for (int j = 0; j <= dims_; j++) {
    
            line(offset_ * cluster.x, cluster.y * (j + offset_), width_ - offset_ * cluster.x - 1, cluster.y * (j + offset_));
            
          }
    }

    endDraw();
  }
}

