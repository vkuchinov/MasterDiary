/*

SeparableKernel (image processing)
[a SeparableKernel, convolution matrix, or mask is a small matrix]

In image processing, a SeparableKernel, convolution matrix, or mask is 
a small matrix. It is used for blurring, sharpening, embossing, 
edge detection, and more. This is accomplished by doing 
a convolution between a SeparableKernel and an image.

g(x, y) = (w * f)(x, y) = ⅀(a, -a)⅀(b, -b)w(s, t)f(x - s, y - t)

where -a ≤ s ≥ a, -b ≤ w ≥ b

FOR EXAMPLE 3x3 BLUR

GAUSSIAN MATRIX 3x3

1 2 1                   0.0625 0.1250 0.0625
2 4 2   1/16 * n   =    0.1250 0.2500 0.1250
1 2 1                   0.0625 0.1250 0.0625

CONVOLUTION

Convolution is the process of adding each element of the image to 
its local neighbors, weighted by the SeparableKernel. This is related to 
a form of mathematical convolution. 

It should be noted that the matrix operation being performed - 
convolution - is not traditional matrix multiplication, despite 
being similarly denoted by *.

REFERENCES:
https://en.wikipedia.org/wiki/SeparableKernel_(image_processing)

FURTHER READINGS:
https://en.wikipedia.org/wiki/Convolutional_neural_network

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

PImage sample;

SeparableKernel filter;

void setup(){

   sample = loadImage("sampleBW.png");
   size(sample.width, sample.height); 
   
   filter = new SeparableKernel(sample);
   
   image(sample, 0, 0);
  
}
