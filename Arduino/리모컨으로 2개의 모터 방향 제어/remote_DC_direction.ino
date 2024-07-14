#include <RFRemocon.h>
#include <DCM.h>
#include <MsTimer2.h>


DCM motor1;
DCM motor2;

void setup()
{
    motor1.attachPins(12,13);  
    motor2.attachPins(14,15);  
    RFRemocon.begin(57600);
}

void loop()
{
  int data = RFRemocon.recieve();
  if(data >= 0)
  {
      if(data & KEY_U){   
      motor1.write(CCW,5);
      motor2.write(CW,5);
      }
      
      else if(data & KEY_D){   
      motor1.write(CW,5);
      motor2.write(CCW,5);
      }
      
      else if(data & KEY_L){    
      motor1.write(CCW,5);
      motor2.write(CCW,5);
      }
      
      else if(data & KEY_R){    
      motor1.write(CW,5);
      motor2.write(CW,5);
      }
      
      else{
      motor1.write(STOP,0);
      motor2.write(STOP,0);  
      }
  }
}
