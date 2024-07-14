void setup(){
  Serial.begin(57600);
randomSeed(24);
}

void loop(){
  int a = random(0,10);
Serial.println(a);
delay(1);
}
