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
  void create() {
    
    //displaying an image of the car
    imageMode(CENTER);
    image(car, loc.x, loc.y);
  }
  void move() {
    
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
