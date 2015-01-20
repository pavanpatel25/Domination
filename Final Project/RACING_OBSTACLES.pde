class OBST {
  PVector loc, vel;
  PImage dog, bird;
  int variable;

  OBST() {
    imageMode(CENTER);
    loc = new PVector(random(500,900), 0);
    vel = new PVector(0, 10);
    variable = int(random(0, 2));
    dog = loadImage("dog.png");
    bird = loadImage("bird.png");
  }

  void create() {
    imageMode(CENTER);
    if (variable == 1) {
      image(dog, loc.x, loc.y);
    }
    if (variable == 0) {
      image(bird, loc.x, loc.y);
    }
  }
  void move() {
    loc.add(vel);
  }
}

