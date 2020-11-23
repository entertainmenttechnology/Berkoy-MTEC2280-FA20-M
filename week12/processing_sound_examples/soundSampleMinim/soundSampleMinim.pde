
/* 
 Plays audio file with mouse click.
 Uses Minim Library. Install from Processing Contributed Libraries.
 Reference at http://code.compartmental.net/minim/ under AudioPlayer
 */


import ddf.minim.*; //imports minim library from Processing

Minim minim;
AudioPlayer sample1;  //creates AudioPlayer object called sample1;


void setup() {
  minim = new Minim(this);
  //Load files and designate path
  sample1 = minim.loadFile("sample1.aiff");
}      


void draw() {
}


void mouseClicked(){
  sample1.rewind();
  sample1.play();
}
