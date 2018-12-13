/*

LCM & GCF FUNCTIONS
[Least Common Multiple & Greatest Common Factor*]

* also known as greatest common divisor, highest common factor,
  greatest common measure and highest common divisor.

LCM(a, b) where a,b - any positive integers
GCF(a, b) where a,b - any positive integers

REFERENCES:
https://en.wikipedia.org/wiki/Least_common_multiple
https://en.wikipedia.org/wiki/Greatest_common_divisor

FURTHER READINGS:
https://en.wikipedia.org/wiki/Polynomial_greatest_common_divisor

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

void setup(){
  
//should be 9925032
println(LCM(4056,7341));
println(LCM2(4056,7341));

//should be 3
println(GCM(4056,7341));
println(GCM2(4056,7341));

}

int LCM(int a_, int b_){
  
  return a_ * (b_ / GCM(a_, b_));
  
}

int GCM(int a_, int b_){
 
    while (b_ > 0)
    {
        int temp = b_;
        b_ = a_ % b_; 
        a_ = temp;
    }
    
    return a_;

}

//Euclid's algorithm, recursive
int GCM2(int a_, int b_) {
  
    if (b_ == 0) return a_;
    else return (GCM2(b_, a_ % b_));
    
}

int LCM2(int a_,int b_)
{
    int n, x, s = 1, t = 1;
    
    for(n = 1 ;; n++)
    {
        s = a_ * n;
        for(x = 1; t < s; x++)
        {
            t= b_ * x;
        }
        if(s == t)
            break;
    }
    return(s);
}


