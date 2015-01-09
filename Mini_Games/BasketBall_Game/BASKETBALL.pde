class BBall {
  PVector loc, vel, acc, b;
  float sz;
  int sc;
  PImage bball;

  BBall(float locationX, float speed) {
    loc = new PVector(locationX, height);
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
    if (loc.y>=height/2-100 && loc.y<height/2+100 && loc.x<=20) {
      vel.x=-vel.x;
    }
  }
  void score() {
    if ( loc.y>=height/2+60 && loc.y<= height/2+80 && loc.x<=100) {
      sc=sc+1;
    }
  }
}

