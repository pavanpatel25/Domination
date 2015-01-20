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


void setup() {
  size(800, 800);
  volcano = loadImage("volcano.jpg");
  for (int i=0; i<1; i++) {
    lava[i] = new LavaMonster();
  }
  p = new Player();
  knight = loadImage("knight.png");
}

void draw() {
  background(255, 255, 255);
  image(volcano, 0, 0, 800, 800);
  for (int i=0; i<1; i++) {
    lava[i].display();
    lava[i].move();
    lava[i].rev();
    lava[i].bounce();
    lava[i].shoot(p);
    p.display();
    p.move();
  }
  
  ellipse(xe1,ye1,50,50);
  xe1=xe1-1;
  if(xe1<285){
    ye1=ye1+0.80;
  }
  if(xe1<-25){
    xe1=400;
    ye1=360;
  }
  
  ellipse(xe2,ye2,50,50);
  ye2=ye2+1;
  if(ye2>360){
    xe2=xe2+1;
  }
  if(xe2>925){
    xe2=575;
    ye2=-25;
  }
}

class LavaMonster { 
  PVector loc, vel, loc2, vel2;
  float sz=10;
  float sz2=0;

  LavaMonster() {
    loc = new PVector(width/2, 100);
    vel = PVector.random2D();
  }

  void display() {
    if (loc.dist(p.loc)>10) {
      fill(250, 75, 0);
      noStroke();
      ellipse(loc.x, loc.y, sz, sz);
      ellipse(loc.x, loc.y+sz, sz, sz*2);
      sz=sz*0.9975;

      if (sz>25) {
        if (loc.y>650) {
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
    if (loc.x+sz/2>width) {
      vel.x=-abs(vel.x);
    }
    if (loc.x+sz2/2>width) {
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

    if (loc.y<300) {
      sz2=100;
      ellipse(loc.x, loc.y, sz2, sz2);
      if (loc.dist(p.loc)<sz2/2) {
        p.loc.x=10000;
        p.loc.y=10000;
        text("YOU LOSE!", 400, 400);
      }
    }
  }
}


class Player {
  PVector loc, vel;

  Player() {
    loc = new PVector(400, 700);
    vel = new PVector(1, 1);
  }

  void display() {
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
}

