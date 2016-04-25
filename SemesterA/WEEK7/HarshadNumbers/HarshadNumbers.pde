/*

HARSHAD NUMBER(S) 
[known as Niven numbers as well]

In recreational mathematics, a Harshad number (or Niven number) in 
a given number base, is an integer that is divisible by the sum of 
its digits when written in that base. Harshad numbers in base n are 
also known as n-Harshad (or n-Niven) numbers. Harshad numbers were 
defined by D. R. Kaprekar, a mathematician from India. 

The word "Harshad" comes from the Sanskrit harṣa (joy) + da (give), 
meaning joy-giver. The term “Niven number” arose from a paper delivered 
by Ivan M. Niven at a conference on number theory in 1977. 

All integers between zero and n are n-Harshad numbers.


REFERENCES:
https://en.wikipedia.org/wiki/Harshad_number#Examples
https://oeis.org/A005349

VISUALIZATION
http://www.numberspiral.com/
https://en.wikipedia.org/wiki/Ulam_spiral
http://scienceblogs.com/goodmath/2010/06/22/the-surprises-never-eend-the-u/

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

final int NUMS_TO_GET = 2048;
final float RATIO = 4.8;

void setup(){
  
    size(500, 500, "processing.core.PGraphicsRetina2D");
    background(0);
    translate(width/2, height/2);
 
    int[] harshad = new int[0];
    int sum = 0;
    
        for(int n = 1; n < NUMS_TO_GET; n++){
          
            String tmp = str(n);
            for(int s= 0; s < tmp.length(); s++){
            sum += int(str(tmp.charAt(s)));
            
            }
    
        if(n % sum == 0) harshad = append(harshad, n);
        sum = 0;
        
        }
    
    //The Number Spiral
    for(int n = 0; n < harshad.length; n++){
        
        stroke(255);
        strokeWeight(2.5);
        
        float r = RATIO * sqrt(harshad[n]);
        float theta = sqrt(harshad[n]);
        
        point(r * cos(2 * PI * theta), -r * sin(2 * PI * theta));
        
      
    }

}
