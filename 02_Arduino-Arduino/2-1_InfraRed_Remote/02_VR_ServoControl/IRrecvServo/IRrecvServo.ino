/*
 * IRremote: IRrecvDemo - demonstrates receiving IR codes with IRrecv
 * An IR detector/demodulator must be connected to the input RECV_PIN.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h>
#include <Servo.h>


Servo myservo;

int RECV_PIN = 11;
int SERVO_PIN = 3;
IRrecv irrecv(RECV_PIN);
decode_results results;

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn(); // Start the receiver
  
  myservo.attach(SERVO_PIN);
  pinMode(2,INPUT);
}

void loop() {
  if (irrecv.decode(&results)) {
    int angle = results.value;
    Serial.println(results.value, DEC);
    myservo.write(angle);
    irrecv.resume(); // Receive the next value
  }
  
}
