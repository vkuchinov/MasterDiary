/*

BEAN MACHINE [known as Galton box]
based on Daniel Shiftman box2D library

REFERENCE:

https://en.wikipedia.org/wiki/Bean_machine

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Particle> particles;

Wall left;
Wall right;
Wall floor;

ArrayList<Wall> partitions = new ArrayList<Wall>();

PinList grid;
Pin pin;

void setup() {
  
  size(400, 800);
  smooth();

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  // Turn on collision listening!
  box2d.listenForCollisions();

  // Create the empty list
  particles = new ArrayList<Particle>();

  left = new Wall(34, 500, 2, 800);
  right = new Wall(width - 44, 500, 2, 800);
  floor = new Wall(width/2, 800, 400, 10);
  grid = new PinList(15, 17, 10.0);
  
  for(int p = 0; p < 21; p++){
     partitions.add(new Wall(34 + p * 15.3, 800, 2, 726));
  }
  
}

void draw() {
  
  background(255);

  if(frameCount % 90 == 0){
    float sz = 5.0;
    particles.add(new Particle(width/2, 0, sz));
  }


  // We must always step through time!
  box2d.step();

  // Look at all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }

  left.display();
  right.display();
  floor.display();
  
  for(int p = 0; p < partitions.size(); p++){
     partitions.get(p).display(); 
  }
  grid.display();

}


// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Particle.class && o2.getClass() == Particle.class) {
    Particle p1 = (Particle) o1;
    p1.change();
    Particle p2 = (Particle) o2;
    p2.change();
  }

}

// Objects stop touching each other
void endContact(Contact cp) {
}

















