import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.spi.*; 
import ddf.minim.signals.*; 
import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.ugens.*; 
import ddf.minim.effects.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class DOMINATION extends PApplet {

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







Minim minim;
AudioPlayer hoops;
AudioPlayer pew_pew;
AudioPlayer pokemon;
AudioPlayer vroom;
AudioPlayer vroom2;
AudioPlayer vroom3;
AudioPlayer donde;

public void setup() {
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

public void draw() {

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

  //easy level start/stop
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

  //medium level start/stop
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

  //hard level start/stop
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

  //LAVAMONSTER STOP/START
  if (gamevariable == 3 && lm.time <=180) {
    lm.game();
    pokemon.play();
  }
  if (gamevariable == 3 && lm.time >=180) {
    gamevariable = 0;
    lm = new LAVA();
    pokemon.close();
  }

  //MAZE GAME STOP/START
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

  //LASER GAME STOP/START
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
public void mouseClicked() {
  //mouseclicking for basketbal game
  if (gamevariable == 1) {
    b.a.add(new BBall(b.x, b.y, -1*b.speed));
    b.speed = 0;
  }
}

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
    acc = new PVector(0, 1.5f);
    sz = 20;
    b = new PVector(-1, 1);
    bball = loadImage("basketball.png");
  }
  
//making new balls
  public void create() {
    fill(255);
    image(bball, loc.x, loc.y);
  }
  
  //shooting balls
  public void shoot() {
    vel.add(acc);
    loc.add(vel);
  }
  
  //movement of ball when it bounces off ground
  public void bounce() {
    if (loc.y>=height/2-100 && loc.y<height/2+100 && loc.x<=20 && loc.x>0) {
      vel.x=-vel.x;
    }
  }
  public void bounceFloor() {
    if (loc.y>=height) {
      vel.y=-vel.y;
    }
  }
  
  //score that displays in middle of screen
  public boolean score() {
    if ( loc.y>=height/2+60 && loc.y<= height/2+80 && loc.x<=100 && loc.x>=0 && vel.y>=1) {
      return true;
    } else {
      return false;
    }
  }
}

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
  public void game() {

    rectMode(CORNER);
    noCursor();

    image(bkg, 0, 0);
    if (speed <= 37.5f) {
      speed=speed+.25f;
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

class LASERS {

  //variable for timer
  float p;

  //position of dinosaur
  int x = 0;
  int y = height/2;

  int dx = 25;
  int dy = 10;
  int time;

  //in order to set up time stopper
  boolean gameOver = false;

  //sets up how many lasers
  int count = 100;

  //movement of the lasers
  PVector[] loc1 = new PVector[count];
  PVector[] loc2 = new PVector[count];
  PVector[] vel = new PVector[count];
  PVector[] acc = new PVector[count];

  //size of the snowflakes
  float[] sz = new float[count];

  //image of dinosaur
  PImage dinosaur;

  LASERS() {

    //loading the image of the dinosaur
    dinosaur = loadImage("dino.png");
    imageMode(CORNER);

    //initialize variables for the movement of lasers
    for (int i = 0; i<count; i++) {
      //leftmost x coordinate for rectangle that represents lasers
      loc1[i] = new PVector(random(width/2, 2*width), random(5, height));
      //rightmost x-coordinate
      loc2[i] = new PVector(loc1[i].x-75, loc1[i].y+5);
      vel[i] = new PVector(-100, 0);
      acc[i] = new PVector(0, 0);
    }

    //timer
    noStroke();
  }

  public void game() {

    //black background
    background(0);

    //timer goes if game is not over
    if (!gameOver) {
      //adding to the timer based on frame rate
      p = p+.016666666666f;
    }

    //timer displays in top right corner of screen
    fill(255);
    text(p, width-100, 50);
    textSize(25);

    //prevents dinosaur from going off-screen
    if (y >= height) {
      y = height-dinosaur.height;
    }
    if (y <= 0) {
      y = 0;
    }

    //movement of dinosaur
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == DOWN) {
          y += dy;
        } 
        if (keyCode == UP) {
          y -= dy;
        }

        /* optional ability to move right/left
         if(keyCode == RIGHT) {
         x += dx;
         }
         if(keyCode == LEFT) {
         x -= dx;
         }
         */
      }
    }

    //image of dinosaur
    image(dinosaur, x, y, dinosaur.width/3, dinosaur.height/3);
    for (int i = 0; i < count; i++) {

      //movement of lasers
      if (!gameOver) {
        vel[i].add(acc[i]);
        loc1[i].add(vel[i]);
        loc2[i].add(vel[i]);
        vel[i].limit(3);
      }

      //draw laser
      rectMode(CORNERS);
      fill(247, 70, 70);
      rect(loc1[i].x, loc1[i].y, loc2[i].x, loc2[i].y);

      //recycling the lasers that move off the screen
      if (loc1[i].x<0) {
        loc1[i].x = width;
        loc2[i].x = width-75;
        loc1[i].y += 5;
        loc2[i].y += 5;
      }

      //GAME OVER
      if (loc1[i].x <= (x + dinosaur.width/3) && loc1[i].x >= x && loc1[i].y >= y && loc1[i].y <= (y+dinosaur.width/3) ) {
        gameOver = true;
        textSize(100);
        fill(255);
        text("GAME OVER!", width/3, height/2);
        time = time + 1;
        dy = 0;
        textSize(25);
        dx =0;
        vel[i].x = 0;
      }

      //increasing laser speed to make it harder to dodge them
      //level 2
      if ((p) > 15 && (p/1000) <= 25) {
        vel[i].x = 2*vel[i].x;
      }
      //level 3
      if ((p) >25 && (p/1000) <=35) {
        vel[i].x = 4*vel[i].x;
      }
      //level 4
      if ((p) >35) {
        vel[i].x = 6*vel[i].x;
      }
    }
  }
}

