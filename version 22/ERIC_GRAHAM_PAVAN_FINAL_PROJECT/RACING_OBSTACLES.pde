class OBST {
  
  //initializing variables
  PVector loc, vel;
  PImage dog, bird;
  int variable;

  OBST() {
    imageMode(CENTER);
    
    //location and velocity variables
    loc = new PVector(random(500, 910), 0);
    vel = new PVector(0, 10);
    
    //if the variable is 1, a dog shows up. if the variable is 0, the bird shows up
    variable = int(random(0, 2));
    
    //loading images of dog and bird
    dog = loadImage("dog.png");
    bird = loadImage("bird.png");
  }

  void create() {
    imageMode(CENTER);
    
    //creating the images
    if (variable == 1) {
      image(dog, loc.x, loc.y);
    }
    if (variable == 0) {
      image(bird, loc.x, loc.y);
    }
  }
  void move() {
    
    //moving the images
    loc.add(vel);
  }
}

