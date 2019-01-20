/*

L: BB[B[A]A]B[A]A

1: B[A]A
2: B[A]A[BB][BB]

   M:  BBB[A]AB[A]A
   L:  BB[B[A]A]B[A]A
   
   L1: B[A]A
   L2: BB [ B[A]A ] B[A]A
   
   M1: B[A]A, where A = B[A][A], B = BB;
   M2: BB[B[A]A]B[A]A


*/


//ALPHABETICAL

String axiom = "A";
String A = "B[A]A";
String B = "BB";

String tmp ="";

for(int n = 0; n < 2; n++){
  
  tmp ="";
  char[] chars = axiom.toCharArray();
  
  for(int c = 0; c < chars.length; c++){
     if(chars[c] == 'A') tmp += A;
     if(chars[c] == 'B') tmp += B;
     if(chars[c] == '[') tmp += "["; 
     if(chars[c] == ']') tmp += "]";  
  } 
  
  axiom = tmp;

}

println(tmp);


//TURTLE

axiom = "FX";
//String F = "F{+SF}{-SF}" for axiom "F";
String X = "SF{-FX}+FX";

tmp ="";

for(int n = 0; n < 5; n++){
  
  tmp ="";
  char[] chars = axiom.toCharArray();
  
  for(int c = 0; c < chars.length; c++){
     if(chars[c] == 'F') tmp += "F";
     if(chars[c] == 'S') tmp += "S";
     if(chars[c] == 'X') tmp += X;
     if(chars[c] == '{') tmp += "{"; 
     if(chars[c] == '}') tmp += "}";  
     if(chars[c] == '+') tmp += "+"; 
     if(chars[c] == '-') tmp += "-";  
     
  } 
  
  axiom = tmp;

}

println(tmp);

