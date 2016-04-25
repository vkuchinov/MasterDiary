/*

Genetic Algorithms: Genesis
a very basic exercise for planning a proper genetic
algorithm structure and data transition.

This example is based just on a collection of 16-letters
words database.

Selects any 5 of these and press 'space' for a next generation.

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int counter = 0;
float margined;
UI[] gaUI;
Species[] population;
Species[] chosenOnes = new Species[5];

int wordLength = 16;

int popNum = 20;
int value;
int selected = 0;
int generation = 0;

String words[];
PFont font;

void setup() {

  font = loadFont("CousineBold2.vlw");
  words = loadStrings("words16.txt");

  size(800, 650);  
  background(128); 

  margined = (width-40)/5;
  //buid interface
  gaUI = new UI[popNum];
  population = new Species[popNum];
  for (int r = 0; r < 4; r++)
  {
    for (int c = 0; c < 5; c ++)
    {
      gaUI[counter] = new UI(20+c*margined, 20+r*margined, margined, 6); 
      counter++;
    }
  }

  for (int s = 0; s < popNum; s++)
  {
    population[s] = new Species(words[int(random(0, words.length))]);
  }
}

void draw() {
  update(mouseX, mouseY);
}
void update(int x, int y) {
  counter = 0;
  for (int r = 0; r < 4; r++)
  {
    for (int c = 0; c < 5; c ++)
    {
      gaUI[counter].update(x, y, population[counter]);
      counter++;
    }
  }
}

void mousePressed() {

  if (mouseX > 20 && mouseX < width-20 && mouseY > 20 && mouseY < height - 20)
  {

    int counter = 0;
    for (int r = 0; r < 4; r++) {
      for (int c = 0; c < 5; c ++) {
        if (selected < 5 && mouseX > gaUI[counter].posX && mouseX <= gaUI[counter].posX + gaUI[counter].size && mouseY > gaUI[counter].posY && mouseY <= gaUI[counter].posY + gaUI[counter].size)
        {
          if (!gaUI[counter].clicked) { 
            gaUI[counter].clicked = true;
          } 
          else { 
            gaUI[counter].clicked = false;
          }
          println(counter);
          chosenOnes[selected] = population[counter];
          selected++;
        }
        counter++;
      }
    }
  }
}

void keyPressed() {
  if (keyPressed) {
    if (key == ' ' ) {
      println("Mating");
      if (selected == 5) {  
        Pool(population, chosenOnes);
      }
      for (int p=0; p < population.length; p++)
      {
        gaUI[p].clicked = false; 
        selected = 0;
      }
    }
  }
}

void Pool(Species[] oldGeneration, Species[] parents)
{

  Species[] newGeneration = new Species[20];
  for (int n=0; n < newGeneration.length; n++)
  {
    Species[] tmpParents = new Species[5];
    arrayCopy(parents, tmpParents);
    int randomParent = int(random(0, 5));
    Species currentParent = tmpParents[randomParent];
    subset(tmpParents, randomParent, 1);
    for (int m = 0; m < tmpParents.length; m++) {
      int randomMate = int(random(0, tmpParents.length));

      String newDNA = mixDNA(currentParent.dna, tmpParents[randomMate].dna);
      newGeneration[n] = new Species(newDNA);
    }
  }

  arrayCopy(newGeneration, population
    );
}
String mixDNA(String parent1, String parent2)
{
  String child = "";

  for (int l=0; l < wordLength; l++)
  {
    if (random(0, 100) >99) { 
      child += char(int(random(97, 112)));
    } 
    else {
      if (random(0, 1) < 0.5) { 
        child += parent1.charAt(l);
      } 
      else {
        child+=parent2.charAt(l);
      }
    }
  } 
  return child;
}

