int a;

void setup()
{
  Serial.begin(57600);
}

void loop()
{
  a=analogRead(24);
  a=map(a,0,1023,0,254);
  Serial.write(a);
  delay(5);
}

