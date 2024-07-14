import processing.serial.*;
Serial myPort;
int value;

void setup()
{
  println(Serial.list());
  myPort=new Serial(this, Serial.list()[0],57600);
  size(180,10);
  background(150);
}

void mouseDragged()
{
  value=mouseX;
}

void draw(){
    myPort.write(value);
}
