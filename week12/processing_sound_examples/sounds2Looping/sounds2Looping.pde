/*
Demo of sound file player. 

When mouse is not pressed, sample 1 loops.
Press mouse is pressed, sample 2 loops.

Ref: https://processing.org/reference/libraries/sound/SoundFile.html
 */


import processing.sound.*; //import Processing sound library

//Create SoundFile objects
SoundFile sample1; 
SoundFile sample2;

String looping= "sample1"; //track which file is looping

void setup() {
  //Load files and designate path
  sample1 = new SoundFile(this, "sample1.aiff");
  sample2 = new SoundFile(this, "sample2.aiff");

  // Play sample1 in a loop to start
  sample1.loop();
}      


void draw() {
  if (mousePressed) {
    if (looping=="sample1") {
      sample1.stop();
      sample2.loop(); 
      looping="sample2";
    }
  } else if (looping== "sample2") {
    sample2.stop();
    sample1.loop();
    looping= "sample1";
  }
}
