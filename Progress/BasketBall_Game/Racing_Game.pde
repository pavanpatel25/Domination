class RACING {
  CAR c;
  float locx;
  int hit_or_not = 0;
  int time;
  PImage rbkg, car;
  ArrayList<YLINE> y = new ArrayList<YLINE>();
  ArrayList<OBST> o = new ArrayList<OBST>();

  RACING() {
    rbkg = loadImage("racingbkg.png");
    c = new CAR();
  }
  void bkg() {

    time = time + 1;
    imageMode(CORNER);
    image(rbkg, 0, 0);
    for ( int i = 0; i<y.size (); i++) {
      YLINE currentLine = y.get(i);
      currentLine.create();
      currentLine.move();
    }
    if (time%30 == 0 && hit_or_not !=1) {
      y.add(new YLINE());
    }
  }
  void obstacles() {
    for ( int j = 0; j<o.size (); j++) {
      OBST currentOBST = o.get(j);
      println(c.loc.y);
      println(abs((currentOBST.loc.x)-(c.loc.x))<=78);
      println();

      currentOBST.create();
      currentOBST.move();
      if (abs((currentOBST.loc.x)-(c.loc.x))<=40 && currentOBST.loc.y> 700 && currentOBST.loc.y<870) {
        hit_or_not = 1;
      }
    }
    if (time%60 == 0 && hit_or_not !=1) {
      o.add(new OBST());
    }
  }
  void car() {
    c.create();
    c.move();
  }
  void crash() {
    if (hit_or_not==1) {
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