//Declare lava class
class LAVA {
  //Background picture
  PImage volcano;

  //Character's location
  float x = 400;
  float y = 500;

  //Declare array
  LavaMonster[] lava = new LavaMonster[1];

  //Declare player
  Player p;

  //Declare picture
  PImage knight;

  //Declare shooting variables
  float xe1 = 400;
  float ye1 = 360;
  float xe2 = 575;
  float ye2 = -25;

  //Declare time to end the game
  int time;

  //Declare fireballs
  Fireball1 f1;
  Fireball2 f2;

  //Class for lava monster and background
  LAVA() {
    //Background image
    volcano = loadImage("volcano.jpg");

    //Declare lava monster
    for (int i=0; i<1; i++) {
      lava[i] = new LavaMonster();
    }

    //Declare player and image
    p = new Player();
    knight = loadImage("dinosaur.png");

    //Declare fireballs
    f1 = new Fireball1();
    f2 = new Fireball2();
  }
  //Declater a master void to bring everything together - summing up all miniclasses
  public void game() {
    //Declare background and background image
    background(255, 255, 255);
    image(volcano, 0, 0, 800, 800);

    //Declare miniclasses
    for (int i=0; i<1; i++) {
      //Lava monster
      lava[i].display();
      lava[i].move();
      lava[i].rev();
      lava[i].bounce();
      lava[i].shoot(p);
      //Ending game
      if (lava[i].time == 1 || f1.time == 1  || f2.time == 1) {
        time = time + 1;
      }
      //Player
      p.display();
      p.move();
      p.poww();
      //Fireballs
      f1.display();
      f1.move();
      f1.reappear();
      f1.shoot(p);
      f2.display();
      f2.move();
      f2.reappear();
      f2.shoot(p);
    }
  }
}

//Lava monster class
class LavaMonster { 
  //Declare variables
  PVector loc, vel, loc2, vel2;
  float sz=10;
  float sz2=0;
  Player p;
  int time = 0;
  LavaMonster() {
    //Initialize some variables
    loc = new PVector(800/2, 100);
    vel = PVector.random2D();
    p = new Player();
  }

