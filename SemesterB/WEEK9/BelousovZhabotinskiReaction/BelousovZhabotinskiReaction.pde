/*

Belousov-Zhabotinsky Reaction
[an interactive version]

A Belousov–Zhabotinsky reaction, or BZ reaction, is one of a class 
of reactions that serve as a classical example of non-equilibrium 
thermodynamics, resulting in the establishment of a nonlinear 
chemical oscillator. The only common element in these oscillating 
systems is the inclusion of bromine and an acid. The reactions are 
theoretically important in that they show that chemical reactions 
do not have to be dominated by equilibrium thermodynamic behavior. 

These reactions are far from equilibrium and remain so for a significant 
length of time and evolve chaotically. In this sense, they provide 
an interesting chemical model of nonequilibrium biological phenomena, 
and the mathematical models of the BZ reactions themselves are of 
theoretical interest and simulations.

REFERENCES:
https://en.wikipedia.org/wiki/Belousov%E2%80%93Zhabotinsky_reaction
http://demonstrations.wolfram.com/IdealizedBelousovZhabotinskyReaction/
http://mbostock.github.io/protovis/ex/bzr.html

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
