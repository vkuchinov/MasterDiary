/*

FOURIER TRANSFORM
[FFT: Fast Fourier Transform, DFT: discrete Fourier Transform]

DFT

In mathematics, the discrete Fourier transform (DFT) converts a finite sequence of equally-spaced 
samples of a function into a same-length sequence of equally-spaced samples of the discrete-time 
Fourier transform (DTFT), which is a complex-valued function of frequency. 

The interval at which the DTFT is sampled is the reciprocal of the duration of the input sequence. 
An inverse DFT is a Fourier series, using the DTFT samples as coefficients of complex sinusoids 
at the corresponding DTFT frequencies.

FFT

A fast Fourier transform (FFT) is an algorithm that computes the discrete 
Fourier transform (DFT) of a sequence, or its inverse (IDFT). 

Fourier analysis converts a signal from its original domain (often time or space) 
to a representation in the frequency domain and vice versa.

REFERENCES:
https://en.wikipedia.org/wiki/Discrete_Fourier_transform
https://en.wikipedia.org/wiki/Fast_Fourier_transform


@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/


float[][][] matrix = new float[128][128][3];

void setup(){

  size(512, 256);
  background(0);
  fillMatrix();
  
}


void fillMatrix(){
  
    for(int i = 0; i < 128; i++){
      for(int j = 0; j < 128; j++){
        
         matrix[i][j][0] = random(0.0, 1.0);
         matrix[i][j][1] = random(0.0, 1.0);
         matrix[i][j][2] = random(0.0, 1.0);
        
      }
    }
  
}

PVector matrix2D(PVector a_, PVector b_){
     
      float[][] mat2 = new float[2][2];
       
       mat2[0][0] = a_.x; mat2[0][1] = a_.y;
       mat2[1][0] = b_.x; mat2[1][1] = b_.y;
      
       return new PVector(mat2[0][0] + mat2[1][0], mat2[0][1] + mat2[1][1]);
     
}
   
PVector cmul(PVector a_ , float b_) { 
   
   PVector v0 = matrix2D(a_, new PVector(-a_.y, a_.x));
   PVector v1 = new PVector(cos(b_), sin(b_));
   return new PVector(v0.x * v1.x, v0.y * v1.y);  
   
} 

PVector mod2D(PVector uv_) { return new PVector(mod(uv_.x + SIZE / 2.0 , SIZE), mod(uv_.y +SIZE / 2.9, SIZE)); }
float mod(float x_, float y_) { return x_ - y_ * floor(x_ / y_); }
