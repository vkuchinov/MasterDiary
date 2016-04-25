/*

L-SYSTEM [LINDENMAYER SYSTEM]
[static version, based on a 'real geometry', not matix translations]

L-system or Lindenmayer system is a parallel rewriting system and 
a type of formal grammar. An L-system consists of an alphabet of 
symbols that can be used to make strings, a collection of production 
rules that expand each symbol into some larger string of symbols, 
an initial "axiom" string from which to begin construction, and 
a mechanism for translating the generated strings into geometric 
structures. L-systems were introduced and developed in 1968 by 
Aristid Lindenmayer, a Hungarian theoretical biologist and botanist 
at the University of Utrecht. 

    L-SYSTEM PARAMETERS:
    
    variables: ...
    constants: ...
    axiom: ...
    rule(s): ...
    
    PYTHAGORAS TREE:
    
    [numerical]                       [alphabetical]          [turtle*]             [turtle†]          
    
    variables : 0, 1                  A, B                    F, S                 F, X
    constants: [, ]                   [, ]                    [, ]
    axiom  : 0                        A                       F                    FX
    rules  : (1 → 11), (0 → 1[0]0)    BB, B[A]A               F = F[+SF][-SF]      X: F[-FX]+FX
    

    LRule rule = new LRule("A", new char[]{'A', 'B'}, new char[]{'[', ']'}, new String[]{"BB", "B[A]A"}); //alphabetical
    LRule rule = new LRule("F", new char[]{'F'}, new char[]{}, new String[]{"F", "F[+F][-F]"}); //turtle
    
    * rare syntax
    † syntax that has been used in this sketch as well as alphabetical
    
REFERENCES:
https://en.wikipedia.org/wiki/L-system
http://www.kevs3d.co.uk/dev/lsystems/
https://xojoc.pw/dailyprogrammer/fractals.html
http://www.nolandc.com/sandbox/fractals/
http://library.fridoverweij.com/apps/LSystemPlotter/LSystemPlotter.php
https://10klsystems.wordpress.com/examples/

http://paulbourke.net/fractals/lsys_algae_b/ [!!!]
http://hardlikesoftware.com/projects/lsystem/lsystem.html [!!!]

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

LSystem ls;
ColorScheme colors = new ColorScheme();

void setup(){
 
   size(800, 800, "processing.core.PGraphicsRetina2D");
   background(colors.background);
   
   LRule rule = new LRule("A", new char[]{'[', ']', '+', '-', '1', '2', '3'}, new String[]{"A", "2B-1A-B", "B", "3A+1B+A"});
   ls = new LSystem(new PVector(width/2 - 180, height/2 + 250), rule, 8.0, 60.0, 6);
  
   ls.draw();
 
   ls.origin();
   
}
