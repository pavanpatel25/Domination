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

  void create() {
    
    //create the yellow lines
    noStroke();
    fill(#f1c40f);
    rect(loc.x, loc.y, szx, szy);
  }
  void move() {
    
    //move the yellow lines
    loc.add(vel);
  }
}

