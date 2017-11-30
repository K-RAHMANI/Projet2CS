/***************************************************
  Neo Pixel Christmahanukwanzaa Tree - CC3000 Version
    
  Light up a tree with all the colors of the holidays!
  Control the color, pattern, size, and speed of animation of a
  strip of neo pixels through a web page.
  
  See the Adafruit learning system guide for more details
  and usage information:
  
  Dependencies:
  - Adafruit CC3000 Library 
    https://github.com/adafruit/Adafruit_CC3000_Library
  - Neo Pixel Library
    https://github.com/adafruit/Adafruit_NeoPixel
  - CC3000 MDNS Library
    https://github.com/adafruit/CC3000_MDNS/
  
  License:
 
  This example is copyright (c) 2013 Tony DiCola (tony@tonydicola.com)
  and is released under an open source MIT license.  See details at:
    http://opensource.org/licenses/MIT
  
  This code was adapted from Adafruit CC3000 library example 
  code which has the following license:
  
  Designed specifically to work with the Adafruit WiFi products:
  ----> https://www.adafruit.com/products/1469

  Adafruit invests time and resources providing this open source code, 
  please support Adafruit and open-source hardware by purchasing 
  products from Adafruit!

  Written by Limor Fried & Kevin Townsend for Adafruit Industries.  
  BSD license, all text above must be included in any redistribution
 ****************************************************/
#include <Adafruit_CC3000.h>
#include <SPI.h>
#include <CC3000_MDNS.h>

// CC3000 configuration
#define     ADAFRUIT_CC3000_IRQ    3    // MUST be an interrupt pin!
#define     ADAFRUIT_CC3000_VBAT   5    // VBAT and CS can be any two pins
#define     ADAFRUIT_CC3000_CS     10
// Use hardware SPI for the remaining pins
// On an UNO, SCK = 13, MISO = 12, and MOSI = 11
Adafruit_CC3000 cc3000 = Adafruit_CC3000(ADAFRUIT_CC3000_CS, 
                                         ADAFRUIT_CC3000_IRQ, 
                                         ADAFRUIT_CC3000_VBAT,
                                         SPI_CLOCK_DIV2);

// Wireless network configuration
#define     WLAN_SSID              "Classico"      // cannot be longer than 32 characters!
#define     WLAN_PASS              "amine2017"
#define     WLAN_SECURITY          WLAN_SEC_WPA2  // Security can be WLAN_SEC_UNSEC, WLAN_SEC_WEP, WLAN_SEC_WPA or WLAN_SEC_WPA2

// Create a server to listen on port 80 (HTTP).
Adafruit_CC3000_Server server(80);

// Create a multicast DNS responder.
MDNSResponder mdns;

void setup() {
  Serial.begin(9600);
  pinMode(2, OUTPUT);
  digitalWrite(2, HIGH);

  
  // Connect to the wifi network.
  Serial.println(F("Hello, CC3000!\n")); 
  if (!cc3000.begin())
  {
    Serial.println(F("Couldn't begin()! Check your wiring?"));
    while(1);
  }  
     Serial.println(F("Hello, CC3000!\n")); 

  if (!cc3000.connectToAP(WLAN_SSID, WLAN_PASS, WLAN_SECURITY)) {
    Serial.println(F("Failed!"));
    while(1);
  } else 
  {
    Serial.println(F("Connected!"));
   }
  while (!cc3000.checkDHCP())
  {
    delay(1000); // ToDo: Insert a DHCP timeout!
  }  

  // Start multicast DNS responder on 'arduino.local' address.
  if (!mdns.begin("arduino", cc3000)) {
    Serial.println(F("Error setting up MDNS responder!"));
    while(1); 
  }

  // Start listening for HTTP connections.
  server.begin();
  
  Serial.println(F("Listening for connections..."));  
}



void loop() {
  Serial.println(F("Listening for connections..."));  
  // Update MDNS responder.
//  mdns.update();
//    
//  // Handle any HTTP connections.
//  Adafruit_CC3000_ClientRef client = server.available();
//  if (client) {
//    buffer = "";
//    // Expect "GET /arduino/".
//    while (client.available() && buffer.length() < 13) {
//      buffer = buffer + char(client.read());
//    }
//    if (buffer != "GET /arduino/" || !client.available()) {
//      // Return error
//      client.close();
//      return;
//    }
//    // Parse value until '/' character.
//    buffer = "";
//    char ch = client.read();
//    while (client.available() && ch != '/') {
//      buffer = buffer + ch;
//      ch = client.read();
//    }
//    if (ch != '/' || !client.available()) {
//      client.close();
//      return; 
//    }
//    // Parse a single digit value.
//    int value = client.read() - '0';
//    // Update appropriate state for the associated command and value.
//    if (buffer == "scheme") {
//      currentScheme = constrain(value, 0, 6);
//    }
//    else if (buffer == "pattern") {
//      currentPattern = (Pattern)constrain(value, 0, 1);
//    }
//    else if (buffer == "width") {
//      currentWidth = constrain(value, 0, 2);
//    }
//    else if (buffer == "speed") {
//      currentSpeed = speedValues[constrain(value, 0, 3)];
//    }
//    // Return an empty JSON response since the web page is technically expecting JSON data.
//    client.fastrprint(F("HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n"));
//    // Close the connection.
//    client.close();
//  }
//  
//  // Update pixels based on current state.
//  if (currentPattern == BARS) {
//    bars(schemes[currentScheme], barWidthValues[currentWidth], currentSpeed);
//  }
//  else if (currentPattern == GRADIENT) {
//    gradient(schemes[currentScheme], gradientWidthValues[currentWidth], currentSpeed);
//  }
}

