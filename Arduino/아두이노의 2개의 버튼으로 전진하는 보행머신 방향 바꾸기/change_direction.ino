#include <RFRemocon.h>

int r=24;
int l=25;
int Lval;
int Rval;

void setup()
{
  pinMode(r,INPUT);
  pinMode(l,INPUT);
  RFRemocon.begin(57600);
}

void loop()
{
  digitalWrite(r,HIGH);
  digitalWrite(l,HIGH);
  Rval=digitalRead(24);
  Lval= digitalRead(25);
  
  if(Lval==HIGH){
    if(Rval==LOW){
    RFRemocon.send(KEY_R);
    }
  } 
  
  if(Lval==LOW){
    if(Rval==HIGH){
    RFRemocon.send(KEY_L);
    }
  } 
  
  if(Lval==LOW){
    if(Rval==LOW){
    RFRemocon.send(KEY_D);
    }
  } 
  
    if(Lval==HIGH){
    if(Rval==HIGH){
    RFRemocon.send(KEY_U);
    }
  } 
}
