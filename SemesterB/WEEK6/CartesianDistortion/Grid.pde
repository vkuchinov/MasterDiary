import processing.core.PApplet;
import processing.core.PGraphicsJava2D;

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

