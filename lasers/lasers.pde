float m;

int x = 0;
int y = 0;

int dx = 25;
int dy = 10;

boolean gameOver = false;
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

PImage game_over;

void setup() {
  size(displayWidth, displayHeight);
  dinosaur = loadImage("dino.png");
  //initialize variables  
  for (int i = 0; i<count; i++) {
    sz[i] = random(3);
    loc1[i] = new PVector(random(75+100, width), random(5, height));
    loc2[i] = new PVector(loc1[i].x-75, loc1[i].y+5);
    vel[i] = new PVector(-100, 0);
    acc[i] = new PVector(0, 0);
  }
  noStroke();
  game_over = loadImage("Game_Over.png");
  m = millis();
}

void draw() {
  background(0);
  if (!gameOver) {

    m = millis();
  }
  fill(255);

  text(m/1000, width-100, 50);

  textSize(25);


  image(dinosaur, x, y, dinosaur.width/3, dinosaur.height/3);
  for (int i = 0; i < count; i++) {
    //snowflake motion
    if (!gameOver) {
      vel[i].add(acc[i]);
      loc1[i].add(vel[i]);
      loc2[i].add(vel[i]);
      vel[i].limit(3);
    }
    //draw laser
    rectMode(CORNERS);
    fill(247, 70, 70);
    rect(loc1[i].x, loc1[i].y, loc2[i].x, loc2[i].y);
    if (loc1[i].x<0) {
      loc1[i].x = width;
      loc2[i].x = width-75;
    }
    if (loc1[i].x <= (x + dinosaur.width/3) && loc1[i].x >= x && loc1[i].y >= y && loc1[i].y <= (y+dinosaur.width/3) ) {
      gameOver = true;
      textSize(100);
      fill(255);
      text("GAME OVER!", width/3, height/2);
      textSize(25);
      dx =0;
      vel[i].x = 0;
      //    image(game_over, 5, 5);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      y += dy;
    } 
    if (keyCode == UP) {
      y -= dy;
    }
    if (keyCode == LEFT) {
      x -= dx;
      x += dx;
    }
  }
}

