/*

 RGB TO CMYK CHANNELS SPLITTER
 
 Aim
 ----------------
 
 To design a function to split RGB(A) to separate CMYK channels according to "blue sky" brief.
 
 
 
 Process
 ----------------
 
 
 Comments
 ----------------

 In this particular demosntration input image should have square aspect ratio (proportion).
 
 Evaluation
 ----------------
 
 Bugs: None.
 Libraries: controlP5 GUI by Andreas Schlegel (2006-2012)
 http://www.sojamo.de/cp5
 
 Extensions: To find formula(s) solution and build a proper library for generative (computational) artists community
 
 Author: Vladimir V. Kuchinov
 Date: 01/01/2015
 
 Video
 _________________
 
 Vimeo: https://vimeo.com/116471213
 
 Supports
 _________________
 
 There are several Processing sketches in /support/ folder, which I have been created and used to explore and 
 build different types of maps.
 
 */

 /*
 inputRGB.jpg: input raster image to split into CMYK channels
 standardRGB.jpg, standardC.jpg, standardM.jpg, standardY.jpg, standardK.jpg: reference images, just for demonstration

 mapC.png, mapM.png, mapY.png, mapK.png: greyscale maps for each channel. 4096x4096 pixels, consist of all 16 777 216 c olours
 */

//controlP5 object
ControlP5 cp5;

//variable for timer
//script efficiency control
long startTime;

//reference images for channels, not in use in actual calculations
PImage rgbStandard, cStandard, mStandard, yStandard, kStandard;

//channel maps
PImage matchC, matchM, matchY, matchK;

void setup() {

  //rgbStandard is a duplicate to inputRGB just to avoid artefacts during debugging
  //in real situation, the whole code is using input raster to setup itself (size() and etc)
  rgbStandard = loadImage("standardRGB.jpg");
  size(rgbStandard.width, rgbStandard.height);

  //draw interface
  //calling setupUI function
  setupUI();

  //loading mapping rasters for each channel
  matchC = loadImage("mapC.png");
  matchM = loadImage("mapM.png");
  matchY = loadImage("mapY.png");
  matchK = loadImage("mapK.png");

  //loading reference images
  rgbStandard = loadImage("standardRGB.jpg");
  cStandard = loadImage("standardC.jpg");
  mStandard = loadImage("standardM.jpg");
  yStandard = loadImage("standardY.jpg");
  kStandard = loadImage("standardK.jpg");

  //displaying original reference image
  image(rgbStandard, 0, 0);
}

void draw() {

  //I don't need draw() function in this project, however due controlP5 nature, it should be there, 
  //otherwise there are some inteface artefacts
}

void generateCMYK(String channel) {

  PImage output;
  output = loadImage("inputRGB.jpg");
  //counter variable is used in displaying current percentage of pixels proceed
  int counter = 0;

  //two-dimensional loop for reading each pixel data (row by row)
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      //getting colour value at  position
      color c = output.get(x, y); 
      //processing current RGB colour in 'splitter' function
      float[] cmykValues = matchCMYK(c);

      color n = color(0);

      /*
      
       While this is a demosntration I have divided ouput image to four equal columns representing
       each CMYK channel. 
       
       The output cmykValues array consists of whole data for each channel and could be used in practice.
       
       */

      //divides image into four equal parts
      if (x < round(width*0.25)) { 
        n = color(cmykValues[0]);
      }
      if (x >= round(width*0.25) && x < round(width*0.5)) { 
        n = color(cmykValues[1]);
      }
      if (x >= round(width*0.5) && x < round(width*0.75)) { 
        n = color(cmykValues[2]);
      }
      if (x >= round(width*0.75)) { 
        n = color(cmykValues[3]);
      }

      //updating current pixel
      output.set(x, y, n);
      counter++;

      //passing & sending current percentage of pixels done to debugging console
      //nf() – utility function for formatting numbers into strings
      String percentage = nf((100/pow(width, 2))*counter, 2, 2);
      println(percentage + "% completed");
    }
  }

  //updating output raster
  output.updatePixels();
  //displaying output
  image(output, 0, 0);
  //sending process time to debugging console
  println((System.nanoTime() - startTime)/1e9);
}

float[] matchCMYK(color source) {

  //initializing output arrays
  float[] channels = { 
    0, 0, 0, 0
  };
  int[] XY = { 
    0, 0
  };

  float lastDistance, nextDistance;

  int index = int(abs(source));
  //getting X coordinate using modulo
  XY[0] = index%4096;
  //getting Y coordinate using round() function
  //in this case I prefer to use round() rather than floor()
  XY[1] = round(index/4096);

  //getting channel valuse from all four maps at XY[0], XY[1] pixel coordinates
  color cyan = matchC.get(XY[0], XY[1]);
  color magenta = matchM.get(XY[0], XY[1]);
  color yellow = matchY.get(XY[0], XY[1]);
  color black = matchK.get(XY[0], XY[1]);

  //while maps ar greyscale, all three colours (RGB) have the same value
  //so it really doesn't matter what colour to use out of three
  channels[0] = red(cyan);
  channels[1] = red(magenta);
  channels[2]= red(yellow);
  channels[3] = red(black);

  return channels;
}

void setupUI() {

  //initializing controlP5 object
  cp5 = new ControlP5(this);

  //building tabullar menu item by item
  //it is 'graphical' part 
  cp5.addTab("C").setColorBackground(color(0, 160, 100)).setColorLabel(color(255)).setColorActive(color(255, 128, 0));
  cp5.addTab("M").setColorBackground(color(0, 160, 100)).setColorLabel(color(255)).setColorActive(color(255, 128, 0));
  cp5.addTab("Y").setColorBackground(color(0, 160, 100)).setColorLabel(color(255)).setColorActive(color(255, 128, 0));
  cp5.addTab("K").setColorBackground(color(0, 160, 100)).setColorLabel(color(255)).setColorActive(color(255, 128, 0));
  cp5.addTab("16.7M").setColorBackground(color(0, 160, 100)).setColorLabel(color(255)).setColorActive(color(255, 128, 0));

  //it is 'logical' part
  //ID parameter is used for navigation ( controlEvent() function )
  cp5.getTab("default").activateEvent(true).setLabel("RGB").setId(1);
  cp5.getTab("C").activateEvent(true).setId(2);
  cp5.getTab("M").activateEvent(true).setId(3);
  cp5.getTab("Y").activateEvent(true).setId(4);
  cp5.getTab("K").activateEvent(true).setId(5);
  cp5.getTab("16.7M").activateEvent(true).setId(6);
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    //ID parameter as switch: 1: default image, 2: cyan, 3: magenta, 4: yellow, 5: black, 6: splitter
    switch(theControlEvent.getTab().getId()) {
    case 1: 
      image(rgbStandard, 0, 0); 
      break;
    case 2: 
      image(cStandard, 0, 0); 
      break; 
    case 3: 
      image(mStandard, 0, 0); 
      break; 
    case 4: 
      image(yStandard, 0, 0); 
      break; 
    case 5: 
      image(kStandard, 0, 0); 
      break; 
    case 6: 

      //setting 'point zéro' to calculate processing time
      startTime = System.nanoTime();
      //starting processing
      generateCMYK("CMYK"); 
      break;
    }
  }
}

