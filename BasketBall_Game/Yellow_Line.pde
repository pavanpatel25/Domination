class YLINE{
  PVector loc,vel;
  float szx, szy;
  
  YLINE(){
    rectMode(CENTER);
    loc = new PVector(720,0);
    vel = new PVector(0,5);
    szx = 10;
    szy = 50;
  }
  
  void create(){
    fill(#f1c40f);
    rect(loc.x,loc.y,szx,szy);
  }
  void move(){
    loc.add(vel);
  }
}
  
