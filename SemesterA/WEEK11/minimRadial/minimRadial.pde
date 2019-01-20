/*

minimRadial
based on minim library example, just a very simle experiment 
refereing to vinyl records.

Cloud Nothings — Stay Useless @ http://www.last.fm/music/+free-music-downloads

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;

float radius = 320.0;
float angle = 0.0;

PVector lastPoint;
float max = -99999;
float min = 99999;

void setup()
{
  
  size(750, 750, "processing.core.PGraphicsRetina2D");
  
  minim = new Minim(this);
  
  jingle = minim.loadFile("stay_useless.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  
}

void draw()
{
  
  translate(width/2, height/2);
  stroke(0);
  
  fft.forward( jingle.mix );
  
  float x = cos(radians(angle)) * radius;
  float y = sin(radians(angle)) * radius;
  
  float subrad = map(fft.getBand(0), 0, 50, 0, 32);
  
  if(lastPoint != null){ 
    
    //line(x, y, lastPoint.x, lastPoint.y); 
    line(x, y, x + cos(radians(angle)) * subrad, y + sin(radians(angle)) * subrad);
    line(x, y, x - cos(radians(angle)) * subrad, y - sin(radians(angle)) * subrad);

   }
   
  lastPoint = new PVector(x, y);
  
  radius -= 0.025;
  angle += 0.5;
  
  //if(fft.getBand(0) < min) min = fft.getBand(0);
  //if(fft.getBand(0) > max) max = fft.getBand(0);
  //println(min, max);
  
  if(radius < 20) noLoop();
  
}
