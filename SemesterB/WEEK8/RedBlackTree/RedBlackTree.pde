/*

RED-BLACK TREE

A red–black tree is a kind of self-balancing binary search tree 
in computer science. Each node of the binary tree has 
an extra bit, and that bit is often interpreted as the color 
(red or black) of the node. 

These color bits are used to ensure  the tree remains approximately 
balanced during insertions and deletions.

Balance is preserved by painting each node of the tree with one of 
two colors in a way that satisfies certain properties, which collectively 
constrain how unbalanced the tree can become in the worst case. 

When the tree is modified, the new tree is subsequently rearranged and repainted 
to restore the coloring properties. The properties are designed in such 
a way that this rearranging and recoloring can be performed efficiently.

The balancing of the tree is not perfect, but it is good enough to allow it 
to guarantee searching in O(log n) time, where n is the total number of 
elements in the tree. The insertion and deletion operations, along with 
the tree rearrangement and recoloring, are also performed in O(log n) time.

RED-BLACK TREE RULES:

1. Each node is either red or black.
2. The root is black. This rule is sometimes omitted. 
   Since the root can always be changed from red to black, 
   but not necessarily vice versa, this rule has little effect 
   on analysis.
3. All leaves (NIL) are black.
4. If a node is red, then both its children are black.
5. Every path from a given node to any of its descendant NIL 
   nodes contains the same number of black nodes.
  
DEFINITIONS:

The number of black nodes from the root to a node is the node's black depth;
The uniform number of black nodes in all paths from root to the leaves 
is called the black-height of the red–black tree.

REFERENCES:
https://en.wikipedia.org/wiki/Red%E2%80%93black_tree

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

RedBlack tree;

int[] testData = new int[]{19, 2, 15, 23, 25, 12, 14, 7, 3, 19};

void setup(){
 
   size(512, 512);
   tree = new RedBlack(new Node(19));
   
   
  
}
