/* Sketch to detect if movie has finished playing: 
 if time() exceeds duration(), switch to other movie.
 
 See https://processing.org/reference/libraries/video/index.html
 for further reference.
 */

import processing.video.*;  //import processing video library

//Create Movie objects 
Movie myMovie;
Movie clip1;
Movie clip2;


void setup() {
  size(640, 360);

  //Assign movie files to movie objects
  clip1 = new Movie(this, "clip1.mp4");
  clip2 = new Movie(this, "clip2.mp4");

  //Sets up initial movie to play
  myMovie= clip1;
  myMovie.play();
}

void draw() {
  // if the movie is available, read current frame of the movie
  if (myMovie.available()) {
    myMovie.read();
  }

  //if location of playback >= movie duration
  if (myMovie.time()>= myMovie.duration()) {
    println("done");
    myMovie.stop(); //stops movie and returns playhead to beginning 

    //switch movies
    if (myMovie == clip1) {
      myMovie = clip2;
    } else {
      myMovie = clip1;
    }

    myMovie.play(); //play movie
  }

  println(myMovie.time());  //prints current playback location

  image(myMovie, 0, 0);  //displays movie
}
