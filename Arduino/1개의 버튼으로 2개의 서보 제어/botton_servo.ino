#include <Servo.h>

Servo servo1;
Servo servo2;
int sw=24;
int value;
int i=0;

void setup()
{
 servo1.attach(25);
 servo2.attach(26);
}

void loop()
{
  digitalWrite(sw,HIGH);
  value=digitalRead(sw);
  if(value==0){
    if(i==0){
      i=1;
    }
    else if(i==1){
      i=0;
    }
    delay(200);
  }
  if(i==0){
    servo1.write(70);
    servo2.write(110);
 
  }
  if(i==1){
    servo1.write(90);
    servo2.write(90);
  }
}
