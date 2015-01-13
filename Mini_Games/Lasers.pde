class Lasers {

  //PImage laser;
  PImage lasers;
  ArrayList<Lasers> shootingLasers = new ArrayList<Lasers>();
  float x = random(height);
  void setup() {
    background(0);
    size(displayWidth, displayHeight);
    lasers = loadImage("laser.png");
  }


  void draw() {


    image(lasers, width-lasers.width, x, width, x-lasers.height);
    for (int i = Lasers.size ()-1; i >= 0; i--) {
      Lasers currentNotes = musicalNotes.get(i);
      musicalNotes.display();
      musicalNotes.move();
      if (musicalNotes.isDead()) {
        musicalNotes.remove(i);
      }
    }
  }
}
class musicalNotes {

  PImage lasers;
  //referencing picture of laser

  PVector loc, vel, acc;
  float sz;
  Lasers() {
    loc = new PVector(width, random(height));
    vel = new PVector(random(-5, -1), 0);
    acc = new PVector(0, 0);
    lasers = loadImage("laser.png");
    sz = 10;
  }

  void display() {
    //put in image for musical notes
    image(lasers, loc.x, loc.y, laser.width, laser.height);
  }

  //moving the musical curve in a sine curve-like path
  void move() {
    vel.x=-4;
    vel.y=0;
    vel.add(acc);
    loc.add(vel);
  }
}

