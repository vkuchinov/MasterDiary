/*

MRACHING TRIANGLES
'What if... replace squares with triangles'

n computer graphics, the problem of transforming a cloud of points 
on the surface of a three-dimensional object into a polygon mesh for 
the object can be solved by a technique called 'marching triangles. 
This provides a faster alternative to other methods for the same 
problem of surface reconstruction, based on Delaunay triangulation.


    ALGORITHM:
    
    ⦿ Process each cell in the grid independently.
    ⦿ Calculate a cell index using comparisons of the contour level(s) with 
      the data values at the cell corners.
    ⦿ Use a pre-built lookup table, keyed on the cell index, to describe the output 
      geometry for the cell.
    ⦿ Apply linear interpolation along the boundaries of the cell to calculate 
      the exact contour position.

REFERENCES:
https://en.wikipedia.org/wiki/Marching_triangles

@author     Vladimir V. KUCHINOV
@email      helloworld@vkuchinov.co.uk

*/

Triangular grid;

void setup(){
  
   size(800, 750, "processing.core.PGraphicsRetina2D"); 
   background(64);
   
   grid = new Triangular(new int[]{50, 750}, new int[]{50, 750}, 10);

}

void draw(){

     grid.update();
     grid.draw();
  
}

void keyPressed(){
 
     grid.keyPressed();
     redraw();
     
}
