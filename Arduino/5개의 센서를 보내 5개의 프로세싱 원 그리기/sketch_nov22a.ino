int a;
int b;
int c;
int d;
int e;

void setup()
{
  Serial.begin(57600);
}

void loop()
{
  a=analogRead(24);
  b=analogRead(25);
  c=analogRead(26);
  d=analogRead(27);
  e=analogRead(28);
  a=map(a,0,1023,5,100);
  b=map(b,0,1023,5,100);
  c=map(c,0,1023,5,100);
  d=map(d,0,1023,5,100);
  e=map(e,0,1023,5,100);
  
  Serial.write(1);
  Serial.write(a);
  Serial.write(2);
  Serial.write(b);
  Serial.write(3);
  Serial.write(c);
  Serial.write(4);
  Serial.write(d);
  Serial.write(5);
  Serial.write(e);
  delay(5);
}
