void setup()
{
  Serial.begin(57600);
}

void loop()
{
int i =random(5,15);
Serial.println(i);
delay(1);
}
