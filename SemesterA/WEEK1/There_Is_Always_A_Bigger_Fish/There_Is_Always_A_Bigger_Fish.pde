/*
Aim
---
Explore rect() & ellipse() methods as deep as possible.

Process
-------
The fish silhouette is made with one single rect() method by "hacked"
option of using negative numbers for corner radiuses.

Comments
--------
During playing with corner radius parameters I have figured out that
you can use negative numbers without no limits. However, positive numbers 
are actually limited with rect size, if width/height, for example, 250 and corner radius(es)
is 500, the method will cut 500 to 250.

The ellipse method does not work with negative numbers, taken abolute values (Math.abs).
It doesn't matter did you type 500 or -500, the interpreter will read it as 500.

A fish shape is not the only one cool thing, which could be drawn with single rect()
method. There at least three more.

concaved rhombus: rect(50, 50, 0, 0, -50, -50, -50, -50);
northern star: rect(45, 45, 10, 10, -30, -30, -30, -30);
candy: rect(30, 30, 40, 40, 0, -30, 0, -30)

Evaluation
----------
The program works well. 
For more elegant presentation I am using default window setting
and don't use setup function  intentionally . 

Just to do one line program.

Bugs: None.
Extensions: None.
*/

rect(32, 2, 60, 60, 30, 10, 30, -45);
