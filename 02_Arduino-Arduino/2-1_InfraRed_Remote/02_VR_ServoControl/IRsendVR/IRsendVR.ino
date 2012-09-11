/*
 * IRremote: IRsendDemo - demonstrates sending IR codes with IRsend
 * An IR LED must be connected to Arduino PWM pin 3.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h> // include IR remote library

IRsend irsend; // variable for ir send class

void setup()
{
  Serial.begin(9600);
}

void loop() {

   int val = analogRead(A0);
   
   int angle = map(val,0,1023,0,180);
   
   
   irsend.sendSony(angle , 12); // send signal by Sony TV code (val, byte length);
  
   delay(40);
   
}
