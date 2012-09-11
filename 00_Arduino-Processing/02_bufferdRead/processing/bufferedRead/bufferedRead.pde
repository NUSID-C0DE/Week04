/**
 * Bufferd Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * Use bufferUntil('\n') function to set serialEvent() function to be called
 * whenever '\n' character is received.
 */


import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class


int val;      // Data received from the serial port

void setup() 
{
  size(200, 200); 
  //for Windows
  String portName = "COM97"; //change this port the same name as Arduino->Tool->Serial Port
  //for Mac OSX
  //String portName = Serial.list()[0]; //the first port
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // buffer incoming characters until line feed.
}

void draw()
{
  background(255);             // Set background to white
  fill(val);                   // change fill color
  rect(50, 50, 100, 100);
}

//serialEvent function is called when incoming character reaches '\n'
void serialEvent(Serial p){
  String s = "";
  if(p.available() > 0){  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if(s != null){ 
      println("received:"+s);
      val = int(s);       // convert string value into float value
      println("val:"+val);
    }
  }
}

