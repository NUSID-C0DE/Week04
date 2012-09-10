/**
 * Multivalue Read
 * 
 * Read comma separated value from the serial port 
   and change the color of rectangles.
   
 */


import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class


String[] values = {"",""};      // Data received from the serial port
int val1 = 0;
int val2 = 0;

void setup() 
{
  size(400, 200);
 
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
  fill(val1);                   // change fill color
  rect(50, 50, 100, 100);
  fill(val2); 
  rect(250, 50, 100, 100);

}


//serialEvent function is called when incoming character reaches '\n'
void serialEvent(Serial p){
  String s = "";
  if(p.available() > 0){  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if(s != null){ 
      println("received:"+s);
      values = s.split(",");     // separate values with ',' characters.
      println(values);           
      val1 = int(values[0]);
      val2 = int(values[1]);
    }
  }
}

