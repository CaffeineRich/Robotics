int a = 24;
unsigned long b; //unsigned long is much bigger than 'int'
 
void setup()
{
  Serial.begin(57600);
}
 
void loop()
{
  pinMode(a, OUTPUT);
  digitalWrite(a, HIGH);
  delayMicroseconds(5);
  digitalWrite(a, LOW);
  delayMicroseconds(25);
  pinMode(a, INPUT);
  b = pulseIn(a, HIGH);  //pulse function
  Serial.println(b);
  delay(10);
 
}
