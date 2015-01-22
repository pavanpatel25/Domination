class NAEE {
  PVector loc, vel;
  PImage egg;

  NAEE() {
    imageMode(CENTER);
    loc = new PVector(random(500, 900), 0);
    vel = new PVector(0, 10);
    egg = loadImage("egg.png");
  }

  void create() {
    image(egg, loc.x, loc.y);
  }
  void move() {
    loc.add(vel);
  }
}

