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

  for ( double[] a : output) {
    for ( double b : a) {

      b = value_;
    }
  }
  return output;
}

