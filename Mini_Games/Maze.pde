class Maze {

  //image of maze
  PImage CaveMaze;

  //image of dinosaur
  PImage Dinosaur;

  //  //setup for the music
  //  import ddf.minim.*;
  //  AudioPlayer player;
  //  Minim minim;

  //position of picture of dinosaur
  float x1, x2, y1, y2;

  void setup() {

    background(0);
    size(displayWidth, displayHeight);

    //    //loading the file for the music
    //    minim = new Minim(this);
    //    player = minim.loadFile("Happy.mp3", 2048);
    //    player.play();

    //image of the maze in the cave
    CaveMaze = loadImage("BMaze.PNG");

    //image of the dinosaur from blog.chron.com
    Dinosaur = loadImage("smallerdinosaur.png");
  }

  //  //stopping the music from playing
  //  void stop() {
  //    player.close();
  //    minim.stop();
  //    //    super.stop();
  //  }

  void draw() {
    x1 = 5;
    x2 = 5+Dinosaur.width;
    y1 = height-Dinosaur.height;
    y2 = height - 30;
    image(CaveMaze, -width/2, -height/2, width, height);
    image(Dinosaur, x1, y1, x2, y2);
  }
}

