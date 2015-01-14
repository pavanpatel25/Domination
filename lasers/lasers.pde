
//sets up how many snowflakes
int count = 70;

//movement of the snowflakes
PVector[] loc1 = new PVector[count];
PVector[] loc2 = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];

//size of the snowflakes
float[] sz = new float[count];

//image of dinosaur
PImage dinosaur;

void setup() {
  size(displayWidth, displayHeight);
  dinosaur = loadImage("dino.png");
  //initialize variables  
  for (int i = 0; i<count; i++) {
    sz[i] = random(3);
    loc1[i] = new PVector(random(width), random(height));
    loc2[i] = new PVector(loc1[i].x-75, loc1[i].y+5);
    vel[i] = new PVector(-100, 0);
    acc[i] = new PVector(0, 0);
  }
  noStroke();
}

void draw() {
  background(0);


  image(dinosaur, mouseX, mouseY, dinosaur.width, dinosaur.height);
  for (int i = 0; i < count; i++) {
    //snowflake motion
    vel[i].add(acc[i]);
    loc1[i].add(vel[i]);
    loc2[i].add(vel[i]);
    vel[i].limit(3);
    //draw laser
    rectMode(CORNERS);
    rect(loc1[i].x, loc1[i].y, loc2[i].x, loc2[i].y);
    if (loc1[i].x<0) {
      loc1[i].x = width;
      loc2[i].x = width-75;
    }
    if (loc1[i].x <= (mouseX + dinosaur.width)) {
      display
      println("You Lose!");
    }
  }
}

