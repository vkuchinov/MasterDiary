/*
FIBONACCI SPIRAL
Ψ = 137.5077° with colored Fibonacci spirals

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

float toRadians = PI / 180.0;
float gAngle = 137.5077640844293;

float rotation = 0.0;
float initialRotation = 0.0;

final int NUM_PETALS = 1400;
Petal[] petals = new Petal[NUM_PETALS];
float radiusGrowth = 1.002;
float radius = 20;
   
void setup() {

    size(800, 800);
    noStroke();
    smooth();
    background(0);
    
    for (int p = 0; p < NUM_PETALS; p++) {
      
        rotation += gAngle;
        radius *= radiusGrowth;
        Petal petal = new Petal(p);
        petal.x = width / 2 + cos(radians(rotation)) * radius;
        petal.y = height / 2 + sin(radians(rotation)) * radius;
        petal.rotation = radians(rotation);
        petal.render();
        petals[p] = petal;
    }
}
