class BASKETBALL {
  float speed=0;
  ArrayList<BBall> b = new ArrayList<BBall>();
  PImage dino;

  BASKETBALL() {
    rectMode(CORNER);
    dino = loadImage("dinosaur.png");
    noCursor();
  }
  void game() {
    background(255);
    if (keyPressed) {
      if (key == ' ') {
        if (speed <= 37.5) {
          speed=speed+.25;
        }
      }
    }
    for ( int i = 0; i<b.size (); i++) {
      BBall currentBall = b.get(i);
      currentBall.create();
      currentBall.shoot();
      currentBall.bounce();
      currentBall.score();
    }
    fill(255);
    rect(0, 0, 150, 50);
    fill(255, 0, 0);
    rect(0, 0, speed*4, 50);
    fill(0);
    rect(0, height/2-100, 20, 200);
    rect(0, height/2+60, 100, 20);
    image(dino, mouseX, height-75);
  }
  void mouseClicked() {
    b.add(new BBall(mouseX, -1*speed));
    speed = 0;
  }
}

