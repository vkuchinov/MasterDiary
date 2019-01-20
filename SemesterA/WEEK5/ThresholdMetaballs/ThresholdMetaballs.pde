Blob[] blobs;
int margin = 128;
PImage mask;

PShader blur;

String[] urls = {"mask1.jpg",
                 "mask2.jpg",
                 "mask3.jpg",
                 "mask4.jpg",
                 "mask5.jpg",
                 "mask6.jpg",
                 "mask7.jpg",
                 "mask8.jpg"};
      
//Two routes to follow...
//Several layers with different colours
//Each set of sizes has its colour, small ping, large...grey..
//Size distribution... to DNA

void setup(){
  
size(512, 512, P2D);
background(0);

blur = loadShader("blur.glsl");
mask = loadImage(urls[int(random(0,urls.length))]);
mask.resize(512, 512);

blobs = new Blob[32];
for(int b=0; b < blobs.length; b++)
{
boolean withIn = false;
while(!withIn)
{
//consider corners and shifts, another x,y centres in blob class

int randX = int(random(0, width));
int randY = int(random(0, height));
int randSize = int(map(dist(width/2, height/2, randX, randY), 0, 256, 32, 196));
color dot = mask.get(randX+int(randSize/2), randY+int(randSize/2));
if(dot == -16777216) { blobs[b] = new Blob(randSize*1.0, randX+int(randSize/2), randY+int(randSize/2), random(-1.5, 1.5), random(-1.5, 1.5), 0); withIn = true; } 
if(dot == -131072) { blobs[b] = new Blob(randSize*1.0, randX+int(randSize/2), randY+int(randSize/2), random(-1.5, 1.5), random(-1.5, 1.5), 1); withIn = true; } 
}
}

}

void draw(){
background(0);
for(int b=0; b < blobs.length; b++)
{
blobs[b].update(); 
blobs[b].draw();
}
//filter(THRESHOLD, 0.025);
//values up to 12 are also awesome
filter(POSTERIZE, 4);
filter(blur);

}

class Blob{
 
float x,y, vx, vy;
PImage blob_sprite;
int size, r, g, b;
int colour;

Blob(float sizeIn, float xx, float yy, float vxx, float vyy, int c){

colour = c;
r = int(random(64, 196)/colour);
g = int(random(0, 128)/colour);
b = int(random(128, 255)/colour);
size = int(sizeIn);

//centers
x = xx;
y = yy;
vx = vxx;
vy = vyy;

//Extract yellow channel from CMYK with blob5.png

blob_sprite = loadImage("blob5.png");
blob_sprite.resize(size, size);
}

void update(){

  color pointColor = mask.get(int(x), int(y));
   if(pointColor != -16777216 && colour == 0){ vx*=-1; vy*=-1; }
   if(pointColor != -131072 && colour == 1){ vx*=-1; vy*=-1; }


x += vx;
y += vy;

}

void draw(){
tint(r, g, b);
image(blob_sprite, x - size/2, y-size/2);  
}
}
