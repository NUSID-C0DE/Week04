/**
 * Simple Write
   
   Write a mouseY position value as a brightness value for an LED.
 
 */


import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class


float val;      // Data received from the serial port

void setup() 
{
  size(255, 255);
  frameRate(10);
  //for Windows
  //String portName = "COM97"; //change this port name to the same name as Tools -> Serial Port 
  
  //for Mac OS
  String portName = Serial.list()[0]; //for Mac use the first port or the serial list   
  myPort = new Serial(this, portName, 9600);

}

void draw()
{
  
  int brightness = 255 - mouseY; // assign mouseY position as brightness value.
  
  background(255);             // Set background to white
  fill(brightness);
  rect(75, 75, 100, 100);

  myPort.write(brightness+"\n"); // send brightness 
  
}


