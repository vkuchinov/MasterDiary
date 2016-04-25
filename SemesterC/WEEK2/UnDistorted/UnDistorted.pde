/*

unDISTORTED
a very simple spin-off experiment based on my research
for correcting lens distorshion.

Could be easily reversed to its original functional state
for lens correction. Just remove noise parameter out of 
business and by setting the right sin/cos values depending
on a focal distance you will get a very straight forwardsolution.

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

PImage test;
PImage result;

float inc = 100;
float l = 0;

float curvature = 3.0;

boolean vert = true; 

float noiseScale = 0.05;
int count = 0;

void setup() {
  size(512, 512);  
  test = loadImage("test2.jpg");
  
  result = createImage(512, 512, RGB);
}

void draw() {

  count++;
  
  noiseDetail(3,0.5);
  noiseSeed(4545);
  
  curvature = 33*noise( count * noiseScale, count * noiseScale);
  println(curvature);
  
  background(0);
  image(test, 0, 0);
  stroke(255, 0, 0);
  
    if(vert){
    float x = 0;
    for (float a = 0; a < PI; a += PI/width) {

      stroke(0, 255, 0);
      color c1 = test.get((int)x, (int)(l + sin(a)*(256 - l)/curvature));
      result.set((int)x, (int)l, c1);
      point(x, l + sin(a)*(256 - l)/curvature);
      
      stroke(0, 0, 255);
      color c2 = test.get((int)x, (int)(height - l - sin(a)*(256 - l)/curvature));
      point(x, height - l - sin(a)*(256 - l)/curvature);
      result.set((int)x, (int)(height - l), c2);
      x+= 1;
      
    }
    
   if(l < 256) l++; else { l = 0; processed(); vert = false; }
   
   }
   
   else {
     
   float x = 0;
   
    for (float a = 0; a < PI; a += PI/width) {

      stroke(0, 255, 0);
      color c1 = test.get((int)(l + sin(a)*(256 - l)/curvature), (int)x);
      result.set((int)l, (int)x, c1);
      point(l + sin(a)*(256 - l)/curvature, x);
      
      stroke(0, 0, 255);
      color c2 = test.get((int)(height - l - sin(a)*(256 - l)/curvature), (int)x);
      point(height - l - sin(a)*(256 - l)/curvature, x);
      result.set((int)(height - l), (int)x,  c2);
      x+= 1;
      
    }
    
   if(l < 256) l++; else { l = 0; processed(); vert = true; }
     
   }
 
}

void processed(){
  
  test.copy(result, 0, 0, 512, 512, 0, 0, 512, 512);
  
}

