/*
DEMO FOR RECEIVING SERIAL DATA FROM TWO SENSORS TO PROCESSING
 (SIMPLER ALTERNATIVE TO "SERIAL HANDSHAKING" METHOD)
 
 THIS EXAMPLE USES TWO DIGITAL SENSORS
 
 Reads values from serial port, written to the port by Arduino.
 Processing does not know which sensor is which, so we reassign the serial values
 to each sensor based on the ranges we established on the Arduino side.
 
 In this example, one button controls the size of the ellipse
 and the other button controls the background color.
 
 Must assign the correct port, see instructions below!
 */

import processing.serial.*; //imports Serial library from Processing

Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port
int BUTTON1val=0; //variable to track button value
int BUTTON2val=0; //variable to track button value

void setup() {
  size(400, 400);
  /*
   IMPORTANT: We must tell Processing which port to read from.
   Run the sketch and check your console to see the results of printArray(Serial.list());
   and that is how you know the port to use.
   On my Mac, it is port 1 and so I open Serial.list()[1].
   */

  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[1]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }

  if (val == 0 || val == 1) { //if serial data is 0 or 1, assign to button1
    BUTTON1val = val;
  } else {
    BUTTON2val = val; //otherwise, assign to button2
  }

  //change background with button
  if (BUTTON1val== 1) {
    background (0, 255, 0);
  } else {
    background (0, 0, 255);
  }

  //change ellipse size with other button
  fill (0);
  if (BUTTON2val==4) {
    ellipse (width/2, height/2, 10, 10);
  } else {
    ellipse (width/2, height/2, 100, 100);
  }


  //print stuff to console so we can see what's what
  println ("val: " + val); 
  println ("BUTTON1val: " + BUTTON1val);
  println ("BUTTON2val: " + BUTTON2val);
}
