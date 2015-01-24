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

  void create() {
    
    //not creating the image of an egg
    image(egg, loc.x, loc.y);
  }
  void move() {
    
    //not moving the egg
    loc.add(vel);
  }
}

