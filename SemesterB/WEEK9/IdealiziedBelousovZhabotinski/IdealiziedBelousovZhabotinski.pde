/*

Belousov-Zhabotinsky Reaction
[an interactive version]

In this sketch, the Belousov-Zhabotinsky chemical reaction 
pattern is implemented by means of two-dimensional totalistic 
cellular automaton. 

This example uses a range 1, 20-color  totalistic cellular automaton 
with rule number 1350851716507335422, but a wide number of rules around 
this one produce similar patterns.

Observing the pattern formation, two different spatial structures can arise: 
concentric waves and spiral waves. The two different patterns depend on 
the initial conditions and represent a clear example of multiple modes of 
self-organization.

RULE NUMBER 1350851716507335422


REFERENCES:
https://en.wikipedia.org/wiki/Belousov%E2%80%93Zhabotinsky_reaction
http://discovery.ucl.ac.uk/17241/1/17241.pdf

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

BZ reaction;

void setup(){
 
     size(500, 500);
     noSmooth();
     
     reaction = new BZ();
     
}

void draw(){ reaction.update(); reaction.draw(); }
