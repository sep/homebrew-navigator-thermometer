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
  // blink the led and send a number
  digitalWrite(ledPin, HIGH); // set the LED on
  delay(10); // wait a bit
  Serial.println(numLoop);
  digitalWrite(ledPin, LOW); // set the LED off
  delay(1000);
  numLoop++;
}
