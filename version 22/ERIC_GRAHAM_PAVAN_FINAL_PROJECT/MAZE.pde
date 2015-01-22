class A {
  float x;
  float y;
  float ye;
  float x1;
  float y1;
  float x2;
  float y2;
  int lives;
  int time=0;
  PImage bkg;

  A() {
    x=40;
    y=400;
    ye=25;
    x1=750;
    y1=387.5;
    x2=750;
    y2=412.5;
    lives=3;
    bkg = loadImage("mazebkg.png");
  }

  void display() {
    background(255);
    image(bkg, 10, 10);
    image(knight, x, y, 25, 25);
    noFill();
    strokeWeight(20);
    //Upper walls
    for (int i=1; i<11; i++) {
      line(i*70+10, 50, i*70+10, i*30);
      //You shall not pass! Upper section.
      if (y<i*30) {
        if (y>50) {
          if (x>i*70+10) {
            if (x<i*70+10+10) {
              x=x+35;
            }
          }
          if (x<i*70+10) {
            if (x>i*70+10-10) {
              x=x-35;
            }
          }
        }
      }
    }

    //Lower walls
    for (int i=1; i<11; i++) {
      line(i*70+10, 750, i*70+10, 800-i*30);
      //You shall not pass! Lower section
      if (y<750) {
        if (y>800-i*30) {
          if (x>i*70+10) {
            if (x<i*70+10+10) {
              x=x+35;
            }
          }
          if (x<i*70+10) {
            if (x>i*70+10-10) {
              x=x-35;
            }
          }
        }
      }
    }

    //Middle walls
    for (int i=1; i<9; i++) {
      line(i*70+10, i*30+75, i*70+10, 800-i*30-75);
      //You shall not pass! Middle section
      if (y>i*30+75) {
        if (y<800-i*30-75) {
          if (x>i*70+10) {
            if (x<i*70+10+10) {
              x=x+35;
            }
          }
          if (x<i*70+10) {
            if (x>i*70+10-10) {
              x=x-35;
            }
          }
        }
      }
    }
  }

  void move() {
    //Movement
    if (keyPressed==true) {
      if (key == CODED) {
        if (keyCode == RIGHT && x<=800) {
          x=x+2;
        }
        if (keyCode == LEFT) {
          x=x-2;
        }
        if (keyCode == DOWN && x<800) {
          y=y+2;
        }
        if (keyCode == UP) {
          y=y-2;
        }
      }
    }
  }

  void shooters() {
    //Upper shooters
    for (int i=1; i<10; i++) {
      strokeWeight(1);
      ellipse(i*70+10+35, 25, 25, 25);
    }

    //Upper shooters projectiles
    for (int i=1; i<10; i++) {
      fill(11, 24, 237);
      strokeWeight(1);
      ellipse(i*70+58, ye, 10, 10);
      ye=ye+0.25;
      if (ye>800) {
        ye=25;
      }
      if (abs(x-i*70-10-35)<10) {
        if (abs(ye-y)<10) {
          x=40;
          y=400;
          lives=lives-1;
        }
      }
    }

    //End shooters
    noFill();
    ellipse(750, 387.5, 25, 25);
    ellipse(750, 412.5, 25, 25);
    fill(11, 24, 237);

    //End shooters projectiles
    ellipse(x1, y1, 10, 10);
    y1=y1-1;
    x1=x1-2;
    if (x1<0) {
      x1=750;
      y1=387.5;
    }
    if (abs(x-x1)<10) {
      if (abs(y-y1)<10) {
        x=40;
        y=400;
        lives=lives-1;
      }
    }
    ellipse(x2, y2, 10, 10);
    y2=y2+1;
    x2=x2-2;
    if (x2<0) {
      x2=750;
      y2=412.5;
    }
    if (abs(x-x2)<10) {
      if (abs(y-y2)<10) {
        x=40;
        y=400;
        lives=lives-1;
      }
    }
  }

  void score() {
    textSize(50);
    text(lives, 25, 50);

    if (lives<1) {
      textSize(25);
      text("You lose!", 587.5, 400);
      time = time + 1;
    }

    if (x>700) {
      textSize(25);
      text("You win!", 587.5, 400);
      time = time + 1;
    }
  }
}

