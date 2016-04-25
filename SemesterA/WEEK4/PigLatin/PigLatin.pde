/*

PIG LATIN
based on https://en.wikipedia.org/wiki/Pig_Latin

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

String twitterURL = "http://twitter.com/statuses/genvvk.json?callback=twitterCallback2&count=1";
String word = "meaning";

void setup(){

     print(piggyShift(word));

}

String piggyShift(String in){
  
     String out = "";
     
     for(int c = 1; c < in.length(); c++){ out += in.charAt(c); }
     
     out += in.charAt(0) + "ay";
     return out; 
     
}
