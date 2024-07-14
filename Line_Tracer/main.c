//#################################################
//#                                               #
//#  PROJECT CODE : Robomix_Humanoid              #           
//#  VERSION      : V1.0                          #
//#  FILE NAME    : main.c                        #
//#  END DATE     : 2011. 07.                     #
//#  Programmer   : OCY                           #
//#                                               #
//#################################################

#include <avr/io.h>    
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdio.h>   
#include <stdlib.h>     

#include "ROBOMIX_H.h"
#include "Linetrace.h"
#include "USE_IT.h"
#include "Virtual_RC.h"

#define   delay_ms   _delay_ms
#define   ACK        virtual_RC(KEY_5)
#define   COMPLETE   virtual_RC(KEY_6)


unsigned char i =0;
int M[100] = {};
int j=0;
int k = 0;
int sp = 100;

void A7line(unsigned int SV, unsigned char speed, unsigned char brake_time);

int main(void)
{
   
	 START();
	//UBRRL = 16;
	 //PORTE |= 0b00000100;
	 //DDRE  &= 0b11111011;

     
	 FND(OFF);
	 Set_Timer(ON);
	 CROSS_TIME(20);                        // 비직각 교차로 보정값
	 PUSH_TIME(80);  //CORELESS : 30 ON NOT 40            // 교차로 감지 후 전진값 
	 //PUSH_TIME(450); //공장형 라인트레이서
	 POLYLINE(N);                           // 여러 갈래로 갈라지는 선들을 만났을 때의 처리(L,N,R) 
     SENSOR(FRONT);                          // 앞뒤중 현재 사용하는 센서 선택(FRONT, REAR, MONO)
	 
	 DRIVER(10,9,7,5);                      // 직진 속도 보정비율 - 250rpm K_ROBOT motor
       
	 delay_ms(1000);
	 Putch_0(0x01);
	 Putch_0(0x01);
	 delay_ms(1000);
	 
	 
	 //A7line(100, sp, 50);
	 
	 /*
	 while(1)
	 {
		 tx_printf_0("%d\r\n", ADC7());
		 delay_ms(100);
	 }
	 */
	 
	 //line(rt,100,50);
	 //right(100,50);
	 //line(lc,100,50);
	 
     
     while(1)
     {
		 int i = RC_100();

		 if(i>0)
		 {
			if(i == 1) {M[j] = 1;} 
			else if(i == 2) {M[j] = 2; break;}
			else if(i == 4) {M[j] = 4;}
			else if(i == 8) {M[j] = 8;}
			else if(i == 16) {M[j] = 16;}
			else if(i == 32) {M[j] = 32;}
			else if(i == 128) {M[j] = 128;}
			else if(i == 256) {M[j] = 256;}
			else if(i == 512) {M[j] = 512;}
			else if(i == 64)  {M[j] = 64;}
            
			j=j+1;
			delay_ms(500);
			
		
		 }
	 }
	 
	  
	 while((PINE & 0b0000100));
     delay_ms(1000);
      
         	
	 
	 while(1)
	 {
		if(M[k]== 1)line(mt,sp,40);
		else if(M[k]== 2) break;
		else if(M[k]== 4)line(lt,sp,40);
		else if(M[k]== 8)line(rt,sp,40);
		else if(M[k]== 16)line(mc,sp,40);
		else if(M[k]== 32)line(lc,sp,40);
		else if(M[k]== 128)line(rc,sp,40);
		else if(M[k]== 512)left(sp,50);
		else if(M[k]== 256)right(sp,50);
		else if(M[k]== 64)A7line(100, sp, 50);
		k++;
	 }

     
	 
}


void A7line(unsigned int SV, unsigned char speed, unsigned char brake_time)
{
	 unsigned char i = 0;
	 unsigned char Temp_CR = 0;
	 unsigned short CR_time = Announce_Cross_Time();
     unsigned short PS_time  = Announce_Push_Time(); 	
   
    Temp_CR = 1;
	 
    while(1)
	{
	    
		 sensor_status();
		 Linetracer(speed);
         
         i = CROSS(CR_time);
           
		 if(ADC7() < SV)  
		 {
             tmotor(10,speed,speed,brake_time);
		     break;
		
         }

    }
}
