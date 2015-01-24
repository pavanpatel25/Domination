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
  void game() {
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
  void display() {
    if (loc.dist(p.loc)>10) {
      fill(250, 75, 0);
      noStroke();

      //Lava monster
      ellipse(loc.x, loc.y, sz, sz);
      ellipse(loc.x, loc.y+sz, sz, sz*2);
      sz=sz*0.9975;

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
  void move() {
    loc.add(vel);
  }

  //Bouncing the lava monster, part 1
  void rev() {
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
  void bounce() {
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
  void shoot(Player p) {
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

  void display() {
    //Display the character and weapon
    ellipse(pos.x, pos.y, 5, 5);
    image(knight, loc.x, loc.y, 40, 40);
  }

  void move() {
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

  void poww() {
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
  void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }

  //Move the fireball
  void move() {
    //Moving to the side
    if (loc.x>285) {
      vel.x=-1;
    }
    //Moving to the side and down
    if (loc.x<285) {
      vel.x=-1;
      vel.y=0.80;
    }
    loc.add(vel);
  }

  //Reappearing after moving off the screen
  void reappear() {
    if (loc.x<-25) {
      loc.x=400;
      loc.y=360;
      vel.x=0;
      vel.y=0;
    }
  }

  //Attacking the player
  void shoot(Player p) {
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
  void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }

  //Move the fireball
  void move() {
    //Moving to the side
    if (loc.y>360) {
      vel.x=1;
    }    
    loc.add(vel);
  }

  //Reappearing after moving off the screen
  void reappear() {
    if (loc.x>825) {
      loc.x=575;
      loc.y=-25;
      vel.x=0;
      vel.y=1;
    }
  }

  //Attacking the player
  void shoot(Player p) {
    if (loc.dist(p.loc)<25 || time == 1) {
      p.loc.x=10000;
      p.loc.y=10000;
      text("YOU LOSE!", 400, 400);
      time = 1;
    }
  }
}

