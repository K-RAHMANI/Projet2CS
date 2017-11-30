#include <Adafruit_CC3000.h>
#include <SPI.h>
#include <aREST.h>
#include <AFMotor.h>
AF_DCMotor motor(1,MOTOR12_64KHZ);
AF_DCMotor motor2(2,MOTOR12_64KHZ);
#define ADAFRUIT_CC3000_IRQ   3
#define ADAFRUIT_CC3000_VBAT  5
#define ADAFRUIT_CC3000_CS    10
#define WLAN_SSID       "koko"
#define WLAN_PASS       "koko2017"
#define WLAN_SECURITY   WLAN_SEC_WPA2
Adafruit_CC3000 cc3000 = Adafruit_CC3000(ADAFRUIT_CC3000_CS,ADAFRUIT_CC3000_IRQ,ADAFRUIT_CC3000_VBAT,SPI_CLOCK_DIV2);                                        
aREST rest = aREST();
Adafruit_CC3000_Server restServer(80);
void setup(void)
{  
  Serial.begin(115200);
  motor.setSpeed(150);  
  motor2.setSpeed(150);
  pinMode(8, OUTPUT);
  if (!cc3000.begin())
  {
    Serial.println(F("Couldn't begin()! Check your wiring?"));
    while(1);
  }
  if (!cc3000.connectToAP(WLAN_SSID,WLAN_PASS,WLAN_SECURITY)) {
    Serial.println(F("Failed!"));
    while(1);
  }
  while (!cc3000.checkDHCP())
  {
    delay(100);
  }
  restServer.begin();
  Serial.println(F("Listening for connections..."));
  rest.function("runM1",runM1);
  rest.function("runM2",runM2);
  rest.function("ledOn",ledOn);
  rest.function("ledOff",ledOff);
  rest.function("Both",Both);
}

void loop() {
  Adafruit_CC3000_ClientRef client = restServer.available();
  rest.handle(client);
}
int runM1(String command) {
   motor.run(FORWARD);      // turn it on going forward
     delay(3000);
   motor.run(RELEASE);     // the other way
   return 1;
}
int runM2(String command) {
  motor2.run(BACKWARD);     // the other way
  delay(3000);
  motor2.run(RELEASE);     // the other way
  return 1;
}
int Both(String command) {
  motor.run(FORWARD); 
  motor2.run(BACKWARD);     // the other way
  delay(3000);
  motor2.run(RELEASE);     // the other way
  motor.run(RELEASE);     // the other way
  return 1;
}
int ledOn(String command) {
  digitalWrite(8,1);
  return 1;
}
int ledOff(String command) {
  digitalWrite(8,0);
  return 1;
}
