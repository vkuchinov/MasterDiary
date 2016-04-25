/*

DESCARTES' THEOREM

In geometry, Descartes' theorem states that for every four kissing, or mutually tangent, 
circles, the radii of the circles satisfy a certain quadratic equation. 

By solving this equation, one can construct a fourth circle tangent to three given, 
mutually tangent circles. The theorem is named after René Descartes, who stated 
it in 1643.

    k = ±1/r, curvatory
    
    +: outer circle
    -: inner circle
    
Descartes's Theorem is a formula that is useful for calculating the sizes of the circles in an Apollonian Gasket. 
If we define the curvatures (1/r) of any three circles as a, b, and c, respectively, the Theorem states that 
the curvature of the circle (or circles) tangent to all three, which we will define as d, is: 

       d = a + b + c ± 2 (sqrt (a × b + b × c + c × a ))


       Apply Descartes's Theorem to find the size of your next circles. 
       Let's stop drawing for a moment. Now that we have three circles in our Gasket, 
       we can use Descartes's Theorem to find the radius of the next circle we'll draw. 
       Remember that Descartes's Theorem is d = a + b + c ± 2 (sqrt (a × b + b × c + c × a )), 
       where a, b, and c are the curvatures of your three tangent circles and d is the curvature 
       of the circle tangent to all three. So, to find the radius of our next circle, let's find 
       the curvature of each of the circles we have so far so that we can find the curvature of 
       the next circle, then convert this to its radius.
       
       Let's define the radius of our outer circle as 1. Because the other circles are inside this one, 
       we're dealing with its interior curvature (rather than its exterior curvature), and, consequently, 
       we know its curvature is negative. - 1/r = -1/1 = -1. The big circle's curvature is -1.
       
       The smaller circles' radii are half as large as the big circle's, or, in other words, 1/2. 
       Since these circles are touching each other and the large circle with their outside edge, 
       we're dealing with their exterior curvature, so their curvatures are positive. 1/(1/2) = 2. 
       The smaller circles' curvatures are both 2.
       
       Now, we know that a = -1, b = 2, and c = 2 for our Descartes's Theorem equation. 
       Let's solve for d:
       
          d = a + b + c ± 2 (sqrt (a × b + b × c + c × a ))
          d = -1 + 2 + 2 ± 2 (sqrt (-1 × 2 + 2 × 2 + 2 × -1 ))
          d = -1 + 2 + 2 ± 2 (sqrt (-2 + 4 + -2 ))
          d = -1 + 2 + 2 ± 0
          d = -1 + 2 + 2
          d = 3. The curvature of our next circle is 3. Since 3 = 1/r, 
          the radius of our next circle is 1/3.
          
          D: diameter symmetry
          C: curvature symmetry
          

REFERENCES:
https://en.wikipedia.org/wiki/Descartes%27_theorem
http://stackoverflow.com/questions/22118029/recursively-create-apollonian-gaskets-with-solution
http://mathworld.wolfram.com/SoddyCircles.html
http://gogeometry.com/geometry/soddy_descartes_circles.htm

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

void setup(){
  
     size(600, 600, "processing.core.PGraphicsRetina2D");
     background(0);
    
     noFill();
     ellipseMode(CENTER);
    
     //circle1
     Circle c1 = new Circle(125.0, new PVector(360, 250)); 
     c1.draw(color(255));
     
     //cirlce2
     Circle c2 = new Circle(60, new PVector(175, 250));
     c2.draw(color(255));
     
     //circle3
     Circle c3 = new Circle(40, new PVector(221, 161));
     c3.draw(color(255));
     
     //outer circle
     Circle c4 = outerCircle(c1, c2, c3);
     c4.draw(color(255, 0, 255));
     
     //inner circle [second solution]
     Circle c5 = secondSolution(c4, c1, c2, c3);
     c5.draw(color(0, 255, 255));

}


Circle outerCircle(Circle c1_, Circle c2_, Circle c3_){
  
        float c1C, c2C, c3C, c4C, c4radius; 
        //set of complex numbers for calculation
        Complex z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11;
      
        //curvatures, shorten variable name
        c1C = c1_.curvature();
        c2C = c2_.curvature();
        c3C = c3_.curvature();
      
        c4C = c1C + c2C + c3C - 2 * (sqrt((c1C * c2C) + (c2C * c3C ) + (c1C * c3C)));
        c4radius = 1.0 / c4C; 
      
        z1 = new Complex(c1_.location.x, c1_.location.y);
        z2 = new Complex(c2_.location.x, c2_.location.y);
        z3 = new Complex(c3_.location.x, c3_.location.y);
      
        //z4 = z1 * c1C + z2 * c2C + z3 * c3C
        z4 =  z1.times(c1C).plus(z2.times(c2C)).plus(z3.times(c3C));
        //z5 = z1 * z2 * c1C * c2C
        z5 =  z1.times(z2).times(c1C * c2C);
      
        //z6 = z2 * z3 * c2C * c3C
        z6 =  z2.times(z3).times(c2C * c3C);
        //z7 = z1 * z3 * c1C * c3C
        z7 =  z1.times(z3).times(c1C * c3C);
      
        //z8 = z5 + z6 + z7;
        z8 = z5.plus(z6).plus(z7);
        //z9 = sqrt(z8) * -2
        z9 = z8.sqrt().times(-2);  
      
        //z10 = z4 + z9;
        z10 = z4.plus(z9);
        //z11 = z10 / c4C
        z11 = z10.divides(c4C);
      
        return new Circle(c4radius, new PVector((float)z11.re(), (float)z11.im()));
        
}
  
Circle secondSolution(Circle c0_, Circle c1_, Circle c2_, Circle c3_) {
  
  float c0C, c1C, c2C, c3C, cNew;
  Complex z0, z1, z2, z3, z4, z5, z6, z7, zNew;

  c0C = c0_.curvature();
  c1C = c1_.curvature();
  c2C = c2_.curvature();
  c3C = c3_.curvature();

  z0 = new Complex(c0_.location.x, c0_.location.y);
  z1 = new Complex(c1_.location.x, c1_.location.y);
  z2 = new Complex(c2_.location.x, c2_.location.y);
  z3 = new Complex(c3_.location.x, c3_.location.y);
 
 
  cNew = (2.0 * (c1C + c2C + c3C)) - c0C;

  //z4 = z1 * C1C + z2 * c2C + z3 * c3C
  z4 = z1.times(c1C).plus(z2.times(c2C)).plus(z3.times(c3C));
  z5 = z4.times(2.0);
  z6 = z0.times(c0C);
  z7 = z5.minus(z6);
  zNew = z7.divides(cNew);

  return new Circle(1.0 / cNew, new PVector((float)zNew.re(), (float)zNew.im()));
  
}


