/*
Demo of sound file player. 

Check out Sound Library reference: 
https://processing.org/reference/libraries/sound/index.html

To import library, go to Processing top menu: 
Sketch--> Import Library --> Add Library / Sound

 */


import processing.sound.*; //import Processing sound library

SoundFile file; //create object from SoundFile class

void setup() {
  file = new SoundFile(this, "vibraphon.aiff"); //Load sound from data folder
  file.loop();    // Call loop method on the object
}      


void draw() {

}
