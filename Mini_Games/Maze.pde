//image of maze
PImage CaveMaze;

//image of dinosaur
PImage Dinosaur;

//setup for the music
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  background(0);
  size(800, 600);

  //loading the file for the music
  minim = new Minim(this);
  player = minim.loadFile("Happy.mp3", 2048);
  player.play();

  //image of the maze in the cave
  CaveMaze = loadImage("BMaze.PNG");
  
  //image of the dinosaur from blog.chron.com
  Dinosaur = loadImage("smalldinosaur.jpg");
}

void draw() {
  image(CaveMaze, 0, 0, width, height);
  image(Dinosaur, 5, height-Dinosaur.height-30, 5+Dinosaur.width,height-30);

}

//stopping the music from playing
void stop() {
  player.close();
  minim.stop();
  super.stop();
}

