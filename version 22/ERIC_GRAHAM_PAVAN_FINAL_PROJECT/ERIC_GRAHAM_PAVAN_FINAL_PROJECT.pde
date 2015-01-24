
class BASKETBALL {
  //score and time
  int score, time;
  float speed=0;

  //making new balls
  ArrayList<BBall> a = new ArrayList<BBall>();
  PImage dino;

  //windows xp background
  PImage bkg;

  //position of dinosaur
  float x, y;

  BASKETBALL() {
    //images of background and dinosaur
    rectMode(CORNER);
    dino = loadImage("dinosaur.png");
    bkg = loadImage("background.png");
  }
  void game() {

    rectMode(CORNER);
    noCursor();

    image(bkg, 0, 0);
    if (speed <= 37.5) {
      speed=speed+.25;
    }

    //ball movement
    for ( int i = 0; i<a.size (); i++) {
      BBall currentBall = a.get(i);
      currentBall.create();
      currentBall.shoot();
      currentBall.bounce();
      currentBall.bounceFloor();
      //scoring points
      if (currentBall.score()) {
        score++;
      }
    }
    //winning the game
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
    //power of the shooting ball
    noFill();
    rect(0, 0, 150, 50);
    fill(255, 0, 0);
    rect(0, 0, speed*4, 50);
    
    //basketball hoop and backboard
    fill(0);
    rect(0, height/2-100, 20, 200);
    rect(0, height/2+60, 100, 20);
    image(dino, x, y);

    //mouse controls dinosaur position
    if (mouseX>width/2) {
      x=mouseX;
      y=mouseY;
    } else {
      x=width/2;
      y=mouseY;
    }
  }
}

