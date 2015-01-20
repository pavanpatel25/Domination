class BBall {
  PVector loc, vel, acc, b;
  float sz;
  PImage bball;

  BBall(float locationX, float locationY, float speed) {
    loc = new PVector(locationX, locationY);
    vel = new PVector(speed, speed);
    acc = new PVector(0, 1.5);
    sz = 20;
    b = new PVector(-1, 1);
    bball = loadImage("basketball.png");
  }

  void create() {
    fill(255);
    image(bball, loc.x, loc.y);
  }
  void shoot() {
    vel.add(acc);
    loc.add(vel);
  }
  void bounce() {
    if (loc.y>=height/2-100 && loc.y<height/2+100 && loc.x<=20 && loc.x>0) {
      vel.x=-vel.x;
    }
  }
  void bounceFloor() {
    if (loc.y>=height) {
      vel.y=-vel.y;
    }
  }
  boolean score() {
    if ( loc.y>=height/2+60 && loc.y<= height/2+80 && loc.x<=100 && loc.x>=0 && vel.y>=1) {
      return true;
    } else {
      return false;
    }
  }
}

