/**
 * Multivalue Read
 * 
 * Read comma separated value from the serial port 
   and change the color of rectangles.
   
 */


import processing.serial.*;  // Import Serial class library
Serial myPort;  // Create object from Serial class



float val1 = 0;
float val2 = 0;

void setup() 
{
  size(400, 200);
 
  //for Windows
  //String portName = "COM97"; //change this port the same name as Arduino->Tool->Serial Port
  //for Mac OSX
  String portName = Serial.list()[0]; //the first port
   
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n'); // buffer incoming characters until line feed.
}

//serialEvent function is called when incoming character reaches '\n'
void serialEvent(Serial p){
  String s = "";        // string value received.
  String[] values;      // splitted string values.
  
  if(p.available() > 0){  // check number of characters in the serial buffer 
    s = p.readString();   // read string.
    if(s != null){ 
      println("received:"+s);
      
      values = s.split(",");     // separate values with ',' characters.
      println(values);           
      
      val1 = float(values[0]);
      val2 = float(values[1]);
    }
  }
}

void draw()
{
  background(255);             // Set background to white
  fill(val1);                   // change fill color
  rect(50, 50, 100, 100);
  fill(val2); 
  rect(250, 50, 100, 100);

}


