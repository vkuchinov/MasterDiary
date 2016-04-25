/*

HOW TO USE ARRAYS WITH CUSTOM CLASSES
returning class[] from function


@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

void setup(){
  
     Person[] staff = fillArray();
  
}

Person[] fillArray(){
 
     String[] names = {"John", "Monica"};
     int[] ages = {24, 45};
     
     Person[] output = new Person[max(names.length, ages.length)];
     
     int count = 0;
     
     for( Person p : output){
          p = new Person(names[count], ages[count]);
          count++;
     }
  
     return output;
}
