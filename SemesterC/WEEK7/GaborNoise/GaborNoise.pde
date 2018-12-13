/*

GABOR NOISE

Gabor noise is a procedural noise function based on sparse convolution and 
the Gaborkernel. 

Gabor noise offers a unique combination of properties not found in other 
noise functions:

accurate spectral control with intuitive parameters for easy texture design, 
setup-free surface noise without surface parameterization for easy application 
on surfaces, and analytical anisotropic filtering for high-quality rendering.

REFERENCES:

https://www.di.ens.fr/~vergnaud/teaching0910/2010-LagaeDrettakis.pdf

https://en.wikipedia.org/wiki/Gabor_filter
https://en.wikipedia.org/wiki/Log_Gabor_filter


@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int DIMS = 128;

int N = 8;
float S = 0.49;
float t = 0.0;

float freq = 10.0;
float d = -0.5;

float[][][] matrix = new float[256][256][3];

void setup(){
 
   size(512, 512);
   
     for(int y = 0; y < 256; y++){
      for(int x = 0; x < 256; x++){
        
        matrix[x][y][0] = random(0.0, 1.0);
        matrix[x][y][1] = random(0.0, 1.0);
        matrix[x][y][2] = random(0.0, 1.0);
        
      }
     }

}

void draw(){
  
 for(float y = 0; y <= 1.0; y += 1.0 / DIMS ){
      for(float x = 0; x < 1.0; x += 1.0 / DIMS){

        int[] rgb = new int[3];
        rgb[0] = 0; rgb[1] = 0; rgb[2] = 0;
        
        for (float i = 0.0; i <= N; i++) {
          
          float posX = 1.5 * rndI(i, 0.0);
          float posY = rndI(i, 1.0);
          
          float dirX = (1.0 - d) * rndI(i, 2.0) - d;
          float dirY = (1.0 - d) * rndI(i, 3.0) - d;
          
          int posMX = (int)(256.0 / 1.5 * posX);
          int posMY = (int)(256.0 / 1.5  * posY);
          
          float R = gabor(x - posX, y - posY, dirX * freq, dirY * freq) * (matrix[posMX][posMY][0] * 255.0);
          float G = gabor(x - posX, y - posY, dirX * freq, dirY * freq) * (matrix[posMX][posMY][1] * 255.0);
          float B = gabor(x - posX, y - posY, dirX * freq, dirY * freq) * (matrix[posMX][posMY][2] * 255.0);
          
          rgb[0] += R;
          rgb[1] += G;
          rgb[2] += B;
          
          for(int xx = 0; xx < 512 / DIMS * 2; xx++){
            for(int yy = 0; yy < 512 / DIMS * 2; yy++){
              
              set((int)(DIMS * (x * 512 / DIMS) + xx), (int)(DIMS * (y * 512 / DIMS) + yy), color(rgb[0], rgb[1], rgb[2]));
            
            }
          }
          
        }
    
      }
    }
   
    t += 0.1; 
  
}

float gabor(float x_, float y_, float vx_, float vy_) {

    float g = gauss(x_) * gauss(y_);
    float s = 0.5 * sin(PVector.dot(new PVector(x_, y_), new PVector(vx_, vy_)) * 2.0 * HALF_PI - 10.0 * t);
    return g * s;
    
}

float rndI(float i_, float j_)

{
  
  float uvX = (0.5 + i_) / 256.0;
  float uvY = (0.5 + j_) / 256.0;

  return matrix[(int)(uvX * 256.0)][(int)(uvY * 256.0)][0];
  
}


float gauss(float f_){ return exp(-(f_ * f_) / (S * S)); }
