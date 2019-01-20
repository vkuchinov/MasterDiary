import java.util.Random;

int counter = 0;
float margined;
UI[] gaUI;
Species[] population;
Species[] chosenOnes = new Species[5];

int popNum = 20;
int value;
int selected = 0;
int generation = 0;

Random seed = new Random(12345);

void setup() {

  size(800, 650, "processing.core.PGraphicsRetina2D");  
  background(0); 
  frameRate(12);

  margined = (width-40)/5;
  //buid interface
  gaUI = new UI[popNum];

  for (int r = 0; r < 4; r++)
  {
    for (int c = 0; c < 5; c ++)
    {
      gaUI[counter] = new UI(20+c*margined, 20+r*margined, margined, 6); 
      counter++;
    }
  }

    
  population = new Species[popNum];
  
  
  for (int s = 0; s < popNum; s++)
  {
    population[s] = new Species(seed.nextInt(999));
  }
}

void draw() {

  update(mouseX, mouseY);
  
}

void update(int x, int y) {
  counter = 0;
  for (int r = 0; r < 4; r++)
  {
    for (int c = 0; c < 5; c++)
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
          population[counter].animationToConsole();
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

      String newDNA = mixDNA(currentParent.getDNA(), tmpParents[randomMate].getDNA());
      newGeneration[n] = new Species(newDNA);
    }
  }

  arrayCopy(newGeneration, population
    );
}


String mixDNA(String parent1, String parent2)
{
  String child = "";

  for (int l = 0; l < parent1.length(); l++)
  {
    //mutation
    if (random(0, 100) > 99) { 
      child += "0";
    } 
    else {
      if (random(0, 1) < 0.5) { 
        child += parent1.charAt(l);
      } 
      else {
        child += parent2.charAt(l);
      }
    }
  } 
  return child;
}

