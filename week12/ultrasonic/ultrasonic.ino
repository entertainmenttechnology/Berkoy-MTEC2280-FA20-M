/*
Ultrasonic Distance Sensor Demo

Modifed by AB from https://www.instructables.com/Simple-Arduino-and-HC-SR04-Example/

Use for HC-SR04 type ping distance sensor
(If using US-100 type, make sure no back jumper is connected)

For US-100 type Ultrasonic sensor and UART mode, see:
https://www.adafruit.com/product/4019 
https://github.com/stoduk/PingSerial

For more on pulseIn(): 
https://www.arduino.cc/reference/en/language/functions/advanced-io/pulsein/


***Wiring***
VCC to arduino 5v 
GND to arduino GND (note: may be 1 or 2 GND pins)
Echo to Arduino pin 13 
Trig to Arduino pin 12

*/


const int trigPin = 13;
const int echoPin = 12;
long duration, distance;

void setup() {
  Serial.begin (9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
  digitalWrite(trigPin, LOW);  
  delayMicroseconds(2); 
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10); 
  digitalWrite(trigPin, LOW);
  
  duration = pulseIn(echoPin, HIGH);
  distance = (duration/2) / 29.1;
  
  if (distance >= 200 || distance <= 0){
    Serial.println("Out of range");
  }
  else {
    Serial.print(distance);
    Serial.println(" cm");
  }
  delay(500);
}
