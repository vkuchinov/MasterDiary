/*

KRONECKER PRODUCT BASED FRACTALS

In mathematics, the Kronecker product, denoted by ⊗, is an operation on 
two matrices of arbitrary size resulting in a block matrix. 

It is a generalization of the outer product (which is denoted by the same symbol) 
from vectors to matrices, and gives the matrix of the tensor product with respect 
to a standard choice of basis. The Kronecker product should not be confused 
with the usual matrix multiplication, which is an entirely 
different operation.

The Kronecker product is named after Leopold Kronecker, even though there is 
little evidence that he was the first to define and use it. Indeed, in the past 
the Kronecker product was sometimes called the Zehfuss matrix, after 
Johann Georg Zehfuss who in 1858 described the matrix operation we now know as 
the Kronecker product.


REFERENCES:
https://en.wikipedia.org/wiki/Kronecker_product
https://rosettacode.org/wiki/Kronecker_product_based_fractals

@author  Vladimir V KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

int n = 4;
int d = 1;

Kronecker fractal;

void setup(){
 
   fractal = new Kronecker();
   
   int[][] matrix = getMatrixFromImage("sample4.png");
   fractal.generate(matrix, n);

}

int[][] getMatrixFromImage(String url_){
  
     PImage img = loadImage(url_);

     int w = (int)pow(img.width, n) * d;
     int h = (int)pow(img.height, n) * d;
     
     size(w, h); 
     
     int[][] out = new int[img.width][img.height];
     
     for(int y = 0; y < img.height; y++){
       for(int x = 0; x < img.width; x++){
         
           color c = img.get(y, x);
           out[x][y] = 0;
           if(c == -16777216) { out[x][y] = 1; }
         
       }
     } 
     
     return out;
}
