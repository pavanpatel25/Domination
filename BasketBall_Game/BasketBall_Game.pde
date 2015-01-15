class BASKETBALL {
  int score, time;
  float speed=0;
  ArrayList<BBall> a = new ArrayList<BBall>();
  PImage dino;
  PImage bkg;
  float x, y;

  BASKETBALL() {
    rectMode(CORNER);
    dino = loadImage("dinosaur.png");
    bkg = loadImage("background.png");
  }
  void game() {
    noCursor();

    image(bkg, 0, 0);
    if (speed <= 37.5) {
      speed=speed+.25;
    }
    for ( int i = 0; i<a.size (); i++) {
      BBall currentBall = a.get(i);
      currentBall.create();
      currentBall.shoot();
      currentBall.bounce();
      currentBall.bounceFloor();
      if (currentBall.score()) {
        score++;
      }
    }
    if (score >= 20) {
      time =time+1;
    }
    fill(0);
    if (time < 300 && time > 1) {
      text("YOU WON", width/2, 100);
    }
    if (time>300) {
      score = 100000;
      time = 0;
    }
    noFill();
    rect(0, 0, 150, 50);
    fill(255, 0, 0);
    rect(0, 0, speed*4, 50);
    fill(0);
    rect(0, height/2-100, 20, 200);
    rect(0, height/2+60, 100, 20);
    image(dino, x, y);
    if (mouseX>width/2) {
      x=mouseX;
      y=mouseY;
    } else {
      x=width/2;
      y=mouseY;
    }
  }
}

