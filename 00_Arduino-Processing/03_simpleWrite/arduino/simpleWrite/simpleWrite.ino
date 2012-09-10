/*
  Serial Write 
  Receive a value from Processing sketch and change an LED brightness.
  
  Yuta Nakayama
  didny@nus.edu.sg
  10/09/2012
  
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
  if(Serial.available() > 0){
    brightness = Serial.parseInt();
  }
  // print out the value you read:
  Serial.println(brightness);    
  analogWrite(led, brightness);   // turn the LED on (HIGH is the voltage level)

  delay(10);               // wait for a while

}
