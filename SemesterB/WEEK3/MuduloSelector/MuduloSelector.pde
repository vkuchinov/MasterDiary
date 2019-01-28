/*

 NUMBERS ROW + MODULO ARITHMETIC
 [an ∞ modulo selector]
 
 @author  Vladimir V KUCHINOV
 @email   helloworld@vkuchinov.co.uk
 
 */

int k = 0;   
int w = 5;   //an odd value 
int l = 16;  //length

void setup() {

  size(512, 128);
  background(255);
}

void draw() {

  background(255);
  drawNumbers(l, k);
}

void drawNumbers(int l_, int k_) {

  float step = (width - 64.0) / l_;
  int[] indices = new int[w];

  for (int j = 0; j < w; j++) {

    int v = k_ - (w - 1)/2 + j;
    indices[j] = v % l;
    if (v < 0  && v % l != 0) { 
      indices[j] = v % l + l;
    }
  }

  for (int i = 0; i < l_; i++) {

    fill(0);
    for (int j = 0; j < w; j++) { 

      int v = indices[j];
      if (i == v) { 

        int median = floor(w/2);
        if (j != median) { 
          fill(255, 0, 255);
        } else { 
          fill(0, 255, 0);
        }
      }
    }

    textSize(16);
    textAlign(CENTER); //vertical 
    text(i, 40 + i * step, 72);
  }
}
void display(int k_) { 
  println(k_);
}

void keyPressed() {

  if (key == CODED) {

    if (keyCode == UP) { 
      k++;
    } else if (keyCode == DOWN) { 
      k--;
    }
  }
}

