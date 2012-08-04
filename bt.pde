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
#define TXPIN 11
#define RXPIN 12
 
// Create an instance of the software serial object
SoftwareSerial BlueSerial(RXPIN, TXPIN);
 
// Main application entry point 
void setup()
{
    // Define the appropriate input/output pins
    pinMode(RXPIN, INPUT);
    pinMode(TXPIN, OUTPUT);
 
    // Begin communicating with the bluetooth interface
    Serial.begin(9600);
    BlueSerial.begin(9600);
 
    // Say we are starting the serial com
    Serial.println("Serial start!");
    BlueSerial.println("Serial start!");
}
 
// Main application loop
void loop()
{
    // Wait for command-line input
    if(Serial.available() > 0)
    {
        // Read off all bytes
        BlueSerial.print( Serial.read(), BYTE );
    }
}

