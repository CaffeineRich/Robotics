int a;
int b;
int c;

void setup()
{
  Serial.begin(57600);
}

void loop()
{
  a=analogRead(24);
  b=analogRead(25);
  c=analogRead(26);
  a=map(a,0,1023,11,254);
  b=map(b,0,1023,11,254);
  c=map(c,0,1023,11,254);
  
  Serial.write(1);
  Serial.write(a);
  Serial.write(2);
  Serial.write(b);
  Serial.write(3);
  Serial.write(c);
  delay(5);
}
