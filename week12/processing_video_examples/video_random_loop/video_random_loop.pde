/*
Video demo: mouse press plays a video at random.
 
 Processing Video library reference:
 https://processing.org/reference/libraries/video/index.html 
 
 **Make sure video library is installed!**
 */


import processing.video.*; //import processing video library

//Create Movie objects   
Movie myMovie; 
Movie clip1;
Movie clip2;
Movie clip3;
Movie clip4;

int whichClip= 0; //tracking which movie clip to play


void setup() {
  size (640, 360); //Canvas matches video dimensions

  //Assign movie files to movie objects
  clip1 = new Movie(this, "clip1.mp4");
  clip2 = new Movie(this, "clip2.mp4");
  clip3 = new Movie(this, "clip3.mp4");
  clip4 = new Movie(this, "clip4.mp4");

  //Sets up initial movie loop
  myMovie=clip1;
  myMovie.loop();
}

void draw() {

  // if the movie is available, read current frame of the movie
  if (myMovie.available()) {
    myMovie.read();
  }

  image(myMovie, 0, 0); //display movie
}


void mousePressed() {
  myMovie.stop(); //stops current movie and returns to first frame
  whichClip= int(random (1, 5)); //return random number for whichMovie

  if (whichClip==1) {
    myMovie= clip1;
  } else if (whichClip==2) {
    myMovie=clip2;
  } else if (whichClip==3) {
    myMovie= clip3;
  } else if (whichClip==4) {
    myMovie= clip4;
  } 

  myMovie.loop(); //trigger movie loop
  println ("whichClip: " + whichClip);
}
