/*

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

class Person{
  
   int age;
   String name;
   String surname;
  
   Person(int age_, String name_, String surname_){
     
        age = age_; name = name_; surname = surname_;
    
   } 
   
   public String toString() {
     
    return "Hi, my name is " + name + " " + surname + ", and I am " + age + " years old.";
    
  }
  
  
}

Person p;

void setup(){
  
  p = new Person(32, "John", "Palmer");
  println(p);
  
}
