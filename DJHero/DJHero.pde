// Wire Master Reader
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Reads data from an I2C/TWI slave device
// Refer to the "Wire Slave Sender" example for use with this

// Created 29 March 2006

// This example code is in the public domain.


#include <Wire.h>

void setup()
{
  Serial.begin(9600);  // start serial for output
  Wire.begin(0x0D); 
}

byte a[10];

void loop()
{
Wire.beginTransmission(0x0D);
Wire.send(0);
Wire.endTransmission();  
Wire.requestFrom(0x0D, 23);
   for (int i=0; i <= 22; i++){
      a[i]=Wire.receive();
   }  
   Serial.print(a[18],DEC);  //buttons blue=64 red=32 green=16
   Serial.print(' '); 
   Serial.print(a[19],DEC); //buttons also blue=4 red=2 green=1
   Serial.print(' ');
   Serial.print(a[20],DEC); //rotation speed >0 clockwise <255 anticlockwise
   Serial.print(' ');
   Serial.println(a[21],DEC); //rotation dir 0=clockwise 255=anticlockwise
}
