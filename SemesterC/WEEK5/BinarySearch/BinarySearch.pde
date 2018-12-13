/*

BINARY SEARCH
[a linear search with time complexity (speed) T(n) = T(n/2) + c]

There are two versions—recursive and iterative.

REFERENCE:
https://en.wikipedia.org/wiki/Binary_search_algorithm

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

Binary search;
int[] sequence = new int[]{2, 3, 4, 10, 40};

void setup(){
  
    search = new Binary();
    
    int n = sequence.length;   //array length
    int x = 10;                //value to find

    int result = search.processFromTo(sequence, 0, n, x);
  
    if (result == -1) println("Element not found"); 
    else println("Element found at index " + result); 
                                                 
}
