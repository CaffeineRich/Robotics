int led = 15;
int sw = 24;

void setup(){
  pinMode(led, OUTPUT);
  pinMode(sw, INPUT);
}

void loop(){
  digitalWrite(sw,HIGH);
  int sensorValue = digitalRead(24);
  if(sensorValue==HIGH){
    digitalWrite(led,LOW);
  }
    if(sensorValue==LOW){
    digitalWrite(led,HIGH);
  }
}

