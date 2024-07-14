#include<Servo.h>
Servo myservo;
int incomingByte = 0;
int value;

void setup()
{
  Serial.begin(57600);
  myservo.attach(24);
}

void loop()
{
  if(Serial.available()>0){
  incomingByte=Serial.read();
  value=incomingByte;
  }
  myservo.write(value);
  delay(10);
}
  
