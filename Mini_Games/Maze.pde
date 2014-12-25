PImage CaveMaze;

//setup for the music
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  background(0);
  size(displayWidth, displayHeight);

  //loading the file for the music
  minim = new Minim(this);
  player = minim.loadFile("Happy.mp3", 2048);
  player.play();

  //image of the maze in the cave
  CaveMaze = loadImage("Maze.png");
}

void draw() {
  image(CaveMaze, 0, 0, displayWidth, displayHeight);
}

//stopping the music from playing
void stop() {
  player.close();
  minim.stop();
  super.stop();
}

