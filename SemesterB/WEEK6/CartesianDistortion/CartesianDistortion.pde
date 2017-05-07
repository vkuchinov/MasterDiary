/*

CARTESIAN DISTORTION

REFERENCES:
https://en.wikipedia.org/wiki/Map_projection
https://embedded.eecs.berkeley.edu/Alumni/awrixon/route/graph/distort/CartesianDistortion.java
http://codepen.io/anon/pen/umArH


@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

Cartesian x, y;
Range r = new Range(10, 600, 32);

void setup(){
 
     size(600, 600, "processing.core.PGraphicsRetina2D"); 

     x = new Cartesian(5, new float[]{0, width});
     y = new Cartesian(8, new float[]{0, height});
     
}

void draw(){
 
     background(240);
     
     x.focus(mouseX);
     y.focus(mouseY);
    
     println(r.size());
     for(int i = 0; i < r.size(); i++){

       line(x.set(r.get(i)), 0, x.set(r.get(i)), height);
       line(0, y.set(r.get(i)), width, y.set(r.get(i)));
       
     }
  
}

