/*
  DEMO FOR SENDING SERIAL DATA FROM TWO SENSORS TO PROCESSING
  (SIMPLER ALTERNATIVE TO "SERIAL HANDSHAKING" METHOD)

  THIS EXAMPLE USES TWO DIGITAL SENSORS
  with buttons reading from digital pins 2 and 4.

  After reading the sensor values, **we differentiate the range of the two sensors so
  that they do not have overlapping values**, and then we write to the serial port.
*/

const int BUTTON1 = 2; //button hooked up to digital pin 2
const int BUTTON2 = 4; //button hooked up to digital pin 4
int BUTTON1val = 0; //track button sensor value
int BUTTON2val = 0;  //track button sensor value

void setup() {
  pinMode (BUTTON1, INPUT); //set pin as input
  pinMode (BUTTON2, INPUT); //set pin as input
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  BUTTON1val = digitalRead(BUTTON1);  //read sensor and assign to BUTTONval
  delay(10); //small delay for debouncing

  BUTTON2val = digitalRead(BUTTON2);  //read sensor and assign to BUTTONval
  delay(10); //small delay for debouncing

  /* The button will read as 0 (low) or 1 (high). Below, we remap the second
      button's values to 3 and 4. This way, we keep our serial data within
      a byte-sized range, with each sensor having its own distinct range of values.
  */


  if (BUTTON2val == 1) { //if button is high
    BUTTON2val = 4; // reassign "4" to indicate high
  } else {
    BUTTON2val = 3;  //otherwise reassign "3" to inidicate low
  }



  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////

  //use Serial.println to send human-readable data to Arduino monitor
  //Serial.println(BUTTON1val);
  //Serial.println(BUTTON2val);

  //use Serial.write() to send binary data to Processing
  Serial.write(BUTTON1val);
  Serial.write(BUTTON2val);
  delay(100); //small delay added, otherwise serial port can get finicky
}
