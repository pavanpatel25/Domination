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
  void bkg() {
    //setting the time for the timer
    if (time>60 && hit_or_not ==0) {
      timer=timer+.016666666;
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
  void obstacles() {
    
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
  void car() {
    //make the car
    c.create();
    c.move();
  }
  
  //crash class
  void crash() {
    
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

