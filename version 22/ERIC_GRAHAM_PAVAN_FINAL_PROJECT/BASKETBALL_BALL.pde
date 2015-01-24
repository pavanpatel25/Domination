class BBall {
  //movement of the balls
  PVector loc, vel, acc, b;
  //size
  float sz;
  //image of ball
  PImage bball;

//movement of balls
  BBall(float locationX, float locationY, float speed) {
    loc = new PVector(locationX, locationY);
    vel = new PVector(speed, speed);
    acc = new PVector(0, 1.5);
    sz = 20;
    b = new PVector(-1, 1);
    bball = loadImage("basketball.png");
  }
  
//making new balls
  void create() {
    fill(255);
    image(bball, loc.x, loc.y);
  }
  
  //shooting balls
  void shoot() {
    vel.add(acc);
    loc.add(vel);
  }
  
  //movement of ball when it bounces off ground
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
  
  //score that displays in middle of screen
  boolean score() {
    if ( loc.y>=height/2+60 && loc.y<= height/2+80 && loc.x<=100 && loc.x>=0 && vel.y>=1) {
      return true;
    } else {
      return false;
    }
  }
}

