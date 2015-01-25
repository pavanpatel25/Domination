//basketball game
BASKETBALL b;
//racing game
RACINGEASY r1;
RACINGMEDIUM r2;
RACINGHARD r3;
//maze game
A m;
//lasers game
LASERS l;
//lava monster game
LAVA lm;

//loads welcome screen
/*
bkg is the background for basketball game
 Main is the initial welcome screen
 bkg2 appears to display levels when racing game is selected
 */
PImage bkg, bkg2;
PImage Main;
PImage cursor;
PImage knight;

int gamevariable=0;

//sound
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer hoops;
AudioPlayer pew_pew;
AudioPlayer pokemon;
AudioPlayer vroom;
AudioPlayer vroom2;
AudioPlayer vroom3;
AudioPlayer donde;

void setup() {
  size(1440, 900);

  //loading backgrounds and cursor
  Main = loadImage("Main Screen Background.png");
  cursor = loadImage("cursor.png");
  bkg2 = loadImage("Main Screen Background2.png");
  knight = loadImage("dinosaurback.png");
  textAlign(CENTER, CENTER);
  textSize(50);

  //loading mini games
  b = new BASKETBALL();
  r1 = new RACINGEASY();
  r2 = new RACINGMEDIUM();
  r3 = new RACINGHARD();
  m = new A();
  l = new LASERS();
  lm = new LAVA();

  noCursor();
  //loading sound files
  minim = new Minim(this);
  hoops = minim.loadFile("Happy.mp3");
  pew_pew = minim.loadFile("Funk.mp3");
  pokemon = minim.loadFile("pokemon.mp3");
  vroom = minim.loadFile("Power.mp3");
  vroom2 = minim.loadFile("Power.mp3");
  vroom3 = minim.loadFile("Power.mp3");
  donde = minim.loadFile("pokemon.mp3");
}

void draw() {

  //main screen 
  if (gamevariable == 0) {
    imageMode(CORNER);
    image(Main, 0, 0);
    image(cursor, mouseX, mouseY);
    b.time = 0;
    b.score = 0;

    //creating buttons
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
    hoops.play();
  }
  if (gamevariable == 1 && b.score>=100000) {
    gamevariable = 0;
    b = new BASKETBALL();
    hoops.close();
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

      //choosing between three racing levels
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

  //easy level start+stop
  if (gamevariable == 101) {
    r1.bkg();
    r1.obstacles();
    r1.car();
    r1.crash();
    vroom.play();
  }

  if (gamevariable == 101 && r1.time2 >=60) {
    gamevariable = 0;
    r1 = new RACINGEASY();
    vroom.close();
  }

  //medium level start+stop
  if (gamevariable == 102) {
    r2.bkg();
    r2.obstacles();
    r2.car();
    r2.crash();
    vroom2.play();
  }
  if (gamevariable == 102 && r2.time2 >=60) {
    gamevariable = 0;
    r2 = new RACINGMEDIUM();
    vroom2.close();
  }

  //hard level start+stop
  if (gamevariable == 103) {
    r3.bkg();
    r3.obstacles();
    r3.car();
    r3.crash();
    vroom3.play();
  }
  if (gamevariable == 103 && r3.time2 >=60) {
    gamevariable = 0;
    r3 = new RACINGHARD();
    vroom3.close();
  }

  //LAVAMONSTER STOP+START
  if (gamevariable == 3 && lm.time <=180) {
    lm.game();
    pokemon.play();
  }
  if (gamevariable == 3 && lm.time >=180) {
    gamevariable = 0;
    lm = new LAVA();
    pokemon.close();
  }

  //MAZE GAME STOP+START
  if (gamevariable == 4 && m.time <=180) {
    fill(50);
    m.display();
    m.move();
    m.shooters();
    m.score();
    donde.play();
  }
  if (gamevariable == 4 && m.time >=180) {
    gamevariable = 0;
    m = new A();
    donde.close();
  }

  //LASER GAME STOP+START
  if (gamevariable == 5 && l.time <=180) {
    l.game();
    pew_pew.play();
  }
  if (gamevariable == 5 && l.time >=180) {
    gamevariable = 0;
    l = new LASERS();
    pew_pew.close();
  }
}
void mouseClicked() {
  //mouseclicking for basketball game
  if (gamevariable == 1) {
    b.a.add(new BBall(b.x, b.y, -1*b.speed));
    b.speed = 0;
  }
}

