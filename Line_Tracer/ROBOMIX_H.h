//#################################################
//#                                               #
//#  PROJECT CODE : Robomix KIT  main controller  #           
//#  COMPANY NAME : BrainMission                  #
//#  VERsION      : beta                          #
//#  FILE NAME    : Global_Def.h                  #
//#  END DATE     : 2011. 07.                     #
//#  Programmer   : Oh Chang Yeon                 #
//#                                               #
//#################################################

#ifndef _ROBOMIX_H_
#define _ROBOMIX_H_

#define  F_CPU        16000000UL   //delay.h에서 사용됨 

#define  KEY_U      1
#define  KEY_D      2
#define  KEY_L      4
#define  KEY_R      8
#define  KEY_1     16
#define  KEY_2     32
#define  KEY_3     64
#define  KEY_4    128
#define  KEY_5    256
#define  KEY_6    512

#define  BB       101

#define  FND_ON       PORTE |= 0b00100000
#define  FND_OFF      PORTE &= 0b11011111

#define  BUZZERON     DDRF |= 0b00000001
#define  BUZZEROFF    DDRF &= 0b11111110

#define  ON         1
#define  OFF        0

#define  SLAVE             0x01
#define  MASTER            0x02

#define  DATA_STOP         0x00
#define  SEND_7SENSOR      0x01


#define  BIT0       0b00000001
#define  BIT1       0b00000010
#define  BIT2       0b00000100
#define  BIT3       0b00001000
#define  BIT4       0b00010000
#define  BIT5       0b00100000
#define  BIT6       0b01000000
#define  BIT7       0b10000000

#define  PD_ADD     0x12
#define  PC_ADD     0x15
#define  PA_ADD     0x1B


extern volatile unsigned short rServo_PWM_A[10];
extern volatile unsigned short rServo_PWM_B[10];
    
extern volatile unsigned char fServo_Enable_A[10];
extern volatile unsigned char fServo_Enable_B[10];
extern volatile unsigned char iServo_Address_A;
extern volatile unsigned char iServo_Address_B;
extern volatile unsigned char rServo_A_Bit;
extern volatile unsigned char rServo_B_Bit;

extern volatile unsigned char pServo_PWM_pointer;

extern volatile unsigned char rRC_100_Buffer[6];
extern volatile unsigned char pRC_100_BufferPointer;
extern volatile unsigned char fRC_100_Buffer_Full;
extern volatile unsigned int  rRC_key;

extern volatile unsigned char rUART0_Buffer[5];
extern volatile unsigned char pUART0_BufferPointer;
extern volatile unsigned char pUART0_PacketfUll;

extern volatile unsigned char rDCmotorL1_Action_MASK;
extern volatile unsigned char rDCmotorR1_Action_MASK;
extern volatile unsigned char rZigbee_CNTRL_Action_MASK;
extern volatile unsigned char rZigbee_Condition_Alarm_MASK;

extern volatile signed char pEX_DCmotorL1_Status;
extern volatile signed char pEX_DCmotorR1_Status;

extern volatile unsigned char rDCmotorL2_Action_MASK;
extern volatile unsigned char rDCmotorR2_Action_MASK;


extern volatile signed char pEX_DCmotorL2_Status;
extern volatile signed char pEX_DCmotorR2_Status;


extern volatile unsigned int Zigbee_Wait_Counter;

extern volatile unsigned long int cEncoder_Counter1;
extern volatile unsigned long int cEncoder_Counter2;

//라인트레이서 관련 레지스터 
extern volatile unsigned char UART_Rec_Byte;
extern volatile unsigned char UART_TG_reg;

//라인트레이서 관련 카운터 
extern volatile unsigned int m_counter;
extern volatile unsigned int antilock_counter;
extern volatile unsigned int global_counter;

extern volatile unsigned char speed_L;
extern volatile unsigned char speed_R;

extern volatile unsigned char g_cBuzzerOnReg;


extern void START(void);

extern void servo1(char value);
extern void servo2(char value);
extern void servo3(char value);
extern void servo4(char value);
extern void servo5(char value);

extern void servo_A(char number, char value);
extern void servo_B(char number, char value);
extern void servo_a1(char value);
extern void servo_a2(char value);
extern void servo_a3(char value);
extern void servo_a4(char value);
extern void servo_a5(char value);
extern void servo_a6(char value);
extern void servo_a7(char value);
extern void servo_a8(char value);
extern void servo_a9(char value);
extern void servo_a10(char value);
extern void servo_b1(char value);
extern void servo_b2(char value);
extern void servo_b3(char value);
extern void servo_b4(char value);
extern void servo_b5(char value);
extern void servo_b6(char value);
extern void servo_b7(char value);
extern void servo_b8(char value);
extern void servo_b9(char value);
extern void servo_b10(char value);

extern int AD_CON(unsigned char PORT_NUM);

extern int ADC1(void);
extern int ADC2(void);
extern int ADC3(void);
extern int ADC4(void);
extern int ADC5(void);
extern int ADC6(void);
extern int ADC7(void);

extern void motor1(signed char speed);
extern void motor2(signed char speed);
extern void motor3(signed char speed);
extern void motor4(signed char speed);

extern void LED(unsigned char mask,unsigned char value);

extern void delay_ms(unsigned int m);
extern void delay_10ms(unsigned int m);

extern unsigned int RC_100(void);

extern char Getch(void);
extern void Putch(char data);
extern void tx_string(char *);
extern void tx_printf(char *form, ...);

extern char Getch_0(void);
extern void Putch_0(char data);
extern void tx_string_0(char *);
extern void tx_printf_0(char *form, ...);

extern void _Putch0(char data);

extern void FND(unsigned char status);





#endif
