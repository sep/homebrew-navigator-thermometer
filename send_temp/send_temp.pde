/* Send a temperature reading from a
thermocouple every second.
*/

#include <OneWire.h>

#define PROBEPIN 3

float currentTemp = 0;
int ledPin = 13;


OneWire probe(PROBEPIN);

void setup() { 
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT); 
} 

void loop() {
  currentTemp = readTemp();
  blinkLED();
  send(currentTemp);
  delay(1000);
}

void blinkLED() {
  digitalWrite(ledPin, HIGH); // set the LED on
  delay(10); // wait a bit
  digitalWrite(ledPin, LOW); // set the LED off
}

void send(float val) {
  Serial.println(val);
}

float readTemp() {
  byte addr[8];
  byte data[12];
  byte i;
  byte reading;
  float celsius, fahrenheit;
  
  probe.reset_search();
  probe.search(addr);
  
  probe.reset();
  probe.select(addr);
  probe.write(0x44,1);
  delay(750);
  reading = probe.reset();
  probe.select(addr);
  probe.write(0xBE);
  
  for ( i = 0; i < 9; i++) {           // we need 9 bytes
    data[i] = probe.read();
  }
 
  unsigned int raw = (data[1] << 8) | data[0];
  byte cfg = (data[4] & 0x60);
  if (cfg == 0x00) raw = raw << 3;  // 9 bit resolution, 93.75 ms
  else if (cfg == 0x20) raw = raw << 2; // 10 bit res, 187.5 ms
  else if (cfg == 0x40) raw = raw << 1; // 11 bit res, 375 ms

  celsius = (float)raw / 16.0;
  fahrenheit = celsius * 1.8 + 32.0;
  return fahrenheit;
}
