BASKETBALL b;
RACINGEASY r1;
RACINGMEDIUM r2;
RACINGHARD r3;
MAZE m;
LASERS l;
LAVA lm;
PImage bkg, bkg2;
PImage Main;
int gamevariable=0;
PImage cursor;
void setup() {
  size(1440, 900);
  Main = loadImage("Main Screen Background.png");
  cursor = loadImage("cursor.png");
  bkg2 = loadImage("Main Screen Background2.png");
  textAlign(CENTER, CENTER);
  textSize(50);
  b = new BASKETBALL();
  r1 = new RACINGEASY();
  r2 = new RACINGMEDIUM();
  r3 = new RACINGHARD();
  m = new MAZE();
  l = new LASERS();
  lm = new LAVA();
  noCursor();
}

void draw() {
  if (gamevariable == 0) {
    imageMode(CORNER);
    image(Main, 0, 0);
    image(cursor, mouseX, mouseY);
    b.time = 0;
    b.score = 0;
    if (mousePressed) {
      if (mouseY>513 && mouseY<639) {
        //BasketBall
        if (mouseX>19 && mouseX<282) {
          gamevariable = 1;
        }
        //Racing Game
        if (mouseX>307 && mouseX<571) {
          gamevariable = 2;
        }
        //Lava Monster
        if (mouseX>592 && mouseX<857) {
          gamevariable = 3;
        }
        //Maze Game
        if (mouseX>875 && mouseX<1140) {
          gamevariable = 4;
        }
        //Laser Game
        if (mouseX>1160 && mouseX<1423) {
          gamevariable = 5;
        }
      }
    }
  }
  //BASKETBALL STOP/START
  if (gamevariable==1 && b.score<=100000) {
    b.game();  
    if (b.time == 0) {
      text(b.score, width/2, 100);
    }
  }
  if (gamevariable == 1 && b.score>=100000) {
    gamevariable = 0;
    b = new BASKETBALL();
  }
  //RACING STOP/START
  if (gamevariable == 2 ) {
    image(bkg2, 0, 0);
    image(cursor, mouseX, mouseY);
    gamevariable = 100;
  }
  if (gamevariable == 100) {
    image(bkg2, 0, 0);
    image(cursor, mouseX, mouseY);
    if (mousePressed) {
      if (mouseX>308 && mouseX<638) {
        if (mouseY>636 && mouseY<709) {
          gamevariable = 101;
        }
        if (mouseY>709 && mouseY<780) {
          gamevariable = 102;
        }
        if (mouseY>780 && mouseY<850) {
          gamevariable = 103;
        }
      }
    }
    if (mousePressed) {
      if (mouseY>513 && mouseY<639) {
        //BasketBall
        if (mouseX>19 && mouseX<282) {
          gamevariable = 1;
        }
        //Racing Game
        if (mouseX>307 && mouseX<571) {
          gamevariable = 2;
        }
        //Lava Monster
        if (mouseX>592 && mouseX<857) {
          gamevariable = 3;
        }
        //Maze Game
        if (mouseX>875 && mouseX<1140) {
          gamevariable = 4;
        }
        //Laser Game
        if (mouseX>1160 && mouseX<1423) {
          gamevariable = 5;
        }
      }
    }
  }
if (gamevariable == 101) {
  r1.bkg();
  r1.obstacles();
  r1.car();
  r1.crash();
}
if (gamevariable == 101 && r1.time2 >=180) {
  gamevariable = 0;
  r1 = new RACINGEASY();
}
if (gamevariable == 102) {
  r2.bkg();
  r2.obstacles();
  r2.car();
  r2.crash();
}
if (gamevariable == 102 && r2.time2 >=180) {
  gamevariable = 0;
  r2 = new RACINGMEDIUM();
}
if (gamevariable == 103) {
  r3.bkg();
  r3.obstacles();
  r3.car();
  r3.crash();
}
if (gamevariable == 103 && r3.time2 >=180) {
  gamevariable = 0;
  r3 = new RACINGHARD();
}
//LAVAMONSTER STOP/START
if (gamevariable == 3 && lm.time <=180) {
  lm.game();
}
if (gamevariable == 3 && lm.time >=180) {
  gamevariable = 0;
  lm = new LAVA();
}

//MAZE GAME STOP/START
if (gamevariable == 4 && m.time <=180) {
  fill(0);
  m.game();
}
if (gamevariable == 4 && m.time >=180) {
  gamevariable = 0;
  m = new MAZE();
}
//LASER GAME STOP/START
if (gamevariable == 5 && l.time <=180) {
  l.game();
}
if (gamevariable == 5 && l.time >=180) {
  gamevariable = 0;
  l = new LASERS();
}
}
void mouseClicked() {
  b.a.add(new BBall(b.x, b.y, -1*b.speed));
  b.speed = 0;
}

