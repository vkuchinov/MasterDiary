/*

RESEARCH INTO COMPLEX NUMBERS [√-1]

'This miracle of analysis, this marvel of the world of ideas, an almost amphibian object between Being and Non-being 
that we call the imaginary number." — Leibniz, Gottfried

The sum of two pairs (a, b) & (c, d) is a pair where first number is (a+c), the other — (b+d), in other words,
(a, b) + (c, d)  = ( a + c, b + d)

The product of two pairs (a, b) & (c, d) is a pair there first number is a*c - b*d, the other — a*d + b*c, so
(a, b) * (c, d) = (a*c = b*d, a*d + b*c)

The range of pairs of all available pairs, which fit aforementioned rules, are 'the range of complex numbers', 
where each pair is a 'complex number'.

Complex number (a, 0) = a;

(0, 1) = i
( a + c, b + d) = (b * 0 - 0 * 1; b * 1 + 0 * 0) = (0, b), so

b * i = (0, b)

(a, b) = (a;0) + (0; b)

(a; b) = a + b * i //where i is an imaginary number

a = Re(a + bi), b + Im(a + bi)

i² = (0;1) * (0;1) = (0*0 - 1*1; 0*1 + 1*0) = (-1; 0) = -1;
i³ = ... = 1;
i⁴ = ... = 1;

i = √-1 

a - b * i is a conjucated complex number to z = a + b * i and usually looks like
_
Z
    _              _ 
Z + Z = 2 * a, Z * Z = a² + b²

The difference of two two complex numbers u - v, where u = a + b*i, v = c + d * i is
z = x + y * i, which sum with v guves u, so z + v = u or x = a - c, y = b - d

The partial u/v (with v != 0) z * v = u or z(c + d *i) = a + b*i

a = r * cosϕ,  b = r * sinϕ;
ϕ is an argument Arg(z), r – a modulus |z|

Arg(z) could be any angle + 2 * PI (360 degrees)
arg(z) is and angle withing ( 0, 2 * PI) or ( -PI, PI)

cosϕ = a/r = a / √(a² + b²), sinϕ = b/r = b/ √(a² + b²),

in trigonometric:

Z₁ =  r₁ * (cosϕ₁ + i * sinϕ₁), Z₂ =  r₂ * (cosϕ₂ + i * sinϕ₂)

The product of Z₁ by Z₂ = r₁ * r₂ [ cos(ϕ₁ + ϕ₂) + i * sin(ϕ₁ + ϕ₂) ] or

Z₁ by Z₂ = |Z₁|*|Z₂| & ϕ₁ + ϕ₂

The partial of Z₁ by Z₂ is r₁ / r₂ [ cos(ϕ₁ - ϕ₂) + i * sin(ϕ₁ - ϕ₂) ]

[r * (cosϕ + i * sinϕ)]ⁿ = rⁿ * (cons n * ϕ + i * sin n * ϕ) //De Moivre’s formulaDe Moivre’s formula

ⁿ√Z = ⁿ√r * (cos((ϕ + 2kPI/n)) + i * sin((ϕ + 2kPI/n)), where (k = 0, 1, 2, ..., n - 1), # of k is n,
if n = 3, k range is 0, 1, 2.

Examples,

let's say 1 is a complex number, so 1 + 0 * i

x² - 4x + 13 = 0;
D = - 36, a discriminant, in this case is negative, so regular solving is not valid

x = 2±3 * i, so x₁ = 2 + 3 * i, x₂ = 2 - 3 * i

FURTHER READINGS:
https://en.wikipedia.org/wiki/Complex_number
http://www.purplemath.com/modules/complex.htm
http://introcs.cs.princeton.edu/java/97data/Complex.java.html

COMPLEX NUMBERS & GEOMETRY:
http://www.cut-the-knot.org/arithmetic/algebra/ComplexNumbersGeometry.shtml
https://www.ics.uci.edu/~eppstein/junkyard/spiraltile/
http://intothecontinuum.tumblr.com/page/11

VIDEOS:
https://www.youtube.com/watch?v=dZPRzB1Nj08 [RUS]

@author Vladimir V. KKUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import processing.pdf.*;

void setup(){
  
  size(750, 750, "processing.core.PGraphicsRetina2D");
  background(240);
  
  beginRecord(PDF, "output.pdf");
  
  Complex a = new Complex(5.0, 6.0);
  
  println("|a|:", a.modulus());
  println("arg(a):", a.argumentDegrees());
  
  translate(width/2, height/2);
  strokeWeight(0.75);
  
  for(float y = -3; y < 3; y += 0.025){
    for(float x = -3; x < 3; x += 0.025){
      
      Complex tmp = new Complex(x, y);
      point((float)tmp.argument()*100, -(float)tmp.modulus()*50);
      
    }
  }
  
  endRecord();
  
}


