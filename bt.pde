/*******************************************\
Temperature sending sketch

Periodically send a value from an attached
thermocouple through a serial port...which is
supposed to be a bluetooth dongle.
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
    BlueSerial.begin(115200);
 
    // Say we are starting the serial com
    BlueSerial.println("Bluetooth start!");
    
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
    BlueSerial.print( 1, BYTE );
    delay(1000);
    
}

