/*

PEARSON CORRELATION CO-EFFICIENT
[PCC, Pearson's R, the Pearson product-moment correlation 
coefficient (PPMCC) or the bivariate correlation]
in comparison with Eucledian distance

REFERENCES:
https://en.wikipedia.org/wiki/Pearson_correlation_coefficient

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float[] dataA = new float[]{ 2.5, 1.25, 5.6, 3.45, 1.40, 4.40 };
float[] dataB = new float[]{ 0.75, 3.55, 4.06, 6.45, 4.00, 4.00 };

void setup(){
  
  println(euclidean(dataA, dataB));
  println(pearson(dataA, dataB));

}

float euclidean(float[] setA_, float[] setB_) {

   float sum = 0;
   
   for (int i = 0; i < setA_.length; i++) {

      float valueA = setA_[i];
      float valueB = setB_[i];
      float diff = valueA - valueB;

      sum += diff * diff;
 
  }

  return 1.0 / (1 + sqrt(sum));
  
}

float pearson(float[] setA_, float[] setB_) {

  float sum1 = 0, sum2 = 0, sum1sq = 0, sum2sq = 0, pSum = 0, n = 0;
  
  for (int  i = 0; i < setA_.length; i++) {

      float valueA = setA_[i];
      float valueB = setB_[i];
      
      sum1 += valueA;
      sum2 += valueB;
      sum1sq += (valueA * valueA);
      sum2sq += (valueB * valueB);
      pSum += (valueA * valueB);
      n++;

  }

  if(n == 0) { return 0; }

  float num = pSum - (sum1 * sum2 / n);
  float den = sqrt((sum1sq - sum1 * sum1 / n) * (sum2sq - sum2 * sum2 / n));
  if (den == 0) { return 0; }
  
  return num / den;
  
}
