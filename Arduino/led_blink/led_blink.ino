long portbtn = 13;
long led = 2;
long etatbtn= HIGH;


void setup() {
  // put your setup code here, to run once:
  // initialize digital pin LED_BUILTIN as an output.
  Serial.begin(9600);  
  pinMode(led, OUTPUT);
  pinMode(portbtn, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  etatbtn = digitalRead(portbtn);
    digitalWrite(led, !etatbtn);   // turn the LED on (HIGH is the voltage level)
  
  
//  delay(500);                       // wait for a second
//  digitalWrite(13, LOW);    // turn the LED off by making the voltage LOW
//  delay(500);                       // wait for a second
}
