#include <MsTimer2.h>
#include <DCM.h>

DCM motor1;
DCM motor2;
int forward=24;
int left=25;
int right=26;
int Fval;
int Lval;
int Rval;

void setup()
{
  pinMode(forward,INPUT);
  pinMode(left,INPUT);
  pinMode(right,INPUT);
  motor1.attachPins(14,15);
  motor2.attachPins(12,13);
}

void loop()
{
  digitalWrite(forward,HIGH);
  digitalWrite(left,HIGH);
  digitalWrite(right,HIGH);
  Fval=digitalRead(forward);
  Lval=digitalRead(left);
  Rval=digitalRead(right);
  
    if(Fval==LOW){
    if(Lval==HIGH){
    if(Rval==HIGH){
          motor1.write(CCW,10);
          motor2.write(CW,10);
      }
    }
  }
  
    if(Fval==HIGH){
    if(Lval==LOW){
    if(Rval==HIGH){
          motor1.write(CW,10);
          motor2.write(CW,10);
      }
    }
  }
  
    if(Fval==HIGH){
    if(Lval==HIGH){
    if(Rval==LOW){
          motor1.write(CCW,10);
          motor2.write(CCW,10);
      }
    }
  }
  
    if(Fval==HIGH){
    if(Lval==HIGH){
    if(Rval==HIGH){
          motor1.write(STOP,0);
          motor2.write(STOP,0);
      }
    }
  }
  
    if(Fval==LOW){
    if(Lval==LOW){
    if(Rval==LOW){
          motor1.write(STOP,0);
          motor2.write(STOP,0);
      }
    }
  }

    if(Fval==HIGH){
    if(Lval==LOW){
    if(Rval==LOW){
          motor1.write(STOP,0);
          motor2.write(STOP,0);
      }
    }
  }

    if(Fval==LOW){
    if(Lval==HIGH){
    if(Rval==LOW){
          motor1.write(STOP,0);
          motor2.write(STOP,0);
      }
    }
  }
  
    if(Fval==LOW){
    if(Lval==LOW){
    if(Rval==HIGH){
          motor1.write(STOP,0);
          motor2.write(STOP,0);
      }
    }
  }
}
  
