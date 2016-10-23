/*

ARRAYLIST PUSHING AT INDEX

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

ArrayList<String> list = new ArrayList<String>();
list.add("Ann");
list.add("Bob");
list.add("John");
list.add("Theodor");

println(list); //[Ann, Bob, John, Theodor]

list.add(2, "Cedric");

println(list); //[Ann, Bob, Cedric, John, Theodor]
