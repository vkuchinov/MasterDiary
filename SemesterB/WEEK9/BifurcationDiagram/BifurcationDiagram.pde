/*

BIFURCATION DIAGRAM

In mathematics, particularly in dynamical systems, a bifurcation diagram shows 
the values visited or approached asymptotically (fixed points, periodic orbits, 
or chaotic attractors) of a system as a function of a bifurcation parameter 
in the system. It is usual to represent stable values with a solid line and 
unstable values with a dotted line, although often the unstable points are omitted. 
Bifurcation diagrams enable the visualization of bifurcation theory.

REFERENCES:
https://en.wikipedia.org/wiki/Bifurcation_diagram
https://en.wikipedia.org/wiki/Logistic_map
https://en.wikipedia.org/wiki/Pitchfork_bifurcation
https://en.wikipedia.org/wiki/Arnold_tongue
https://en.wikipedia.org/wiki/Standard_map

https://en.wikipedia.org/wiki/List_of_chaotic_maps
http://www.sgtnd.narod.ru/science/noise/1noise/eng/1noise.htm

*/

//float r = 2.4;

void setup(){
  
   float prev = 0.01;
   translate(0, height/2);
   size(750, 750, "processing.core.PGraphicsRetina2D");
   
   for(float r = 2.4; r < 4.0; r += 0.000001){
    
    strokeWeight(0.5);
    float y = r * prev * ( 1.0 - prev);
    point(map(r, 2.4, 4.0, 50, 700), map(y, 0.0, 1.0, 300, -300));
    prev = y;

   }
  
}


