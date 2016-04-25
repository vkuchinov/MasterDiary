/*

Tribute to Marius Watz
Added Z-Index & its sorting

Vector format!

@author Vladimir V. KUCHINOV
@email helloworld@vkuchinov.co.uk

*/

import java.util.Random;
import java.util.Collections;
import java.util.*;

import processing.pdf.*;

int NUM_PATCHES = 51200;

Random randSeed = new Random(4949);
ArrayList<Patch> patches = new ArrayList();

float masterValue = 222.0;

void setup() {

  size(800, 800, "processing.core.PGraphicsRetina2D");

  background(255);
  beginRecord(PDF, "output.pdf");

  translate(width/2, height - 400);

  for (float x = 20; x < 780; x += 1.0) {

    float y = masterValue / map(x, 10, 790, 0, 10);
    strokeWeight(2.5);

  }
  for (int p = 0; p < NUM_PATCHES; p++) {

    float y1 = map(abs((float)randSeed.nextGaussian() * 15), 0, 60, -150, 1350);
    float y2 = y1 + random(25, 75)*(y1/map(y1, 0, 1000, 120, 750));
    Patch newPatch = new Patch(y1, y2, random(0.0, 360.0));
    patches.add(newPatch);
    
  }

  Collections.sort(patches, new CompareZindex());
  
  for (int p = 0; p < patches.size(); p++) {

    patches.get(p).render();
    println(nfs(100.0/NUM_PATCHES*p, 2, 2) + "% [" + p +" of " + NUM_PATCHES + "] completed...");
    
  }
  
  println("Done. Ready to save PDF. Please wait for a few minutes more.");
  endRecord();
}

class CompareZindex implements Comparator<Patch>
{

  int compare(Patch p1, Patch p2)
  {
    return int(p2.zindex - p1.zindex);
  }
}
