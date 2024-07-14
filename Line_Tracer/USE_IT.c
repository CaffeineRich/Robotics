#include <avr/io.h>
#include <avr/interrupt.h>
#include "ROBOMIX_H.h"
#include "Linetrace.h"
#include "USE_IT.h"


void line(unsigned char CR, unsigned char speed, unsigned char brake_time)
{
    
	unsigned char i = 0;
	unsigned char Temp_CR = 0;
	unsigned short CR_time = Announce_Cross_Time();
	unsigned short PS_time  = Announce_Push_Time(); 	
   
    Temp_CR = CR;
	 
    while(1)
	{
	    
		sensor_status();
		Linetracer(speed);
         
        i = CROSS(CR_time);
           
		if(Temp_CR < 10)  
		{

		   if(Temp_CR == i) 
           {
		      //SOUND_ON();
			  tline(PS_time,speed,brake_time);
		      break;
		   }
		
        }

		else if(Temp_CR > 10)
		{  
		   if(Temp_CR == (i+10))
		   {
		      //SOUND_ON();
			  tmotor(PS_time,speed,speed,brake_time);
			  break;
		   }   

		}

    }
       
}


void tline(unsigned short time, unsigned char speed, unsigned char brake_time)
{
     unsigned int Temp_time = 0;
     unsigned short CR_time = Announce_Cross_Time();
     unsigned char i = 0;
   
     Clear_Timer();
   
     while(1)
     {
         i = CROSS(CR_time);    //연속적으로 체크 되어야 한다
	  
	     sensor_status();
	     Linetracer(speed);

	     Temp_time = Announce_Timer();
	     if(Temp_time >= (time * 2))  
	     {
	       // SOUND_ON();
		     braker(brake_time, speed, 0);
		     break;
         }

     }
 
}


void sline(unsigned char sensor_number, unsigned char speed, unsigned char brake_time)
{
     unsigned char Temp = 0;  
     unsigned short CR_time = Announce_Cross_Time(); 
     unsigned char i = 0;

     while(1)
     {
         i = CROSS(CR_time);          //연속적으로 체크 되어야 한다
	  
	     sensor_status();
         Linetracer(speed);
	  
	     Temp = Sensor_value() & sensor_number;
	     if(Temp == sensor_number) 
	     { 
	  	 //SOUND_ON();
		     braker(brake_time,speed,0); 
	         break;
         }
     }
   
   	
}

/*
void fline(unsigned char fsensor_number, unsigned int nSens, unsigned char speed, unsigned char brake_time)
{
   unsigned char Temp = 0;
   
   while(1)
   {
      sensor_status();
      Linetracer(speed);
	  
	  Temp = Read_Front_Sensor(nSens) & fsensor_number;
	  if(Temp == fsensor_number) 
	  { 
	  	 //SOUND_ON();
		 if(speed>=0) braker(brake_time,speed,0); 
	     break;
      }
   }
  
}
*/

void cutline(unsigned short time, unsigned char speed, unsigned char brake_time)
{
	 unsigned int Temp_time = 0;
	 unsigned char TG = 0, Ex_TG = 0;
	 unsigned short CR_time = Announce_Cross_Time();
	 unsigned char i = 0;
	
	 while(1)
	 {
		 i = CROSS(CR_time);             //연속적으로 체크 되어야 한다
		 
		 if(Sensor_value() == 0x00) TG = 1;
		 else TG = 0;
		
		 if((Ex_TG == 0)&&(TG == 1))  Clear_Timer();	
		
		 if(TG == 1) 
		 {
			 gogo(speed,speed);
					
			 Temp_time = Announce_Timer();
	  		 if(Temp_time >= (time * 2))  
	  		 {
	     		//SOUND_ON();
				braker(brake_time, speed, 0);
				break;
      		 }
		 }
		
		 else 
		 {
			 sensor_status();
	     	 Linetracer(speed);
		 }

		 Ex_TG = TG;
	 }
         
}



void motor(signed char Lspeed, signed char Rspeed)
{
	 gogo(Lspeed, Rspeed);
}


