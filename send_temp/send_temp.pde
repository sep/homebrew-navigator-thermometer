/* Send a temperature reading from a
thermocouple every second.
*/

int numLoop = 0; // number of times we looped
int ledPin = 13;
void setup() { 
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT); 
} 

void loop() {
  blinkLED();
  send(numLoop);
  delay(1000);
  numLoop++;
}

void blinkLED() {
  digitalWrite(ledPin, HIGH); // set the LED on
  delay(10); // wait a bit
  digitalWrite(ledPin, LOW); // set the LED off
}

void send(int val) {
  Serial.println(val);
}
