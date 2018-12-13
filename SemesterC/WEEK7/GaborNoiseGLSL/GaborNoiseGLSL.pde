/*

GABOR NOISE GLSL

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

based on https://www.shadertoy.com/view/XsBGDc by FabriceNeyret2

 */
 
PImage sample;
PShader gabor;

float freq = 4.9;
float d = -0.05;

void setup() {
  
  size(512, 512, P2D);
  noStroke();
 
  textureWrap(REPEAT);
  sample = loadImage("sample.jpg");
  
  gabor = loadShader("gabor.glsl");
  gabor.set("resolution", float(width), float(height));  
  
}

void draw() {
  
  gabor.set("time", millis() / 1000.0);
  gabor.set("freq", freq);
  gabor.set("d", d);
  
  shader(gabor);
  
  image(sample, 0, 0, width, height); 
  
}