  //Displaying the objects
  public void display() {
    if (loc.dist(p.loc)>10) {
      fill(250, 75, 0);
      noStroke();

      //Lava monster
      ellipse(loc.x, loc.y, sz, sz);
      ellipse(loc.x, loc.y+sz, sz, sz*2);
      sz=sz*0.9975f;

      if (sz>25) {
        if (loc.y>675) {
          sz=sz+1;
        }
      }
      if (loc.y<125) {
        sz=sz+1;
      }
    }
  }
  //Moving the lava monster
  public void move() {
    loc.add(vel);
  }

  //Bouncing the lava monster, part 1
  public void rev() {
    if (loc.y+sz/2>600) {
      vel.y=-abs(vel.y);
    }
    if (loc.y-sz/2<100) {
      vel.y=abs(vel.y);
    }
    if (loc.y+sz2/2>600) {
      vel.y=-abs(vel.y);
    }
  }

  //Bouncing the lava monster, part 2
  public void bounce() {
    if (loc.x+sz/2>800) {
      vel.x=-abs(vel.x);
    }
    if (loc.x+sz2/2>800) {
      vel.x=-abs(vel.x);
    }
    if (loc.x-sz/2<0) {
      vel.x=abs(vel.x);
    }
    if (loc.x-sz2/2<0) {
      vel.x=abs(vel.x);
    }
  }

  //The lava monster/fireballs/player interaction
  public void shoot(Player p) {
    fill(250, 0, 0);
    if (loc.y>500) {
      sz2=100;
      ellipse(loc.x, loc.y, sz2, sz2);

      //If the player is hit
      if (loc.dist(p.loc)<sz2/2) {
        p.loc.x=10000;
        p.loc.y=10000;
        text("YOU LOSE!", 400, 400);
      }
    }

    //If the player is hit
    if (loc.y<300 || time == 1) {
      sz2=100;
      ellipse(loc.x, loc.y, sz2, sz2);
      if (loc.dist(p.loc)<sz2/2) {
        p.loc.x=10000;
        p.loc.y=10000;
        text("YOU LOSE!", 400, 400);
        time = 1;
      }
    }
  }
}

//Player class
class Player {
  //Declare variables
  PImage knight;
  PVector loc, vel, pos;

  Player() {
    //Initialize some variables
    loc = new PVector(380, 700);
    vel = new PVector(1, 1);
    pos = new PVector(400, 710);
    knight = loadImage("dinosaur.png");
  }

  public void display() {
    //Display the character and weapon
    ellipse(pos.x, pos.y, 5, 5);
    image(knight, loc.x, loc.y, 40, 40);
  }

  public void move() {
    //Moving the character
    if (key==CODED) {
      if (keyCode==UP) {
        vel.y=-abs(vel.y);
        loc.add(vel);
      }
    }
    if (key==CODED) {
      if (keyCode==RIGHT) {
        vel.x=abs(vel.x);
        loc.add(vel);
      }
    }
    if (key==CODED) {
      if (keyCode==DOWN) {
        vel.y=abs(vel.y);
        loc.add(vel);
      }
    }
    if (key==CODED) {
      if (keyCode==LEFT) {
        vel.x=-abs(vel.x);
        loc.add(vel);
      }
    }
  }

  public void poww() {
    //Shooting the weapon
    if (mousePressed) {
      pos.y=pos.y-10;
    }
    if (pos.y<0) {
      pos.y=700;
    }
  }
}

//Fireball class 1 - to the left
class Fireball1 {
  //Declare variables
  PVector loc, vel;
  int time = 0;

  Fireball1() {
    //Initialize some variables
    loc = new PVector(400, 360);
    vel = new PVector(0, 0);
  }

