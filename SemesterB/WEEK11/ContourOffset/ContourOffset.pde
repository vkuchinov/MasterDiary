/*

CONTOUR OFFSET 
simple algorithm, based on centroid

Complex shapes should use skeleton algorithm
https://reference.wolfram.com/language/ref/SkeletonTransform.html
https://reference.wolfram.com/language/ref/Skeleton.html
https://en.wikipedia.org/wiki/Topological_skeleton
https://en.wikipedia.org/wiki/Straight_skeleton
https://en.wikipedia.org/wiki/Beta_skeleton
http://www.inf.u-szeged.hu/~palagyi/skel/skel.html
http://polyskeleton.appspot.com/

From its closest point I guess, instead of centroid

or Medial Axis Transform

http://homepages.inf.ed.ac.uk/rbf/HIPR2/skeleton.htm

also research on Grassfire Transform

https://en.wikipedia.org/wiki/Grassfire_transform

@author    Vladimir V. KUCHINOV
@email     helloworld@vkuchinov.co.uk

*/

Polygon poly;

void setup(){
  
     size(600, 600, "processing.core.PGraphicsRetina2D"); 
     poly = new Polygon();
     
}

void draw() {
  
  background(240);
  //0.9 closest to the centre, 0.0: no offset
  poly.displayOffsets(new float[]{0.9, 0.8, 0.75, 0.5, 0.4, 0.2, 0.0});

}

void keyPressed() {

  if (key == ' ') {
    
      poly.clear();
    
  } 

}

void mousePressed() {
  
      PVector mouse = new PVector(mouseX, mouseY);
      poly.addVertex(mouse);
  
}
