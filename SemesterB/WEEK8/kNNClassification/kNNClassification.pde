/*

k-NN 
[k-nearest neighbors algorithm, pattern recognition]

In pattern recognition, the k-nearest neighbors algorithm (k-NN) is a non-parametric method used for 
classification and regression.

In both cases, the input consists of the k closest training examples in the feature space. 
The output depends on whether k-NN is used for classification or regression:

In k-NN classification, the output is a class membership. An object is classified by a majority vote of 
its neighbors, with the object being assigned to the class most common among its k nearest neighbors 
(k is a positive integer, typically small). If k = 1, then the object is simply assigned to the class 
of that single nearest neighbor.

In k-NN regression, the output is the property value for the object. This value is the average of the values of 
its k nearest neighbors.

REFERENCES:
https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm

@author Vladimir V KJUCHINOV
@email  helloworld@vkuchinov.co.uk

*/



import controlP5.*;

ControlP5 cp5;
int k = 1;

import java.util.Collections;
import java.util.Comparator;
import java.util.Set;

kNN classification = new kNN();
int size = 20;
float n = 32;
ObjectList data = new ObjectList();

color[] scheme = new color[]{#105187, #2C8693, #F0F1D5, #F19722, #C33325};

void setup(){
  
    size(600, 600);
    
    cp5 = new ControlP5(this);

    cp5.addSlider("k").setPosition(16, 16).setRange(1, n);
     
    for(int i = 0; i < n; i++){
      
      float x = random(0, width);
      float y = random(0, height);
      int category = round(random(0, 4));
      
      data.add(new Object(x, y, category));
      
    }

}

void draw(){
  
   background(0);
   classification.update(k);
   data.draw();
  
}
