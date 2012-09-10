/*
  Analog Read/Write 
 
 
  This example code is in the public domain.
 */
 
// an LED connected on most Arduino boards.
// give it a name:
int led = 11;
int brightness = 0;

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT);  
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

  // read the input on analog pin 0:
  
  brightness = analogRead(A0);

  // print out the value you read:
  Serial.println(brightness); 

   
  analogWrite(led, brightness);   // turn the LED on (HIGH is the voltage level)

  delay(10);               // wait for a while

}
