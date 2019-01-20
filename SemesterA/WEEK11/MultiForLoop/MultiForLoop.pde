/*

FOR LOOP WITH TWO OR MORE RANGES
[or variables]

    for(0 < x > 30 && 70 < x > 120){
      
    }
    
    or 
    
    for( x in range of (0, 120) && y in range of(20, 140)){
      
      
    }

    JAVA SOLUTION:
    
    List<Integer> rangeA = new List<Integer>();
    List<Integer> rangeB = new List<Integer>();
    ...
    Iterator IteratorA = rangeA.iterator();
    Iterator IteratorB = rangeB.iterator();
    ....
    
    while (IteratorA.hasNext() && IteratorB.hasNext()) {
        Integer rangeA = IteratorA.next();
        Integer rangeB = IteratorB.next();
    }

*/

import java.util.List;
import java.util.Iterator;

void setup(){
  
  
    //one variable, multiple ranges
     println("one variable, multiple ranges");
     
    ArrayList<Integer> range = new ArrayList<Integer>();
    
    //first segment
    for(int x = 20; x < 40; x++){
        range.add(x);
    }
    
    //second segment
    for(int x = 80; x < 90; x++){
        range.add(x);
    }
    
    Iterator rangeIterator = range.iterator();
    
    while (rangeIterator.hasNext()) {
        print(rangeIterator.next(), " ");
    }
    println("");
    
    //two or more variables
    println("two or more variables");
    
    ArrayList<Integer> rangeA = new ArrayList<Integer>();
    ArrayList<Integer> rangeB = new ArrayList<Integer>();
    
    //first variable
    for(int a = -20; a < 20; a++){
        rangeA.add(a);
    }
    
    //second variable
    for(int b = 10; b < 30; b++){
        rangeB.add(b);
    }
    
    Iterator IteratorA = rangeA.iterator();
    Iterator IteratorB = rangeB.iterator();
    
    while (IteratorA.hasNext() && IteratorB.hasNext()) {
        print("A:", IteratorA.next(), "B:", IteratorB.next(), "");
    }
    println("");
  
}
