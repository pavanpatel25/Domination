BASKETBALL b;
RACING r;
MAZE m;
LASERS l;
PImage bkg,bkg2;
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
  r = new RACING();
  m = new MAZE();
  l = new LASERS();
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
  if (gamevariable == 2 && r.time2 <=180) {
    image(bkg2,0,0);
    image(cursor, mouseX, mouseY);
    println(mouseX);
    println(mouseY);
    println();
  }
   /* r.bkg();
    r.obstacles();
    r.car();
    r.crash();
  }*/
  if (gamevariable == 2 && r.time2 >=180) {
    gamevariable = 0;
    r = new RACING();
  }
//LAVAMONSTER STOP/START

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

