#define DRIVER      driver


// Dc motor direction 
#define GOGO            0b0110
#define BACK            0b1001
#define PIVOT_LEFT      0b0111
#define PIVOT_RIGHT     0b1110
#define BPIVOT_LEFT     0b1011
#define BPIVOT_RIGHT    0b1101
#define TURN_LEFT       0b0101
#define TURN_RIGHT      0b1010
#define BREAK           0b1111
#define LOOSE           0b0000

#define FRONT           00
#define REAR            01
#define MONO            02

#define L               0x00
#define R               0x01
#define N               0x02

#define on              ON
#define off             OFF
#define l               L
#define r               R
#define n               N


#define driver          DRIVER
#define CROSS_TIME      cross_time
#define PUSH_TIME       push_time
#define SENSOR          sensor
#define POLYLINE        polyline

#define end()           while(1)
#define END()           end()


extern void Set_Timer(unsigned char mode);
extern void DRIVER(float brake0, float brake1, float brake2, float brake3);
extern void cross_time(unsigned short time);
extern void push_time(unsigned short time);
extern unsigned short Announce_Cross_Time(void);
extern unsigned short Announce_Push_Time(void);
extern unsigned int Announce_Timer(void);
extern unsigned char Announce_Sensor(void);
extern void Clear_Timer(void);
extern void sensor_status(void);

extern void Linetracer(unsigned char speed);
extern unsigned char CROSS(unsigned short time); 
extern void braker(unsigned char brake_time,unsigned char speed,unsigned char brake_mode);
extern void iLeft(unsigned char sensor_number, unsigned char speed, unsigned char brake_time);
extern void iRight(unsigned char sensor_number, unsigned char speed, unsigned char brake_time);
extern unsigned char Sensor_value(void);
extern void Im_Slave(void);
extern void Im_Master(void);
extern void sensor(unsigned char dir);
extern unsigned char Announce_Sensor(void);
extern void DIP_SW_Select(void);
extern void polyline(unsigned char dir);
//extern void start(void);
extern void gogo(signed char Lspeed, signed char Rspeed);
extern void DC(unsigned char Dir,unsigned char this_R,unsigned char this_L);
extern void SoundOn(void);
extern void SoundOff(void);
extern void CheckBattery(float Volt);



