class RACINGEASY {
  CAR c;
  float locx;
  int hit_or_not = 0;
  int time, time2;
  float timer, timeA = 60;
  float start=0;
  PImage rbkg, car, strt;
  ArrayList<NAEE> n = new ArrayList<NAEE>();
  ArrayList<YLINE> y = new ArrayList<YLINE>();
  ArrayList<OBST> o = new ArrayList<OBST>();

  RACINGEASY() {
    rbkg = loadImage("racingbkg.png");
    strt = loadImage("start.png");
    c = new CAR();
  }
  void bkg() {
    if (time>60 && hit_or_not !=1) {
      timer=timer+.016666666;
    }
    start = start+10;
    time = time + 1;
    imageMode(CORNER);
    image(rbkg, 0, 0);
    image(strt, 479, start);
    fill(255);
    text(timer, 3*width/4, 200);
    for ( int i = 0; i<y.size (); i++) {
      YLINE currentLine = y.get(i);
      currentLine.create();
      currentLine.move();
    }
    for ( int i = 0; i<n.size (); i++) {
      NAEE currentEgg = n.get(i);
      currentEgg.create();
      currentEgg.move();
    }
    if ( time%600 == 0) {
      n.add(new NAEE());
    }

    if (time%timeA == 0 && hit_or_not !=1) {
      y.add(new YLINE());
    }
  }
  void obstacles() {
    if (time%240 == 0) {
      timeA = timeA-2;
    }
    for ( int j = 0; j<o.size (); j++) {
      OBST currentOBST = o.get(j);
      println(j);

      currentOBST.create();
      currentOBST.move();
      if (abs((currentOBST.loc.x)-(c.loc.x))<=30 && currentOBST.loc.y> 682 && currentOBST.loc.y<870) {
        hit_or_not = 1;
      }
    }
    if (time%(timeA/2) == 0 && hit_or_not !=1) {
      o.add(new OBST());
    }
  }
  void car() {
    c.create();
    c.move();
  }
  void crash() {
    if (hit_or_not==1) {
      time2 = time2+1;
      fill(255);
      stroke(0);
      text("CRASH", 720, 100);
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

