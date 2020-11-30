/*
SIMPLE REPEATING TIMER 

Prints to the serial monitor each time the timer is triggered.

Create timers using millis() as an alternative to using delay(), the latter 
of which shuts down the loop() and all communication.

For more on setting up timers using millis(), see:
https://learn.adafruit.com/multi-tasking-the-arduino-part-1/ditch-the-delay

For another approach, check out this timer library:
https://playground.arduino.cc/Code/SimpleTimer/

*/



const int timer = 2000; //2 second timer
unsigned long currentTime = 0; 
unsigned long savedTime = 0;


void setup() {
  Serial.begin(9600); // Start serial communication at 9600 baud
}

void loop() {
  currentTime = millis();
  if (currentTime - savedTime > timer) {
    Serial.println("timer has triggered!");
    savedTime = currentTime;
  }
}
