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
  rest.function("forward",forward);
  rest.function("backward",backward);
  rest.function("stop",stopit);
  rest.function("led",led);
}

void loop() {
  Adafruit_CC3000_ClientRef client = restServer.available();
  rest.handle(client);
}
int forward(String command) {
   motor.run(FORWARD);      // turn it on going forward
   return 1;
}
int backward(String command) {
  motor2.run(BACKWARD);     // the other way
  delay(3000);
  motor2.run(RELEASE);     // the other way
  return 1;
}
int stopit(String command) {
  motor.run(RELEASE);     // the other way
  motor2.run(RELEASE);     // the other way
  return 1;
}
int led(String command) {
  digitalWrite(8,1);
  return 1;
}
