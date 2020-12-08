/*
DEMO FOR SENDING SERIAL DATA FROM TWO SENSORS TO PROCESSING
(SIMPLER ALTERNATIVE TO "SERIAL HANDSHAKING" METHOD)

THIS EXAMPLE USES ONE ANALOG SENSOR, ONE DIGITAL SENSOR
with a potentiometer reading from A0 and a button reading from digital pin 2.

After reading the sensor values, **we differentiate the range of the two sensors so 
that they do not have overlapping values**, and then we write to the serial port. 
*/

const int POT = A0; //potentiometer hooked up to analog pin A0
const int BUTTON = 2; //button hooked up to digital pin 2
int POTval = 0; //track potentiometer sensor value
int BUTTONval = 0;  //track button sensor value

void setup() {
  pinMode (POT, INPUT); //set pin as input, optional for analog
  pinMode (BUTTON, INPUT); //set pin as input
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  BUTTONval = digitalRead(BUTTON);  //read sensor and assign to BUTTONval
  delay(10); //small delay for debouncing

/* The button will read as 0 (low) or 1 (high). Below, we remap the potentiometer 
 *  values to a range of 2-255, since 0 and 1 overlap with the button. This way, 
 *  we keep our serial data within a byte-sized range, with each sensor having its 
 *  own distinct range of values.
 */
 
  POTval = analogRead(POT); //read sensor and assign to POTval
  POTval = map (POTval, 0, 1023, 2, 255);  //remap pot values. 
  delay(100); // small delay to avoid finicky sensor reading
  

  /////////Uncomment Serial.print() OR Serial.write() and not both!//////////////

  //use Serial.println to send human-readable data to Arduino monitor
  //Serial.println(POTval); 
  //Serial.println(BUTTONval);

  //use Serial.write() to send binary data to Processing
  Serial.write(POTval); 
  Serial.write(BUTTONval); 
}
