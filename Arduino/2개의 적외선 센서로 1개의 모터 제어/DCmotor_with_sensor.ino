#include <MsTimer2.h>
#include <DCM.h>

DCM motor1;
int sensorValue1;
int sensorValue2;

void setup()
{
    motor1.attachPins(16,17);  

}

void loop()
{
  sensorValue1 = analogRead(24);
  sensorValue2 = analogRead(25);
  if(sensorValue1<100){
    if(sensorValue2>100){
  motor1.write(CW,5);
    }
  }
    if(sensorValue1>100){
    if(sensorValue2<100){
  motor1.write(CCW,5);
    }
  }
     if(sensorValue1>100){
    if(sensorValue2>100){
  motor1.write(STOP,0);
    }
  }
     if(sensorValue1<100){
    if(sensorValue2<100){
  motor1.write(STOP,0);
    }
  }
}


