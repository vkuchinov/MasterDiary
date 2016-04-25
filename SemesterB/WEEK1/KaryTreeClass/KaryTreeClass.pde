/*

KARY TREE [K-ARY TREE]

In graph theory, a k-ary tree is a rooted tree in which each node 
has no more than k children. It is also sometimes known as a k-way 
tree, an N-ary tree, or an M-ary tree. A binary tree is the special 
case where k = 2.

REFERENCES:
http://mathematica.stackexchange.com/questions/11632/how-to-generate-a-random-tree
https://en.wikipedia.org/wiki/K-ary_tree

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/
import java.util.Random;

KaryTree tree;

void setup(){
  
    size(800, 800, "processing.core.PGraphicsRetina2D"); 
    
    //full
    //tree = new KaryTree(4, 10);
    
    //randomly feeded
    //seed determines # of children K - random(n) >= 0;
    tree = new KaryTree(4, 6, new Random(456));
    
    translate(width/2, height/2);
    tree.radialDrawing(new PVector(0.0, 0.0), 50.0, 50.0, 0.0);
 
}


