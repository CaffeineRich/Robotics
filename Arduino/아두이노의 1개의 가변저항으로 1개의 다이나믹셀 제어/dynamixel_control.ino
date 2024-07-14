#include <RFRemocon.h>

int a=24;
int val;

void setup()
{
  pinMode(a,INPUT);
  RFRemocon.begin(57600);
}

void loop()
{
  val=analogRead(a);
  RFRemocon.send(val);
}
