#include <MsTimer2.h>
#include <DCM.h>

DCM motor1;
int sw1=24;
int sw2=25;
int val1;
int val2;

void setup()
{
    motor1.attachPins(16,17);  
}

void loop()
{
  digitalWrite(sw1,HIGH);
  digitalWrite(sw2,HIGH);
  val1=digitalRead(sw1);
  val2=digitalRead(sw2);
  if(val1==LOW){
    if(val2==HIGH){
   motor1.write(CW,5);
    }
  }
    if(val1==HIGH){
    if(val2==LOW){
   motor1.write(CCW,5);
    }
  }
      if(val1==HIGH){
    if(val2==HIGH){
   motor1.write(STOP,0);
    }
  }
      if(val1==LOW){
    if(val2==LOW){
   motor1.write(STOP,0);
    }
  }

  }
