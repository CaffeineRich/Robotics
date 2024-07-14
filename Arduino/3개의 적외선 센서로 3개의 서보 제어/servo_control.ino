#include <Servo.h>

Servo servo1;
Servo servo2;
Servo servo3;

int sensor1 = 24;
int sensor2 = 25;
int sensor3 = 26;
int value1;
int value2;
int value3;

void setup()
{
  servo1.attach(27);
    servo2.attach(28);
      servo3.attach(29);
}
void loop()
{
  value1 = analogRead(sensor1);
    value2 = analogRead(sensor2);
      value3 = analogRead(sensor3);
  value1 = map(value1, 0, 1023, 0, 179);
    value2 = map(value2, 0, 1023, 0, 179);
      value3 = map(value3, 0, 1023, 0, 179);
  servo1.write(value1);
    servo2.write(value2);
      servo3.write(value3);
  delay(1);
}
