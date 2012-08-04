/*******************************************\
 BlueSMiRF I/O Example
 
 Sends and recieves single-bytes between the
 client-USB connection and the tethered
 Bluetooth device.
 
 Jeremy Bridon
 jgbridon@gmail.com
\********************************************/
 
// Included for serial communication
#include <SoftwareSerial.h>
 
// Define pins you're using for serial communication
// for the BlueSMiRF connection
#define TXPIN 1
#define RXPIN 0
#define LEDPIN 13
 
// Create an instance of the software serial object
SoftwareSerial BlueSerial(RXPIN, TXPIN);
int ledState;

// Main application entry point 
void setup()
{
    // Define the appropriate input/output pins
    pinMode(RXPIN, INPUT);
    pinMode(TXPIN, OUTPUT);
    pinMode(LEDPIN, OUTPUT);
 
    // Begin communicating with the bluetooth interface
    Serial.begin(9600);
    BlueSerial.begin(115200);
 
    // Say we are starting the serial com
    Serial.println("Serial start!");
    BlueSerial.println("Serial start!");
    
    ledState = LOW;
}
 
// Main application loop
void loop()
{
    // if the LED is off turn it on and vice-versa:
    if (ledState == LOW)
      ledState = HIGH;
    else
      ledState = LOW;

    digitalWrite(LEDPIN, ledState);
    BlueSerial.print( Serial.read(), BYTE );
    delay(1000);
    
}

