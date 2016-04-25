/*

 EXPERIMENT FOUR
 threshhold creature
 
 based on recursive branches
 
 @author Vladimir V. KUCHINOV
 @email  helloworld@vkuchinov.co.uk
 
*/

int totalBranches = 4;
float len = 64.0;

float speed = 0.05;
float r = PI;

PShader blur;
PGraphics molecul;

void setup()
{
  size(750, 750, P2D);
  background(0);
  //blur = loadShader("blur.glsl");
}

void draw()
{

  fill(0, 32);
  rect(0, 0, width, height);

  molecul = createGraphics(500, 500);
  molecul.beginDraw();

  branches(500.0/2.0, 500.0/1.8, -HALF_PI, totalBranches);
  r += speed;

  molecul.endDraw();

  image(molecul, 125, 125);

  filter(BLUR, 5);
  filter(POSTERIZE, 6);

  guidelines(width/2, height/1.8, -HALF_PI, totalBranches);
  
}

void branches(float x_, float y_, float a_, int c_)
{
  float nx = x_ + len * cos(a_);
  float ny = y_ + len * sin(a_);

  if (c_ >= 1 && c_ != 6) {
    molecul.strokeWeight(1.0);
    molecul.stroke(255, 128);
    //line(x, y, nx, ny);
  }

  if (c_ < totalBranches) {
    molecul.stroke(255, 0, 255, 64);
    molecul.noStroke();
    molecul.fill(255, 255);
    //ellipse(x, y, 5, 5);

    molecul.noStroke();
    molecul.fill(255, 255, 255, 8);
    molecul.ellipse(x_, y_, 100.0, 100.0);
  }

  if (c_ > 0) {
    branches(nx, ny, (a_ + r / 3) * - 3, c_ - 1);
    branches(nx, ny, (a_ - r / 3) * - 3, c_ - 1);
  }
}

void guidelines(float x_, float y_, float a_, int c_)
{
  float nx = x_ + len * cos(a_);
  float ny = y_ + len * sin(a_);

  if (c_ >= 1 && c_ != 6) {
    strokeWeight(1.0);
    stroke(255, 0, 255, 128);
    line(x_, y_, nx, ny);
  }

  if (c_ < totalBranches) {
    stroke(255, 0, 255, 64);
    noStroke();
    fill(255, 0, 255);
    ellipse(x_, y_, 5, 5);
  }

  if (c_ > 0) {
    guidelines(nx, ny, (a_ + r / 3) * - 3, c_ - 1);
    guidelines(nx, ny, (a_ - r / 3) * - 3, c_ - 1);
  }
}