  //Draw the fireball
  public void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }

  //Move the fireball
  public void move() {
    //Moving to the side
    if (loc.x>285) {
      vel.x=-1;
    }
    //Moving to the side and down
    if (loc.x<285) {
      vel.x=-1;
      vel.y=0.80f;
    }
    loc.add(vel);
  }

  //Reappearing after moving off the screen
  public void reappear() {
    if (loc.x<-25) {
      loc.x=400;
      loc.y=360;
      vel.x=0;
      vel.y=0;
    }
  }

  //Attacking the player
  public void shoot(Player p) {
    if (loc.dist(p.loc)<25 || time == 1) {
      p.loc.x=10000;
      p.loc.y=10000;
      text("YOU LOSE!", 400, 400);
      time = 1;
    }
  }
}

//Fireball class 2 - to the right
class Fireball2 {
  //Declare the variables
  PVector loc, vel;
  int time = 0;
  Fireball2() {
    //Initialize some variables
    loc = new PVector(575, -25);
    vel = new PVector(0, 1);
  }

  //Draw the fireball
  public void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }

  //Move the fireball
  public void move() {
    //Moving to the side
    if (loc.y>360) {
      vel.x=1;
    }    
    loc.add(vel);
  }

  //Reappearing after moving off the screen
  public void reappear() {
    if (loc.x>825) {
      loc.x=575;
      loc.y=-25;
      vel.x=0;
      vel.y=1;
    }
  }

  //Attacking the player
  public void shoot(Player p) {
    if (loc.dist(p.loc)<25 || time == 1) {
      p.loc.x=10000;
      p.loc.y=10000;
      text("YOU LOSE!", 400, 400);
      time = 1;
    }
  }
}

