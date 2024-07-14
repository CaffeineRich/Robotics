import processing.serial.*;

Serial myPort;  
int sensor0 = 0;
int sensor1 = 0;
int sensor2 = 0;
int exByte = 0;

void setup() 
{
  size(1000, 500);  // Stage size
    
  
  printArray(Serial.list());
 
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 57600);
  
  background(0);
  stroke(255);
  //fill(255);
}

void draw()
{
  
  clear();
  ellipse(250,250, sensor0, sensor0);
  ellipse(500,250, sensor1, sensor1);
  ellipse(750,250, sensor2, sensor2);
  
 
}

void serialEvent(Serial myPort)
{
  int inByte = myPort.read();
  
  if(inByte < 5)
  {
    exByte = inByte;
  }
  else 
  {
    if(exByte == 1) sensor0 = inByte;
    else if(exByte == 2) sensor1 = inByte;
    else if(exByte == 3) sensor2 = inByte;
  }
}
