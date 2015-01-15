class CAR {
  PVector loc, l, r;
  PImage car;

  CAR() {
    car = loadImage("car.png");
    loc = new PVector(720, height-100);
    l = new PVector(-4, 0);
    r = new PVector(4, 0);
  }
  void create() {
    imageMode(CENTER);
    image(car, loc.x, loc.y);
  }
  void move() {
    if (keyPressed) {
      if (loc.x>500) {
        if (keyCode == LEFT) {
          loc.add(l);
        }
      }
      if (loc.x<920) {
        if (keyCode == RIGHT) {
          loc.add(r);
        }
      }
    }
  }
}

