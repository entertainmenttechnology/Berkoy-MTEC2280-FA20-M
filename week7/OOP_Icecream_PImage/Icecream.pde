//define the class outside of setup() and draw()
//can be placed below draw or as a separate tab like this
//name of class gets capitalized

class Icecream {
  //**instance variables**
  int x;
  int y;
  PImage img;
  int imgWidth;
  int imgHeight;
  

  //**constructor**
  //like setup() function within class
  //constructor arguments are temporary and used to initialize variables inside object
  Icecream(int tempX, int tempY, String tempImg, int tempImgWidth, int tempImgHeight) {
    x= tempX;
    y= tempY;
    img= loadImage (tempImg);
    imgWidth = tempImgWidth;
    imgHeight = tempImgHeight;
  }

  //**methods** 
  //these are functions for the object
  void display() {
    image (img, x, y, imgWidth, imgHeight);
  } 

  void fall() {
    if (y>height+100) {
      y=-200;
    } else {
      y++;
    }
  }

  void grow() {
    imgWidth=constrain(imgWidth, 0, width);
    imgHeight=constrain(imgHeight, 0, width);
    if (keyPressed) {
      if (key== '1') {
        imgWidth++;
        imgHeight++;
      } else if (key=='2') {
        imgWidth--;
        imgHeight--;
      }
    }
  }
}
