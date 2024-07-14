#include <Servo.h>

Servo servo;

int button1 = 24;
int button2 = 25;
int value;

void setup()
{
  servo.attach(26);
}

void loop()
{
  digitalWrite(button1,HIGH);
  digitalWrite(button2,HIGH);
  int i=digitalRead(button1);
  int j=digitalRead(button2);
  value= servo.read();
  if(i==HIGH){
    if(j==HIGH){
      servo.write(value);
    }
  }
  
    if(i==LOW){
    if(j==HIGH){
      servo.write(value+1);
            delay(20);
    }
  }
  
      if(i==HIGH){
    if(j==LOW){
      servo.write(value-1);
      delay(20);
    }
  }
  
   if(i==LOW){
    if(j==LOW){
      servo.write(value);
    }
  }
}
