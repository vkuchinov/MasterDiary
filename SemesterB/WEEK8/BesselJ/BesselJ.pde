/*

 BESSEL-J (BesselJ[n, z] function)
 gives the Bessel function of the first kind Jn(z)
 
 Bessel functions, first defined by the mathematician Daniel Bernoulli 
 and then generalized by Friedrich Bessel, are the canonical solutions 
 y(x) of the differential equation
 
 APPLICATIONS
 
 Bessel's equation arises when finding separable solutions to Laplace's equation and the Helmholtz equation 
 in cylindrical or spherical coordinates. Bessel functions are therefore especially important for many problems 
 of wave propagation and static potentials. In solving problems in cylindrical coordinate systems, one obtains 
 Bessel functions of integer order ( α = n); in spherical problems, one obtains half-integer orders ( α = n+1/2). 
 
 Electromagnetic waves in a cylindrical waveguide
 Pressure amplitudes of inviscid rotational flows
 Heat conduction in a cylindrical object
 Modes of vibration of a thin circular (or annular) acoustic membrane (such as a drum or other membranophone)
 Diffusion problems on a lattice
 Solutions to the radial Schrödinger equation (in spherical and cylindrical coordinates) for a free particle
 Solving for patterns of acoustical radiation
 Frequency-dependent friction in circular pipelines
 Dynamics of floating bodies
 Angular resolution
 
 FFT & FFT2 [2D] [knows as FAST FOURIER TRANSFORM]
 computes the discrete Fourier transform (DFT) of X using a fast Fourier transform 
 (FFT) algorithm.
 
 A fast Fourier transform (FFT) algorithm computes the discrete Fourier transform (DFT) of a sequence, 
 or its inverse. Fourier analysis converts a signal from its original domain (often time or space) to 
 a representation in the frequency domain and vice versa. An FFT rapidly computes such transformations 
 by factorizing the DFT matrix into a product of sparse (mostly zero) factors.[1] As a result, 
 it manages to reduce the complexity of computing the DFT from O(n^2), which arises if one 
 simply applies the definition of DFT, to O(n \log n), where n is the data size.
 
 APPLICATIONS
 
 Applications[edit]
 FFT's importance derives from the fact that in signal processing and image processing it has made working 
 in frequency domain equally computationally feasible as working in temporal or spatial domain. 
 Some of the important applications of FFT includes:
 
 Fast large integer and polynomial multiplication
 Efficient matrix-vector multiplication for Toeplitz, circulant and other structured matrices
 Filtering algorithms
 Fast algorithms for discrete cosine or sine transforms (example, Fast DCT used for JPEG, MP3/MPEG encoding)
 Fast Chebyshev approximation
 Fast Discrete Hartley Transform
 Solving Difference Equations
 
 REFERENCES:
 https://reference.wolfram.com/language/ref/BesselJ.html
 https://en.wikipedia.org/wiki/Bessel_function
 
 FFT
 http://www.mathworks.com/help/matlab/ref/fft.html
 https://en.wikipedia.org/wiki/Fast_Fourier_transform
 
 NOTES:
 numeric.rep: creates an Array by duplicating values
 
 @author   Vladimir V. KUCHINOV
 @email    helloworld@vkuchinov.co.uk
 
 */

float INNER_RADIUS = 6.0;
float OUTER_RADIUS = 1.1 * INNER_RADIUS;
int LOG_RES = 4;

void setup() {

  float[][] dims = new float[1<<LOG_RES][1<<LOG_RES];

  //n: dimenstions, radius: radius
  BesselJ(1<<LOG_RES, INNER_RADIUS);
}

//returns Complex array with the same weight
Complex[][] BesselJ(int n_, float radius_) {

  //field_dims [2, 2]
  //reField [Array[2], Array[2]] where each element is [0.0, 0.0]
  double[][] reField = rep(n_, 0.0);  //fill with 0.0;
  double weight = 0.0;

  for (int i=0; i < reField.length; ++i) {
    for (int j=0; j < reField.length; ++j) {

      double ii = ((i + reField.length/2.0) % reField.length) - reField.length/2.0;
      double jj = ((j + reField.length/2.0) % reField.length) - reField.length/2.0;

      double r = Math.sqrt(ii*ii + jj*jj) - radius_;
      double v = 1.0 / (1.0 + Math.exp(LOG_RES * r));

      weight += v;
      reField[i][j] = v;
    }
  }

  double[][] imField = rep(n_, 0.0);
  FFT2D(1, LOG_RES, reField, imField);

  Complex[][] output = new Complex[reField.length][reField.length];

  for (int i = 0; i < reField.length; i++) {
    for (int j = 0; j < reField[i].length; j++) {  
      output[i][j] = new Complex( reField[i][j], imField[i][j], weight);
    }
  }

  return output;
}

//int, int, double[], double[]
void FFT(int dir_, int m_, double[] x_, double[] y_) {

  int i, j, i1, i2, k, nn, l, l1, l2;
  double c1, c2, tx, ty, t1, t2, u1, u2, z;

  nn = x_.length;

  i2 = nn >> 1;
  j = 0;

  for (i=0; i < nn-1; i++) {

    if (i < j) {

      tx = x_[i];
      ty = y_[i];
      x_[i] = x_[j];
      y_[i] = y_[j];
      x_[j] = tx;
      y_[j] = ty;
    }

    k = i2;

    while (k <= j) {
      j -= k;
      k >>= 1;
    }
    j += k;
  }

  //compute the FFT
  c1 = -1.0;
  c2 = 0.0;
  l2 = 1;

  for (l=0; l < m_; l++) {

    l1 = l2;
    l2 <<= 1;
    u1 = 1.0;
    u2 = 0.0;

    for (j=0; j < l1; j++) {
      for (i=j; i < nn; i+=l2) {

        i1 = i + l1;
        t1 = u1 * x_[i1] - u2 * y_[i1];
        t2 = u1 * y_[i1] + u2 * x_[i1];
        x_[i1] = x_[i] - t1;
        y_[i1] = y_[i] - t2;
        x_[i] += t1;
        y_[i] += t2;
      }

      z =  u1 * c1 - u2 * c2;
      u2 = u1 * c2 + u2 * c1;
      u1 = z;
    }
    c2 = Math.sqrt((1.0 - c1) / 2.0);
    if (dir_ == 1)
      c2 = -c2;
    c1 = Math.sqrt((1.0 + c1) / 2.0);
  }


  if (dir_ == -1) {
    float scale_f = 1.0 / nn;        
    for (i=0; i<nn; i++) {
      x_[i] *= scale_f;
      y_[i] *= scale_f;
    }
  }
}


//int, int, double[][], double[][]
void FFT2D(int dir_, int m_, double[][] x_, double[][] y_) {

  for (int i=0; i < x_.length; ++i) { 
    FFT(dir_, m_, x_[i], y_[i]);
  }

  for (int i=0; i < x_.length; ++i) {
    for (int j=0; j<i; ++j) {
      double t = x_[i][j];
      x_[i][j] = x_[j][i];
      x_[j][i] = t;
    }
  }

  for (int i=0; i < y_.length; ++i) {
    for (int j=0; j<i; ++j) {
      double t = y_[i][j];
      y_[i][j] = y_[j][i];
      y_[j][i] = t;
    }
  }

  for (int i=0; i < x_.length; ++i) { 
    FFT(dir_, m_, x_[i], y_[i]);
  }
}


double[][] rep(int n_, float value_) {

  double[][] output = new double[n_][n_];

  for (double[] a : output) {

    for ( double b : a) {

      b = value_;
    }
  }

  return output;
}

