//variable for timer
float m;

//position of dinosaur
int x = 0;
int y = 0;

int dx = 25;
int dy = 10;

//in order to set up time stopper
boolean gameOver = false;

//sets up how many lasers
int count = 70;

//movement of the lasers
PVector[] loc1 = new PVector[count];
PVector[] loc2 = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];

//size of the snowflakes
float[] sz = new float[count];

//image of dinosaur
PImage dinosaur;

void setup() {
  //size of program is size of display
  size(displayWidth, displayHeight);
  //loading the image of the dinosaur
  dinosaur = loadImage("dino.png");
  //initialize variables for the movement of lasers
  for (int i = 0; i<count; i++) {
    loc1[i] = new PVector(random(width/8, width), random(5, height));
    loc2[i] = new PVector(loc1[i].x-75, loc1[i].y+5);
    vel[i] = new PVector(-100, 0);
    acc[i] = new PVector(0, 0);
  }
  //timer
  noStroke();
  m = millis();
}

void draw() {
  background(0);
  //timer goes if game is not over
  if (!gameOver) {

    m = millis();
  }
  
  fill(255);

//timer displays in top right corner of screen
  text(m/1000, width-100, 50);
  textSize(25);

//image of dinosaur
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
      loc1[i].y += 5;
      loc2[i].y += 5;
    }
    //recycling the lasers that move off the screen
    
    if (loc1[i].x <= (x + dinosaur.width/3) && loc1[i].x >= x && loc1[i].y >= y && loc1[i].y <= (y+dinosaur.width/3) ) {
      gameOver = true;
      textSize(100);
      fill(255);
      text("GAME OVER!", width/3, height/2);
      textSize(25);
      dx =0;
      vel[i].x = 0;
    }
    //increasing laser speed to make it harder to dodge them
    if ((m/1000) > 15 && (m/1000) <= 25) {
      vel[i].x = 2*vel[i].x;
    }
    if ((m/1000) >25 && (m/1000) <=35) {
      vel[i].x = 4*vel[i].x;
    }
    if ((m/1000) >35) {
      vel[i].x = 6*vel[i].x;
    }
  }
}

//the ability for dinosaur to move up and down to dodge lasers
void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      y += dy;
    } 
    if (keyCode == UP) {
      y -= dy;
    }
    //optional: ability to move left and right
    /*
    if (keyCode == LEFT) {
     x -= dx;
     }
     if (keyCode == RIGHT) {
     x += dx;
     }
     */
  }
}

