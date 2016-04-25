/*

 SMOOTHLIFE CELLULAR AUTOMATA
 a continuous version of Conway's Game of Life
 Created by Stephan Raphler in 1990's
 
 based on reverse-engeneering ofJavaScript experiment
 @  http://jsfiddle.net/CSyUb/ 
 
 REFERENCES:
 https://0fps.net/2012/11/19/conways-game-of-life-for-curved-surfaces-part-1/
 http://www.conwaylife.com/wiki/SmoothLife
 http://www.youtube.com/watch?v=iyTIXRhjXII
 http://arxiv.org/abs/1111.1567
 http://sourceforge.net/projects/smoothlife/
 https://github.com/travisbrown/smoothlife
 
 What is segmoid?
 
 Sigmoid means resembling the lower-case Greek letter sigma (ς) 
 
 In math it is a function:
 http://en.wikipedia.org/wiki/Sigmoid_function
 http://mathworld.wolfram.com/SigmoidFunction.html
 
 
 FURTHER READINGS:
 https://code.google.com/p/reaction-diffusion/
 
 REFERENCES:
 http://jsfiddle.net/CSyUb/ 
 
 @author   Vladimir V. KUCHINOV
 @email    helloworld@vkuchinov.co.uk
 
 */

//0.257 0.336 0.365 0.549 2 4 4 0.028 0.147

final float INNER_RADIUS = 6.0;
final float OUTER_RADIUS = 3.1 * INNER_RADIUS;
final float B1 = 0.257;
final float B2 = 0.336;
final float D1 = 0.365;
final float D2 = 0.549;
final float ALPHA_N = 0.028;
final float ALPHA_M = 0.0147;
final int   LOG_RES = 8;

color shift = color(0);
color scale = color(255);

double[][] field_dims = new double[1<<LOG_RES][1<<LOG_RES];
double[][][] fields = new double[2][1<<LOG_RES][1<<LOG_RES];

double[][] imaginary_field;

double[][] curr_field;

int current_field = 0;

double[][] M_re_buffer;
double[][] M_im_buffer;
double[][] N_re_buffer;
double[][] N_im_buffer;
double[][] M_re, M_im, N_re, N_im;

Complex[][] inner_bessel;
Complex[][] outer_bessel;

PImage imageData;

void setup() {

  size(1<<LOG_RES, 1<<LOG_RES);

  imageData = createImage(1<<LOG_RES, 1<<LOG_RES, RGB);

  for (int i=0; i<fields.length; i++) {
    fields[i] = rep(field_dims.length, 0.0);
  }

  curr_field = rep(field_dims.length, 0.0);

  imaginary_field = rep(field_dims.length, 0.0);
  M_re_buffer = rep(field_dims.length, 0.0);
  M_im_buffer = rep(field_dims.length, 0.0);
  N_re_buffer = rep(field_dims.length, 0.0);
  N_im_buffer = rep(field_dims.length, 0.0);

  inner_bessel = BesselJ(1<<LOG_RES, INNER_RADIUS);
  outer_bessel = BesselJ(1<<LOG_RES, OUTER_RADIUS);

  double inner_w = 1.0 / inner_bessel[0][0].weight;
  double outer_w = 1.0 / (outer_bessel[0][0].weight - inner_bessel[0][0].weight);

  M_re = rep(field_dims.length, 0.0);
  M_im = rep(field_dims.length, 0.0);
  N_re = rep(field_dims.length, 0.0);
  N_im = rep(field_dims.length, 0.0);

  for (int i = 0; i < inner_bessel.length; i++) {
    for (int j = 0; j < inner_bessel[i].length; j++) {
      M_re[i][j] = inner_bessel[i][j].re();
      M_im[i][j] = inner_bessel[i][j].im();
      N_re[i][j] = outer_bessel[i][j].re();
      N_im[i][j] = outer_bessel[i][j].im();
    }
  }
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {

      N_re[i][j] = outer_w * (N_re[i][j] - M_re[i][j]);
      N_im[i][j] = outer_w * (N_im[i][j] - M_im[i][j]);
      M_re[i][j] *= inner_w;
      M_im[i][j] *= inner_w;
    }
  }

  addSpeckles(999, 1);
}

void draw() {

  background(0);

  nextStep();
  renderField();
  
  filter(BLUR, 2);
  
}

