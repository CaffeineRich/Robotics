byte SendByte1=0;
byte SendByte2=0;
byte SendByte3=0;


void setup()
{
  Serial.begin(57600);
}

void loop()
{
  int sensorValue1 = analogRead(0);
    int sensorValue2 = analogRead(1);
      int sensorValue3 = analogRead(2);
  SendByte1=map(sensorValue1, 0, 1023, 0, 255);
  SendByte2=map(sensorValue2, 0, 1023, 0, 255);
  SendByte3=map(sensorValue3, 0, 1023, 0, 255);
  Serial.write(SendByte1);
  Serial.write(SendByte2);
  Serial.write(SendByte3);
  delay(1);
}
