import processing.serial.*;
Serial myPort;

void setup()
{
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 57600);
    size(500,500);
  stroke(255);
  background(0,0,0);
}

void draw()
{
  while (myPort.available() > 0) {
    int inByte = myPort.read();
    fill(0);
    ellipse(250,250,inByte,inByte);
  }
}
