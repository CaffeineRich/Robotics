#include <Herkulex.h>
int swF=24;
int swR=25;
int swL=26;

void setup()
{
    pinMode(swF, INPUT);
    pinMode(swR, INPUT);
    pinMode(swL, INPUT);
  Herkulex.begin(115200);
  Herkulex.reboot(8);
  Herkulex.reboot(9);
  Herkulex.reboot(10);
  delay(500); 
  Herkulex.initialize();
  delay(200);
}

void loop(){
    digitalWrite(swF,HIGH);
    digitalWrite(swR,HIGH);
    digitalWrite(swL,HIGH);
    int sensorValue1 = digitalRead(24);
    int sensorValue2 = digitalRead(25);
    int sensorValue3 = digitalRead(26);
    
    if(sensorValue1==LOW && sensorValue2==HIGH && sensorValue3==HIGH){
        Herkulex.moveSpeedOne(8, 1000, 100, LED_RED);
        Herkulex.moveSpeedOne(9, -1000, 100, LED_RED);
    }
    
    if(sensorValue1==HIGH && sensorValue2==LOW && sensorValue3==HIGH){
        Herkulex.moveSpeedOne(9, 1000, 100, LED_RED);
        Herkulex.moveSpeedOne(10, -1000, 100, LED_RED);
    }
    
    if(sensorValue1==HIGH && sensorValue2==HIGH && sensorValue3==LOW){
        Herkulex.moveSpeedOne(8, -1000, 100, LED_RED);
        Herkulex.moveSpeedOne(10, 1000, 100, LED_RED);
    }    
    
    if(sensorValue1==HIGH && sensorValue2==HIGH && sensorValue3==HIGH){
        Herkulex.moveSpeedOne(8, 0, 100, LED_BLUE);
        Herkulex.moveSpeedOne(9, 0, 100, LED_BLUE);        
        Herkulex.moveSpeedOne(10, 0, 100, LED_BLUE);
    }    
}
