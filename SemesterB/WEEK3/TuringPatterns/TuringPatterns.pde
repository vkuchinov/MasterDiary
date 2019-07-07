/*

TURING PATTERNS

The concept of a Turing pattern (often referred to in the plural 
as Turing patterns) was introduced by the English mathematician 
Alan Turing in a 1952 paper entitled The Chemical Basis of 
Morphogenesis.

This foundational paper describes the way in which patterns 
in nature such as stripes and spots can arise naturally out of 
a homogeneous, uniform state.

CONVOLUTION

In mathematics (in particular, functional analysis) convolution is 
a mathematical operation on two functions (f and g) to produce a third 
function that expresses how the shape of one is modified by the other.

REFERENCES:
https://en.wikipedia.org/wiki/Turing_pattern

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Arrays;


Turing pattern;

void setup(){
  
   size(512, 512);
   pattern = new Turing(2, 256, 256, 3, 7); 

}

void draw(){
  
   pattern.next();
   pattern.draw();
 
}
