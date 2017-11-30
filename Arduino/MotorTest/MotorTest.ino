// Adafruit Motor shield library
// copyright Adafruit Industries LLC, 2009
// this code is public domain, enjoy!

#include <AFMotor.h>

AF_DCMotor motor(1,MOTOR12_64KHZ);
AF_DCMotor motor2(2,MOTOR12_64KHZ);

void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Motor test!");
  // turn on motor
  motor.setSpeed(150);
  motor2.setSpeed(150);
}

void loop() {
  motor.run(FORWARD);      // turn it on going forward
  motor2.run(FORWARD);     // the other way
  delay(3000);
  motor.run(BACKWARD);      // turn it on going forward
  motor2.run(BACKWARD);     // the other way
  delay(3000);
  motor.run(RELEASE);      // stopped
  motor2.run(RELEASE); 
  delay(3000);  
}
