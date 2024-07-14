#define   s1              1
#define   s2              2
#define   s3              4
#define   s4              24
#define   s5              32
#define   s6              64
#define   s7              128

#define   S1              s1
#define   S2              s2
#define   S3              s3
#define   S4              s4
#define   S5              s5
#define   S6              s6
#define   S7              s7

#define   FRONT           00
#define   REAR            01
#define   MONO            02

#define   front           FRONT
#define   rear            REAR
#define   mono            MONO

#define   FT              00
#define   RR              01
#define   MN              02

#define   LC              01
#define   RC              02
#define   MC              03
#define   LT              11
#define   RT              12
#define   MT              13 

#define   lc              LC
#define   rc              RC
#define   mc              MC
#define   lt              LT
#define   rt              RT
#define   mt              MT

#define   BUZZER          buzzer

#define   LINE            line
#define   TLINE           tline
#define   SLINE           sline
#define   FLINE           fline
#define   CUTLINE         cutline
#define   MOTOR           motor
#define   TMOTOR          tmotor
#define   SMOTOR          smotor
#define   LEFT            left
#define   RIGHT           right
#define   LEFT1           left1
#define   LEFT2           left2
#define   LEFT3           left3
#define   LEFT4           left4
#define   LEFT5           left5
#define   LEFT6           left6
#define   LEFT7           left7
#define   RIGHT1          right1
#define   RIGHT2          right2
#define   RIGHT3          right3
#define   RIGHT4          right4
#define   RIGHT5          right5
#define   RIGHT6          right6
#define   RIGHT7          right7

#define   SERVO2          servo2
#define   SERVO3          servo3
#define   SERVO4          servo4
#define   SERVO5          servo5
#define   SERVO6          servo6
#define   SERVO7          servo7

#define   SSERVO2         sservo2
#define   SSERVO3         sservo3
#define   SSERVO4         sservo4
#define   SSERVO5         sservo5
#define   SSERVO6         sservo6
#define   SSERVO7         sservo7


//------------------- 라인트레이서 함수 모음 -------------------------------//


extern void line(unsigned char CR, unsigned char speed, unsigned char brake_time);
extern void tline(unsigned short time, unsigned char speed, unsigned char brake_time);
extern void sline(unsigned char sensor_number, unsigned char speed, unsigned char brake_time);
//extern void fline(unsigned char fsensor_number, unsigned int nSens, unsigned char speed, unsigned char brake_time);
extern void cutline(unsigned short time, unsigned char speed, unsigned char brake_time);

extern void motor(signed char Lspeed, signed char Rspeed);
extern void tmotor(unsigned short time, signed char Lspeed, signed char Rspeed, unsigned char brake_time);
extern void smotor(unsigned char sensor_number, signed char Lspeed, signed char Rspeed, unsigned char brake_time);

extern void left(unsigned char speed, unsigned char brake_time);
extern void right(unsigned char speed, unsigned char brake_time);

extern void left1(unsigned char speed, unsigned char brake_time);
extern void left2(unsigned char speed, unsigned char brake_time);
extern void left3(unsigned char speed, unsigned char brake_time);
extern void left4(unsigned char speed, unsigned char brake_time);
extern void left5(unsigned char speed, unsigned char brake_time);
extern void left6(unsigned char speed, unsigned char brake_time);
extern void left7(unsigned char speed, unsigned char brake_time);

extern void right1(unsigned char speed, unsigned char brake_time);
extern void right2(unsigned char speed, unsigned char brake_time);
extern void right3(unsigned char speed, unsigned char brake_time);
extern void right4(unsigned char speed, unsigned char brake_time);
extern void right5(unsigned char speed, unsigned char brake_time);
extern void right6(unsigned char speed, unsigned char brake_time);
extern void right7(unsigned char speed, unsigned char brake_time);


