/*

CONTOURS [based on Marching Squares 2D]

is a computer graphics algorithm that generates contours for 
a two-dimensional scalar field (rectangular array of individual 
numerical values). A similar method can be used to contour 
2D triangle meshes.

The contours can be of two kinds:

Isolines - lines following a single data level, or isovalue.
Isobands - filled areas between isolines.

Typical applications include the Contour lines on topographic maps or 
the generation of isobars for weather maps.

    ALGORITHM:
    
    ⦿ Process each cell in the grid independently.
    ⦿ Calculate a cell index using comparisons of the contour level(s) with 
      the data values at the cell corners.
    ⦿ Use a pre-built lookup table, keyed on the cell index, to describe the output 
      geometry for the cell.
    ⦿ Apply linear interpolation along the boundaries of the cell to calculate 
      the exact contour position.
      
      
    KEYS:
   
    c | C: contorus on/off
    s | S: stroke mode on/off
    l | L: labels on/off
        +: increase resolution
        -: decrease resolution
        

REFERENCES:
https://en.wikipedia.org/wiki/Marching_squares
http://www.tomgibara.com/computer-vision/marching-squares

@author     Vladimir V. KUCHINOV
@email      helloworld@vkuchinov.co.uk

*/

Grid grid;

void setup(){
  
   size(800, 800, "processing.core.PGraphicsRetina2D"); 
   background(220);
   
   grid = new Grid(new int[]{50, 750}, new int[]{50, 750}, 16);

}

void draw(){
  
     grid.update();
     grid.draw();
  
}

void keyPressed(){
 
     grid.keyPressed();
     
}
