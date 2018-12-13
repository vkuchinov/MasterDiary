/*

CURL NOISE [curly noise divergence]
based on Green’s Theorem that uses the divergence is given by

In vector calculus, the curl is a vector operator that describes the infinitesimal 
rotation of a vector field in three-dimensional Euclidean space. 

At every point in the field, the curl of that point is represented by a vector. 

The attributes of this vector (length and direction) characterize the rotation at 
that point.

→   →      →      → 
F = P(i) + Q(i) + R(k)

           →          →          →
∇ = ∂ / ∂x i + ∂ / ∂y i + ∂ / ∂z k

 
REFERENCES:
https://en.wikipedia.org/wiki/Curl_(mathematics)
http://tutorial.math.lamar.edu/Classes/CalcIII/CurlDivergence.aspx

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

int N = 1024;
Curl noise;

void setup(){
 
   size(512, 512);
   background(0); 
   noise = new Curl(N);
  
}

void draw(){
 
   //background(0);
   fill(0, 0, 0, 1);
   noStroke();
   rect(0, 0, width, height);
   colorMode(HSB); 
   
   noise.draw();
  
}
