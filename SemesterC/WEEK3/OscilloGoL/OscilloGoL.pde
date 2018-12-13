/*

CELLULAR AUTOMATA OSCILLATORS [GoL]

In a cellular automaton, an oscillator is a pattern that returns 
to its original state, in the same orientation and position, 
after a finite number of generations. 

Thus the evolution of such a pattern repeats itself indefinitely. 
Depending on context, the term may also include spaceships as well.

The smallest number of generations it takes before the pattern returns 
to its initial condition is called the period of the oscillator. 

An oscillator with a period of 1 is usually called a still life, 
as such a pattern never changes. Sometimes, still lifes are 
not taken to be oscillators. Another common stipulation is that 
an oscillator must be finite.

In Conway's Game of Life, finite oscillators are known to exist 
for all periods except 19, 23, 38 and 41. Additionally, while 
oscillators exist for period 34, the only known examples are 
considered trivial because they consist of essentially separate 
components that oscillate at smaller periods. For instance, 
one can create a period 34 oscillator by placing period 2 and 
period 17 oscillators so that they do not interact. 

An oscillator is considered non-trivial if it contains at least 
one cell that oscillates at the necessary period.

Every oscillator has 5 characteristics - period, mod, heat, volatility 
and strict volatility.

The PERIOD of a pattern is the smallest number of generations it 
takes for it to reappear in its original form.

The MOD of an oscillator or spaceship is the smallest number of 
generations that it takes for it to reappear in its original form, 
possibily subject to some rotation or reflection.

The HEAT of an oscillator or spaceship is the average number of 
cells that change state in each generation.

The VOLATILITY of an oscillator is the size (in cells) of its 
rotor divided by the sum of the sizes of its rotor and its STRATOR 
[The stator on an oscillator refers to its cells that are alive 
during all of its phases.]

The STRICT VOLATILITY is a term that was suggested by Noam Elkies 
in August 1998 for the proportion of cells involved in a period n 
oscillator that themselves oscillate with period n. 

For prime n this is the same as the ordinary volatility. 

The only periods for which strictly volatile oscillators are 
known are 1, 2, 3, 5, 6, 8, 13, 15, 22, 30, 33, and 177.


REFERENCES:
https://en.wikipedia.org/wiki/Oscillator_(cellular_automaton)
http://www.conwaylife.com/w/index.php?title=Category:Oscillators

author Vladimir V KUCHINOV
@email helloworld@vkuchinov.co.uk

*/

Oscillator osc;

void setup(){
 
   size(600, 300);
   translate(width/2, height/2);
 
   osc = new Oscillator("pinwheel");
     
}

void draw(){
  
    background(220);
    translate(width/2, height/2);
  
}




