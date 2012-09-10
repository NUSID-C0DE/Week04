/*
 * IRremote: IRsendDemo - demonstrates sending IR codes with IRsend
 * An IR LED must be connected to Arduino PWM pin 3.
 * Version 0.1 July, 2009
 * Copyright 2009 Ken Shirriff
 * http://arcfn.com
 */

#include <IRremote.h>

IRsend irsend;

void setup()
{
  Serial.begin(9600);
}

void loop() {

   int val = analogRead(A0);
   
   int angle = map(val,0,1023,0,180);
   
   
   irsend.sendSony(angle , 12); // Sony TV power code
   delay(40);
   
}
