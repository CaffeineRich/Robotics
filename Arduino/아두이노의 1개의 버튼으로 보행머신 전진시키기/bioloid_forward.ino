#include <RFRemocon.h>

int sw=24;
int val;

void setup()
{
  pinMode(sw,INPUT);
    RFRemocon.begin(57600);
}

void loop()
{
  digitalWrite(sw,HIGH);
  val= digitalRead(sw);
  if(val==LOW){
    RFRemocon.send(KEY_U);
  }
}