void tmotor(unsigned short time, signed char Lspeed, signed char Rspeed, unsigned char brake_time)
{
     unsigned int Temp_time = 0;
     unsigned char i = 0;
     unsigned short CR_time = Announce_Cross_Time();
   
     Clear_Timer();
   
     while(1)
     {
         i = CROSS(CR_time);             //연속적으로 체크 되어야 한다.
		 
		 motor1(Lspeed); motor2(Rspeed);
	  
	     Temp_time = Announce_Timer();
	     if(Temp_time >= (time * 2))  
	     {     
		 //SOUND_ON();
		 
		     if((Lspeed < 0)&&(Rspeed < 0))  braker(brake_time,((Lspeed+Rspeed) * 0.5),1); 
	         else braker(brake_time,((Lspeed+Rspeed) * 0.5),0);
		     break;
         }

     }

}


void smotor(unsigned char sensor_number, signed char Lspeed, signed char Rspeed, unsigned char brake_time)
{
     unsigned char Temp = 0;  
	 unsigned char i = 0;
     unsigned short CR_time = Announce_Cross_Time(); 
	
	 gogo(Lspeed, Rspeed);
    
	 while(1)
     {
         i = CROSS(CR_time);                 //연속적으로 체크되어야 한다
		 Temp = Sensor_value() & sensor_number;
		 if(Temp == sensor_number) 
	   	 { 
	  	    	//SOUND_ON();
			  
	         if((Lspeed < 0)&&(Rspeed < 0))  braker(brake_time,((Lspeed+Rspeed) * 0.5),1); 
	     	 else braker(brake_time,((Lspeed+Rspeed) * 0.5),0);
			
			 break;
         }
   	 }
    
}
 
   



void left(unsigned char speed, unsigned char brake_time)
{
     unsigned char SS1 = 0;
     unsigned char turn = 0;
     unsigned char i = 0;
     unsigned short CR_time = Announce_Cross_Time();

     while(1)
     {
         i = CROSS(CR_time);              //연속적으로 체크 되어야 한다
	  
	     SS1 =  Sensor_value() & 0b00000001;      

	     if(SS1) 
	     {
	         turn++; 
             if(turn == 1) left2(speed,0);
             else if(turn == 2) left3(speed,0);
             else if(turn == 3) left4(speed,0);
		     else if(turn > 3) { braker(brake_time,speed,2); break;}
         }
	  
	     else break;
     }

     left1(speed,0);
     left2(speed,brake_time);
   
} 

   
void right(unsigned char speed, unsigned char brake_time)
{
     unsigned char SS7 = 0;
     unsigned char turn = 0;
     unsigned char i = 0;
     unsigned short CR_time = Announce_Cross_Time();
  
     while(1)
     {
         i = CROSS(CR_time);               //연속적으로 체크 되어야 한다
	  
	     SS7 =  Sensor_value() & 0b10000000;      

	     if(SS7) 
	     {
	         turn++; 
             if(turn == 1) right6(speed,0);
             else if(turn == 2) right5(speed,0);
             else if(turn == 3) right4(speed,0);
		     else if(turn > 3) { braker(brake_time,speed,3); break;}
         }
	  
	     else break;
     }

     right7(speed,0);
     right6(speed,brake_time);
   
}


void left1(unsigned char speed, unsigned char brake_time) {iLeft(1, speed, brake_time);}
void left2(unsigned char speed, unsigned char brake_time) {iLeft(2, speed, brake_time);}
void left3(unsigned char speed, unsigned char brake_time) {iLeft(3, speed, brake_time);}
void left4(unsigned char speed, unsigned char brake_time) {iLeft(4, speed, brake_time);}
void left5(unsigned char speed, unsigned char brake_time) {iLeft(5, speed, brake_time);}
void left6(unsigned char speed, unsigned char brake_time) {iLeft(6, speed, brake_time);}
void left7(unsigned char speed, unsigned char brake_time) {iLeft(7, speed, brake_time);}

void right1(unsigned char speed, unsigned char brake_time) {iRight(1, speed, brake_time);}
void right2(unsigned char speed, unsigned char brake_time) {iRight(2, speed, brake_time);}
void right3(unsigned char speed, unsigned char brake_time) {iRight(3, speed, brake_time);}
void right4(unsigned char speed, unsigned char brake_time) {iRight(4, speed, brake_time);}
void right5(unsigned char speed, unsigned char brake_time) {iRight(5, speed, brake_time);}
void right6(unsigned char speed, unsigned char brake_time) {iRight(6, speed, brake_time);}
void right7(unsigned char speed, unsigned char brake_time) {iRight(7, speed, brake_time);}



