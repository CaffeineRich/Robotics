void setup()
{
  Serial.begin(57600);
}

void loop()
{
  Serial.println(micros());
  delay(1);
}
