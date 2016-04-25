void settingModel() {

  for (int i = 0; i < GRID_SIZE; i++) {
    for (int j = 0; j < GRID_SIZE; j++) {
      U[i][j] = 1.0;
      V[i][j] = 0.0;
    }
  }

  if (randomSettings) {
    for (int i = GRID_SIZE/3; i < 2 * GRID_SIZE/3; i++) {
      for (int j = GRID_SIZE/3; j < 2 * GRID_SIZE/3; j++) {    
        U[i][j] = 0.5*(1 + random(-1, 1));
        V[i][j] = 0.25*( 1 + random(-1, 1));
      }
    }
  } else {
    for (int i = GRID_SIZE/3; i < 2 * GRID_SIZE /3; i++) {
      for (int j = GRID_SIZE/3; j < 2 * GRID_SIZE/3; j++) {    
        U[i][j] = 0.5;
        V[i][j] = 0.25;
      }
    }
  }
}

void settingOffsets() {

  for (int i = 1; i < GRID_SIZE - 1; i++) {
    offset[i][0] = i-1;
    offset[i][1] = i+1;
  }

  offset[0][0] = GRID_SIZE - 1;
  offset[0][1] = 1;

  offset[GRID_SIZE - 1][0] = GRID_SIZE - 2;
  offset[GRID_SIZE - 1][1] = 0;
}

void nextGeneration(double F, double K, double diffU, double diffV) {

  for (int i = 0; i < GRID_SIZE; i++) {
    for (int j = 0; j < GRID_SIZE; j++) {
      int p = i + j*GRID_SIZE;

      double u = U[i][j];
      double v = V[i][j];

      int left = offset[i][0];
      int right = offset[i][1];
      int up = offset[j][0];
      int down = offset[j][1];

      double uvv = u*v*v;    

      double lapU = (U[left][j] + U[right][j] + U[i][up] + U[i][down] - 4*u);
      double lapV = (V[left][j] + V[right][j] + V[i][up] + V[i][down] - 4*v);

      dU[i][j] = diffU*lapU  - uvv + F*(1 - u);
      dV[i][j] = diffV*lapV + uvv - (K+F)*v;
    }
  }


  for (int i= 0; i < GRID_SIZE; i++) {
    for (int j = 0; j < GRID_SIZE; j++) {
      U[i][j] += dU[i][j];
      V[i][j] += dV[i][j];
    }
  }
}