//Initialize class
class A {
  //Declare variables
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
  //Declare some variables
    x=40;
    y=400;
    ye=25;
    x1=750;
    y1=387.5f;
    x2=750;
    y2=412.5f;
    lives=3;
    bkg = loadImage("mazebkg.png");
  }

  public void display() {
    background(255);
    image(bkg, 10, 10);
    image(knight, x, y, 25, 25);
    noFill();
    strokeWeight(20);
    //Upper walls
    for (int i=1; i<11; i++) {
      line(i*70+10, 50, i*70+10, i*30);
      //You shall not pass! Stopping character from going through walls. Upper section
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
      //You shall not pass! Stopping character from going through walls. Lower section
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
      //You shall not pass! Stopping character from going through walls. Middle section
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

  public void move() {

    //closing loophole that allowed players to circumvent obstacles
    if (y >=770) {
      y = 770;
    }
    if (x <= 32) {
      x = 32;
    }

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

  public void shooters() {
    //Upper shooters
    for (int i=1; i<10; i++) {
      strokeWeight(1);
      ellipse(i*70+10+35, 25, 25, 25);
    }

    //Upper shooters' projectiles
    for (int i=1; i<10; i++) {
      fill(11, 24, 237);
      strokeWeight(1);
      ellipse(i*70+58, ye, 10, 10);
      ye=ye+0.25f;
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
    ellipse(750, 387.5f, 25, 25);
    ellipse(750, 412.5f, 25, 25);
    fill(11, 24, 237);

    //End shooters' projectiles
    ellipse(x1, y1, 10, 10);
    y1=y1-1;
    x1=x1-2;
    if (x1<0) {
      x1=750;
      y1=387.5f;
    }
    
    //Dying
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
      y2=412.5f;
    }
    
    //Dying
    if (abs(x-x2)<10) {
      if (abs(y-y2)<10) {
        x=40;
        y=400;
        lives=lives-1;
      }
    }
  }

  //Lives
  public void score() {
    textSize(50);
    text(lives, 25, 50);

    if (lives<1) {
      textSize(25);
      text("You lose!", 587.5f, 400);
      time = time + 1;
    }

    if (x>700) {
      textSize(25);
      text("You win!", 587.5f, 400);
      time = time + 1;
    }
  }
}

class NAEE {
  
  //not initializing variables
  PVector loc, vel;
  PImage egg;

  NAEE() {
    imageMode(CENTER);
    
    //not variables for location and velocity
    loc = new PVector(random(500, 900), 0);
    vel = new PVector(0, 10);
    
    //not loading an image of an egg
    egg = loadImage("egg.png");
  }

  public void create() {
    
    //not creating the image of an egg
    image(egg, loc.x, loc.y);
  }
  public void move() {
    
    //not moving the egg
    loc.add(vel);
  }
}

class RACINGEASY {
  //initializing classes
  CAR c;
  ArrayList<NAEE> n = new ArrayList<NAEE>();
  ArrayList<YLINE> y = new ArrayList<YLINE>();
  ArrayList<OBST> o = new ArrayList<OBST>();
  //initializing other variables
  float locx;
  int hit_or_not = 0;
  //time is the variable for creating new obstacles. time2 helps return to the main screen when the game is over
  int time, time2;
  float timer, timeA = 60;
  float start=0;
  PImage rbkg, car, strt;


  RACINGEASY() {
    //images
    rbkg = loadImage("racingbkg.png");
    strt = loadImage("start.png");

    c = new CAR();
  }
  
  //background class
  public void bkg() {
    //setting the time for the timer
    if (time>60 && hit_or_not ==0) {
      timer=timer+.016666666f;
    }

    //making the starting line move down the screen
    start = start+10;

    //start the timer
    time = time + 1;

    imageMode(CORNER);

    //create the background/starting line
    image(rbkg, 0, 0);
    image(strt, 479, start);

    //create the timer text
    fill(255);
    text(timer, 3*width/4, 200);

    //create the yellow lines
    for ( int i = 0; i<y.size (); i++) {
      YLINE currentLine = y.get(i);
      currentLine.create();
      currentLine.move();
    }

    //ignore the part below. It has nothing to do with easter eggs.
    for ( int i = 0; i<n.size (); i++) {
      NAEE currentEgg = n.get(i);
      currentEgg.create();
      currentEgg.move();
      if (abs((currentEgg.loc.x)-(c.loc.x))<=30 && currentEgg.loc.y> 682 && currentEgg.loc.y<870) {
        hit_or_not = 3;
      }
    }

    //ignore the part below. It has nothing to do with adding easter eggs every 600 frames.
    if ( time%600 == 0) {
      n.add(new NAEE());
    }

    //creating a yellow line ever timeA frames
    if (time%timeA == 0 && hit_or_not !=1) {
      y.add(new YLINE());
    }
  }

  //obstacle class
  public void obstacles() {
    
    //every 240 frames, the variable that says how quickly obstacles/yellow lines appear reduces by two, making them appear faster
    if (time%240 == 0) {
      timeA = timeA-2;
    }
    
    //creating the obstacles
    for ( int j = 0; j<o.size (); j++) {
      OBST currentOBST = o.get(j);
      currentOBST.create();
      currentOBST.move();
      
      //if the car hits the obstacle, the game recognizes the crash
      if (abs((currentOBST.loc.x)-(c.loc.x))<=30 && currentOBST.loc.y> 682 && currentOBST.loc.y<870) {
        hit_or_not = 1;
      }
    }
    
    //add a new obstacle every timeA/2 frames
    if (time%(timeA/2) == 0 && hit_or_not !=1) {
      o.add(new OBST());
    }
  }
  
  //car class
  public void car() {
    //make the car
    c.create();
    c.move();
  }
  
  //crash class
  public void crash() {
    
    //recognize if the car crashes
    if (hit_or_not==1) {
      
      //time2 variable increases. After 1 second or 60 frames, it returns to the main screen 
      time2 = time2+1;
      
      //text that says crash
      fill(255);
      stroke(0);
      text("CRASH", 720, 100);
      
      //stops the obstacles, the car, and the yellow lines
      for ( int k = 0; k<o.size (); k++) {
        OBST currentOBST = o.get(k);
        currentOBST.vel.x = 0;
        currentOBST.vel.y = 0;
        c.r.x=0;
        c.l.x=0;
      }
      for ( int k = 0; k<y.size (); k++) {
        YLINE currentLine = y.get(k);
        currentLine.vel.x = 0;
        currentLine.vel.y = 0;
      }
    }
    
    //ignore the part below. It has nothing to do with easter eggs.
    if (hit_or_not==3) {
      time2 = time2+1;
      fill(255);
      stroke(0);
      text("YOU WON", 720, 100);
      for ( int k = 0; k<o.size (); k++) {
        OBST currentOBST = o.get(k);
        currentOBST.vel.x = 0;
        currentOBST.vel.y = 0;
        c.r.x=0;
        c.l.x=0;
      }
      for ( int k = 0; k<y.size (); k++) {
        YLINE currentLine = y.get(k);
        currentLine.vel.x = 0;
        currentLine.vel.y = 0;
      }
    }
  }
}

class RACINGHARD {
  //initializing classes
  CAR c;
  ArrayList<NAEE> n = new ArrayList<NAEE>();
  ArrayList<YLINE> y = new ArrayList<YLINE>();
  ArrayList<OBST> o = new ArrayList<OBST>();
  //initializing other variables
  float locx;
  int hit_or_not = 0;
  //time is the variable for creating new obstacles. time2 helps return to the main screen when the game is over
  int time, time2;
  float timer, timeA = 35;
  float start=0;
  PImage rbkg, car, strt;


  RACINGHARD() {
    //images
    rbkg = loadImage("racingbkg.png");
    strt = loadImage("start.png");

    c = new CAR();
  }
  
  //background class
  public void bkg() {
    //setting the time for the timer
    if (time>60 && hit_or_not ==0) {
      timer=timer+.016666666f;
    }

    //making the starting line move down the screen
    start = start+10;

    //start the timer
    time = time + 1;

    imageMode(CORNER);

    //create the background/starting line
    image(rbkg, 0, 0);
    image(strt, 479, start);

    //create the timer text
    fill(255);
    text(timer, 3*width/4, 200);

    //create the yellow lines
    for ( int i = 0; i<y.size (); i++) {
      YLINE currentLine = y.get(i);
      currentLine.create();
      currentLine.move();
    }

    //ignore the part below. It has nothing to do with easter eggs.
    for ( int i = 0; i<n.size (); i++) {
      NAEE currentEgg = n.get(i);
      currentEgg.create();
      currentEgg.move();
      if (abs((currentEgg.loc.x)-(c.loc.x))<=30 && currentEgg.loc.y> 682 && currentEgg.loc.y<870) {
        hit_or_not = 3;
      }
    }

    //ignore the part below. It has nothing to do with adding easter eggs every 300 frames.
    if ( time%300 == 0) {
      n.add(new NAEE());
    }

    //creating a yellow line ever timeA frames
    if (time%timeA == 0 && hit_or_not !=1) {
      y.add(new YLINE());
    }
  }

  //obstacle class
  public void obstacles() {
    
    //every 30 frames, the variable that says how quickly obstacles/yellow lines appear reduces by two, making them appear faster
    if (time%30 == 0) {
      timeA = timeA-2;
    }
    
    //creating the obstacles
    for ( int j = 0; j<o.size (); j++) {
      OBST currentOBST = o.get(j);
      currentOBST.create();
      currentOBST.move();
      
      //if the car hits the obstacle, the game recognizes the crash
      if (abs((currentOBST.loc.x)-(c.loc.x))<=30 && currentOBST.loc.y> 682 && currentOBST.loc.y<870) {
        hit_or_not = 1;
      }
    }
    
    //add a new obstacle every timeA/2 frames
    if (time%(timeA/2) == 0 && hit_or_not !=1) {
      o.add(new OBST());
    }
  }
  
  //car class
  public void car() {
    //make the car
    c.create();
    c.move();
  }
  
  //crash class
  public void crash() {
    
    //recognize if the car crashes
    if (hit_or_not==1) {
      
      //time2 variable increases. After 1 second or 60 frames, it returns to the main screen 
      time2 = time2+1;
      
      //text that says crash
      fill(255);
      stroke(0);
      text("CRASH", 720, 100);
      
      //stops the obstacles, the car, and the yellow lines
      for ( int k = 0; k<o.size (); k++) {
        OBST currentOBST = o.get(k);
        currentOBST.vel.x = 0;
        currentOBST.vel.y = 0;
        c.r.x=0;
        c.l.x=0;
      }
      for ( int k = 0; k<y.size (); k++) {
        YLINE currentLine = y.get(k);
        currentLine.vel.x = 0;
        currentLine.vel.y = 0;
      }
    }
    
    //ignore the part below. It has nothing to do with easter eggs.
    if (hit_or_not==3) {
      time2 = time2+1;
      fill(255);
      stroke(0);
      text("YOU WON", 720, 100);
      for ( int k = 0; k<o.size (); k++) {
        OBST currentOBST = o.get(k);
        currentOBST.vel.x = 0;
        currentOBST.vel.y = 0;
        c.r.x=0;
        c.l.x=0;
      }
      for ( int k = 0; k<y.size (); k++) {
        YLINE currentLine = y.get(k);
        currentLine.vel.x = 0;
        currentLine.vel.y = 0;
      }
    }
  }
}

class RACINGMEDIUM {
  //initializing classes
  CAR c;
  ArrayList<NAEE> n = new ArrayList<NAEE>();
  ArrayList<YLINE> y = new ArrayList<YLINE>();
  ArrayList<OBST> o = new ArrayList<OBST>();
  //initializing other variables
  float locx;
  int hit_or_not = 0;
  //time is the variable for creating new obstacles. time2 helps return to the main screen when the game is over
  int time, time2;
  float timer, timeA = 30;
  float start=0;
  PImage rbkg, car, strt;


  RACINGMEDIUM() {
    //images
    rbkg = loadImage("racingbkg.png");
    strt = loadImage("start.png");

    c = new CAR();
  }
  
  //background class
  public void bkg() {
    //setting the time for the timer
    if (time>60 && hit_or_not ==0) {
      timer=timer+.016666666f;
    }

    //making the starting line move down the screen
    start = start+10;

    //start the timer
    time = time + 1;

    imageMode(CORNER);

    //create the background/starting line
    image(rbkg, 0, 0);
    image(strt, 479, start);

    //create the timer text
    fill(255);
    text(timer, 3*width/4, 200);

    //create the yellow lines
    for ( int i = 0; i<y.size (); i++) {
      YLINE currentLine = y.get(i);
      currentLine.create();
      currentLine.move();
    }

    //ignore the part below. It has nothing to do with easter eggs.
    for ( int i = 0; i<n.size (); i++) {
      NAEE currentEgg = n.get(i);
      currentEgg.create();
      currentEgg.move();
      if (abs((currentEgg.loc.x)-(c.loc.x))<=30 && currentEgg.loc.y> 682 && currentEgg.loc.y<870) {
        hit_or_not = 3;
      }
    }

    //ignore the part below. It has nothing to do with adding easter eggs every 600 frames.
    if ( time%600 == 0) {
      n.add(new NAEE());
    }

    //creating a yellow line ever timeA frames
    if (time%timeA == 0 && hit_or_not !=1) {
      y.add(new YLINE());
    }
  }

  //obstacle class
  public void obstacles() {
    
    //every 120 frames, the variable that says how quickly obstacles/yellow lines appear reduces by two, making them appear faster
    if (time%120 == 0) {
      timeA = timeA-2;
    }
    
    //creating the obstacles
    for ( int j = 0; j<o.size (); j++) {
      OBST currentOBST = o.get(j);
      currentOBST.create();
      currentOBST.move();
      
      //if the car hits the obstacle, the game recognizes the crash
      if (abs((currentOBST.loc.x)-(c.loc.x))<=30 && currentOBST.loc.y> 682 && currentOBST.loc.y<870) {
        hit_or_not = 1;
      }
    }
    
    //add a new obstacle every timeA/2 frames
    if (time%(timeA/2) == 0 && hit_or_not !=1) {
      o.add(new OBST());
    }
  }
  
  //car class
  public void car() {
    //make the car
    c.create();
    c.move();
  }
  
  //crash class
  public void crash() {
    
    //recognize if the car crashes
    if (hit_or_not==1) {
      
      //time2 variable increases. After 1 second or 60 frames, it returns to the main screen 
      time2 = time2+1;
      
      //text that says crash
      fill(255);
      stroke(0);
      text("CRASH", 720, 100);
      
      //stops the obstacles, the car, and the yellow lines
      for ( int k = 0; k<o.size (); k++) {
        OBST currentOBST = o.get(k);
        currentOBST.vel.x = 0;
        currentOBST.vel.y = 0;
        c.r.x=0;
        c.l.x=0;
      }
      for ( int k = 0; k<y.size (); k++) {
        YLINE currentLine = y.get(k);
        currentLine.vel.x = 0;
        currentLine.vel.y = 0;
      }
    }
    
    //ignore the part below. It has nothing to do with easter eggs.
    if (hit_or_not==3) {
      time2 = time2+1;
      fill(255);
      stroke(0);
      text("YOU WON", 720, 100);
      for ( int k = 0; k<o.size (); k++) {
        OBST currentOBST = o.get(k);
        currentOBST.vel.x = 0;
        currentOBST.vel.y = 0;
        c.r.x=0;
        c.l.x=0;
      }
      for ( int k = 0; k<y.size (); k++) {
        YLINE currentLine = y.get(k);
        currentLine.vel.x = 0;
        currentLine.vel.y = 0;
      }
    }
  }
}

class CAR {
  
  //initializing variables
  PVector loc, l, r;
  PImage car;

  CAR() {
    
    //loading the car image
    car = loadImage("car.png");
    
    //location and movement variables
    loc = new PVector(720, height-100);
    l = new PVector(-10, 0);
    r = new PVector(10, 0);
  }
  public void create() {
    
    //displaying an image of the car
    imageMode(CENTER);
    image(car, loc.x, loc.y);
  }
  public void move() {
    
    //moving left and right with the keys
    if (keyPressed) {
      if (loc.x>500) {
        if (keyCode == LEFT) {
          loc.add(l);
        }
      }
      if (loc.x<920) {
        if (keyCode == RIGHT) {
          loc.add(r);
        }
      }
    }
  }
}
class OBST {
  
  //initializing variables
  PVector loc, vel;
  PImage dog, bird;
  int variable;

  OBST() {
    imageMode(CENTER);
    
    //location and velocity variables
    loc = new PVector(random(500, 910), 0);
    vel = new PVector(0, 10);
    
    //if the variable is 1, a dog shows up. if the variable is 0, the bird shows up
    variable = PApplet.parseInt(random(0, 2));
    
    //loading images of dog and bird
    dog = loadImage("dog.png");
    bird = loadImage("bird.png");
  }

  public void create() {
    imageMode(CENTER);
    
    //creating the images
    if (variable == 1) {
      image(dog, loc.x, loc.y);
    }
    if (variable == 0) {
      image(bird, loc.x, loc.y);
    }
  }
  public void move() {
    
    //moving the images
    loc.add(vel);
  }
}

class YLINE {
  
  //initializing variables
  PVector loc, vel;
  float szx, szy;

  YLINE() {
    rectMode(CENTER);
    
    //location, velocity, and size variables
    loc = new PVector(720, 0);
    vel = new PVector(0, 10);
    szx = 10;
    szy = 50;
  }

  public void create() {
    
    //create the yellow lines
    noStroke();
    fill(0xfff1c40f);
    rect(loc.x, loc.y, szx, szy);
  }
  public void move() {
    
    //move the yellow lines
    loc.add(vel);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "DOMINATION" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
