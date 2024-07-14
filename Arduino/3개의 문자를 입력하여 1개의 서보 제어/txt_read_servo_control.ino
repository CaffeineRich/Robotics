#include <Servo.h> 

Servo servo;




void setup()
{
  servo.attach(24);
  Serial.begin(57600);
}

void loop()
{
  if (Serial.available() > 0) {
		int a = Serial.read();

if(a=='L'){
  servo.write(1);
}

if(a=='M'){
    servo.write(90);
}

if(a=='H'){
  servo.write(179);
  }
}
}
