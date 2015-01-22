class LAVA { 
  PImage volcano;
  float x = 400;
  float y = 500;
  LavaMonster[] lava = new LavaMonster[1];
  Player p;
  PImage knight;
  float xe1 = 400;
  float ye1 = 360;
  float xe2 = 575;
  float ye2 = -25;
  int time;
  Fireball1 f1;
  Fireball2 f2;


  LAVA() {
    volcano = loadImage("volcano.jpg");
    for (int i=0; i<1; i++) {
      lava[i] = new LavaMonster();
    }
    p = new Player();
    knight = loadImage("dinosaur.png");

    f1 = new Fireball1();
    f2 = new Fireball2();
  }

  void game() {
    background(255, 255, 255);
    image(volcano, 0, 0, 800, 800);
    for (int i=0; i<1; i++) {
      lava[i].display();
      lava[i].move();
      lava[i].rev();
      lava[i].bounce();
      lava[i].shoot(p);
      if (lava[i].time == 1 || f1.time == 1  || f2.time == 1) {
        time = time + 1;
      }
      p.display();
      p.move();
      p.poww();
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
class LavaMonster { 
  PVector loc, vel, loc2, vel2;
  float sz=10;
  float sz2=0;
  Player p;
  int time = 0;
  LavaMonster() {
    loc = new PVector(800/2, 100);
    vel = PVector.random2D();
    p = new Player();
  }

  void display() {
    if (loc.dist(p.loc)>10) {
      fill(250, 75, 0);
      noStroke();
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

  void move() {
    loc.add(vel);
  }

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

  void shoot(Player p) {
    fill(250, 0, 0);
    if (loc.y>500) {
      sz2=100;
      ellipse(loc.x, loc.y, sz2, sz2);
      if (loc.dist(p.loc)<sz2/2) {
        p.loc.x=10000;
        p.loc.y=10000;
        text("YOU LOSE!", 400, 400);
      }
    }

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


class Player {
  PImage knight;
  PVector loc, vel, pos;

  Player() {
    loc = new PVector(380, 700);
    vel = new PVector(1, 1);
    pos = new PVector(400, 710);
    knight = loadImage("dinosaur.png");
  }

  void display() {
    ellipse(pos.x, pos.y, 5, 5);
    image(knight, loc.x, loc.y, 40, 40);
  }

  void move() {
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
    if (mousePressed) {
      pos.y=pos.y-10;
    }
    if (pos.y<0) {
      pos.y=700;
    }
  }
}

class Fireball1 {
  PVector loc, vel;
  int time = 0;

  Fireball1() {
    loc = new PVector(400, 360);
    vel = new PVector(0, 0);
  }

  void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }

  void move() {
    if (loc.x>285) {
      vel.x=-1;
    }
    if (loc.x<285) {
      vel.x=-1;
      vel.y=0.80;
    }
    loc.add(vel);
  }

  void reappear() {
    if (loc.x<-25) {
      loc.x=400;
      loc.y=360;
      vel.x=0;
      vel.y=0;
    }
  }

  void shoot(Player p) {
    if (loc.dist(p.loc)<25 || time == 1) {
      p.loc.x=10000;
      p.loc.y=10000;
      text("YOU LOSE!", 400, 400);
      time = 1;
    }
  }
}

class Fireball2 {
  PVector loc, vel;
  int time = 0;
  Fireball2() {
    loc = new PVector(575, -25);
    vel = new PVector(0, 1);
  }

  void display() {
    ellipse(loc.x, loc.y, 50, 50);
  }

  void move() {
    if (loc.y>360) {
      vel.x=1;
    }    
    loc.add(vel);
  }

  void reappear() {
    if (loc.x>825) {
      loc.x=575;
      loc.y=-25;
      vel.x=0;
      vel.y=1;
    }
  }

  void shoot(Player p) {
    if (loc.dist(p.loc)<25 || time == 1) {
      p.loc.x=10000;
      p.loc.y=10000;
      text("YOU LOSE!", 400, 400);
      time = 1;
    }
  }
}

