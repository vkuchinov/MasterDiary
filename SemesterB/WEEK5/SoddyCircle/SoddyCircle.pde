/*

SODDY’S KISSING CIRCLE & IT'S COORDINATES;
based on Newton's method

Newton method is a solving system of non-linear equations
x, y, z to start the method are chosen randomly but depending on the 
centers and radiuses of the circles.

Given three noncollinear points, construct three tangent circles such that 
one is centered at each point and the circles are pairwise tangent to one another. 
Then there exist exactly two nonintersecting circles that are tangent to all 
three circles. 

These are called the inner and outer Soddy circles, and their centers are called 
the inner S and outer Soddy centers S^', respectively.

Frederick Soddy (1936) gave the formula for finding the radii of the Soddy circles 
(r_4) given the radii r_i (i = 1, 2, 3) of the other three. 

REFERENCE:
http://mathworld.wolfram.com/SoddyCircles.html
http://forumgeom.fau.edu/FG2007volume7/FG200726.pdf

FURTHER READINGS:
https://en.wikipedia.org/wiki/Barycentric_coordinate_system

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.util.Random;

Random seed = new Random(494949);

PVector A, B, C;
double r1, r2, r3, x1, y1, x2, y2, x3, y3, s1, s2, s3;

void setup(){
 
   size(512, 512);
   translate(width/2, height/2); 

   r1 = 32.0 + seed.nextFloat() * 64.0;
   r2 = 32.0 + seed.nextFloat() * 64.0;
   r3 = 32.0 + seed.nextFloat() * 64.0;

   double c = r1 + r2;
   double a = r1 + r3;
   double b = r2 + r3;
   
   double offsetX = (Math.pow(c, 2) + Math.pow(a, 2)  - Math.pow(b, 2)) / (2.0 * c);
   double offsetY = Math.sqrt(Math.pow(a, 2) - Math.pow(offsetX, 2));
   
   fill(255, 0, 255);
   ellipse((float)-offsetX, (float)-offsetY, (float)r1 * 2, (float)r1 * 2);
   
   fill(255, 255, 0);
   ellipse((float)(r1 + r2 - offsetX), (float)-offsetY, (float)r2 * 2, (float)r2 * 2);
   
   fill(0, 255, 255);
   ellipse(0.0, 0.0, (float)r3 * 2, (float)r3 * 2);

   A = new PVector((float)-offsetX, (float)-offsetY);
   B = new PVector((float)(r1 + r2 - offsetX), (float)-offsetY);
   C = new PVector(1E-5, 1E-5);

   x1 = A.x;
   y1 = A.y;
   x2 = B.x;
   y2 = B.y;
   x3 = C.x;
   y3 = C.y;

   s1 = -1.0;
   s2 = -1.0;
   s3 = -1.0;
 
   double xmax = getDoubleMax(new double[]{A.x + r1, B.x + r2 ,C.x + r3});
   double xmin = getDoubleMin(new double[]{A.x - r1, B.x - r2, C.x - r3});
   double ymax = getDoubleMax(new double[]{A.y + r1, B.y + r2 ,C.y + r3});
   double ymin = getDoubleMin(new double[]{A.y - r1, B.y - r2, C.y - r3});

   double x = (double)random((float)xmin, (float)xmax);
   double y = (double)random((float)ymin, (float)ymax);
   double r = (double)random((float)r1, (float)r1 + 1.0);

   for(int i = 0; i < 512; i++){

     double[] Fx = new double[]{-f1(x, y, r), -f2(x, y, r), -f3(x, y, r)};
 
     double[][] J = new double[][]{

          new double[]{J11(x, y, r), J21(x, y, r), J31(x, y, r)},
          new double[]{J12(x, y, r), J22(x, y, r), J32(x, y, r)},
          new double[]{J13(x, y, r), J23(x, y, r), J33(x, y, r)}
       
     };
     
     double[][] tmp = solve2D(J);
     double[] JnFx = matrixMultiplication2Dx1D(tmp, Fx);
 
     x += JnFx[0];
     y += JnFx[1];
     r += JnFx[2];
   
   }

   double inner_ratius =  r1 * r2 * r3 / (r1 * r2 + r1 * r3 + r2 * r3 + 2 * Math.sqrt(r1 * r2 * r3 * (r1 + r2 + r3)));
   double outer_ratius =- r1 * r2 * r3 / (r1 * r2 + r1 * r3 + r2 * r3 - 2 * Math.sqrt(r1 * r2 * r3 * (r1 + r2 + r3)));

   PVector result = new PVector((float)x, (float)y);
  
   //need to have additional check
   //if three distances to tangent circles, have to be (r1 + soddyR), (r2 + soddyR), (r3 + soddyR)
   //if math error is to large, proceed the loop again
   
   fill(128, 32);
   ellipse(result.x, result.y, (float)inner_ratius * 2, (float)inner_ratius * 2);
   
   fill(128, 32);
   //ellipse(result.x, result.y, (float)outer_ratius * 2, (float)outer_ratius * 2);


}

double f1(double x_, double y_, double r_) { return Math.pow((x_ - x1), 2) + Math.pow((y_ - y1), 2) - Math.pow((r_ - s1 * r1), 2); }
double f2(double x_, double y_, double r_) { return Math.pow((x_ - x2), 2) + Math.pow((y_ - y2), 2) - Math.pow((r_ - s2 * r2), 2); }
double f3(double x_, double y_, double r_) { return Math.pow((x_ - x3), 2) + Math.pow((y_ - y3), 2) - Math.pow((r_ - s3 * r3), 2); }

double J11(double x_, double y_, double r_) { return 2.0 * (x_ - x1); }
double J12(double x_, double y_, double r_) { return 2.0 * (y_ - y1); }
double J13(double x_, double y_, double r_) { return -2.0 * (r_ - s1 * r1); }
double J21(double x_, double y_, double r_) { return 2.0 * (x_ - x2); }
double J22(double x_, double y_, double r_) { return 2.0 * (y_ - y2); }
double J23(double x_, double y_, double r_) { return -2.0 * (r_ - s2 * r2); }
double J31(double x_, double y_, double r_) { return 2.0 * (x_ - x3); }
double J32(double x_, double y_, double r_) { return 2.0 * (y_ - y3); }
double J33(double x_, double y_, double r_) { return -2.0 * (r_ - s3 * r3); }

double[][] solve2D(double[][] matrix_){

    double detA =   matrix_[0][0] * matrix_[1][1] * matrix_[2][2] 
                  + matrix_[0][1] * matrix_[1][2] * matrix_[2][0]
                  + matrix_[0][2] * matrix_[1][0] * matrix_[2][1]
                  
                  - matrix_[0][2] * matrix_[1][1] * matrix_[2][0]
                  - matrix_[0][0] * matrix_[1][2] * matrix_[2][1]
                  - matrix_[0][1] * matrix_[1][0] * matrix_[2][2];

    double M11 = matrix_[1][1] * matrix_[2][2] - matrix_[2][1] * matrix_[1][2];
    double M12 = matrix_[1][0] * matrix_[2][2] - matrix_[2][0] * matrix_[1][2];
    double M13 = matrix_[1][0] * matrix_[2][1] - matrix_[2][0] * matrix_[1][1];
    double M21 = matrix_[0][1] * matrix_[2][2] - matrix_[2][1] * matrix_[0][2];
    double M22 = matrix_[0][0] * matrix_[2][2] - matrix_[2][0] * matrix_[0][2];
    double M23 = matrix_[0][0] * matrix_[2][1] - matrix_[2][0] * matrix_[0][1];
    double M31 = matrix_[0][1] * matrix_[1][2] - matrix_[1][1] * matrix_[0][2];
    double M32 = matrix_[0][0] * matrix_[1][2] - matrix_[1][0] * matrix_[0][2];
    double M33 = matrix_[0][0] * matrix_[1][1] - matrix_[1][0] * matrix_[0][1];

    double[][] C_ = new double[][]{
      
         new double[]{M11, -M12, M13},
         new double[]{-M21, M22, -M23},
         new double[]{M31, -M32, M33}
         
    };

    double[][] CT = transposeMatrix2D(C_);
    
    double[][] A1 = scalarMultiplier2D(C_, detA);

    return A1;
}

double getDoubleMax(double[] array_){
  
   double out = Double.NEGATIVE_INFINITY;
   
   for(int i = 0; i < array_.length; i++){ if(array_[i] > out) { out = array_[i]; }}  
   
   return out;
 
}

double parseString(String str_){
  
  Double out = Double.parseDouble(str_);
  
  if(out.isNaN()) return 0.0;
  else if(out == Double.NEGATIVE_INFINITY) return -3.40282346638528860e+38;
  else if(out == Double.POSITIVE_INFINITY) return 3.40282346638528860e+38;
  
  return out;
  
}

double getDoubleMin(double[] array_){
  
   double out = Double.POSITIVE_INFINITY;
   
   for(int i = 0; i < array_.length; i++){ if(array_[i] < out) { out = array_[i]; }}  
   
   return out;
 
}

double[] matrixMult(double[][] a_, double[] b_){
  
    return new double[]{ 
    
        a_[0][0] * b_[0] + a_[1][0] * b_[1],
        a_[0][1] * b_[0] + a_[1][1] * b_[1]

    };
  
}

double[] matrixMultiplication2Dx1D(double[][] a_, double[] b_){

    return new double[]{ 
    
        a_[0][0] * b_[0] + a_[0][1] * b_[1] + a_[0][2] * b_[2],
        a_[1][0] * b_[0] + a_[1][1] * b_[1] + a_[1][2] * b_[2],
        a_[2][0] * b_[0] + a_[2][1] * b_[1] + a_[2][2] * b_[2]

    };
  
}

double[][] scalarMultiplier2D(double[][] matrix_, double scalar_){
  
    double[][] out = new double[matrix_.length][matrix_[0].length];
  
    for(int i = 0; i < matrix_.length; i++){
      for(int j = 0; j < matrix_[0].length; j++){
        
          out[i][j] = matrix_[i][j] / scalar_;
        
      }
    }
    return out;
  
}
double[][] transposeMatrix2D(double[][] matrix_){
  
  double[][] out = new double[matrix_.length][matrix_[0].length];
  
  for(int i = 0; i < matrix_.length; i++){
    for(int j = 0; j < matrix_.length; j++){
  
        out[j][i] = matrix_[i][j];
      
    }
  }
  
  return out;

}

String displayMatrix2D(double[][] matrix_){
  
     String output = "";
     for(int j = 0; j < matrix_.length; j++){
       
      String currentLine = "";
      
      for(int i = 0; i < matrix_[0].length; i++){
       
          currentLine += nf((float)matrix_[i][j], 2, 0) + " ";
        
      }
      
      output += currentLine + "\n";
      
     } 
     
     return output;
  
}
