#line 1 "C:/Project/SCHwash/schWash_Main.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 1 "c:/project/schwash/u_platform.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
<<<<<<< HEAD
#line 35 "c:/users/pcx/documents/schwash/u_platform.h"
=======
#line 36 "c:/project/schwash/u_platform.h"
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1
intmax_t PF_millis(void);

typedef uint8_t PF_pin_type_t;
typedef uint8_t PF_port_type_t;
<<<<<<< HEAD
#line 1 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
=======
#line 1 "c:/project/schwash/uhal_74hc595.h"
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 1 "c:/project/schwash/u_platform.h"
#line 58 "c:/project/schwash/uhal_74hc595.h"
static uint8_t reverseByte(uint8_t agr);
#line 63 "c:/project/schwash/uhal_74hc595.h"
static void clockGenerating();
#line 68 "c:/project/schwash/uhal_74hc595.h"
static void latchGenerating();
#line 75 "c:/project/schwash/uhal_74hc595.h"
void seg7Write(uint8_t seg1, uint8_t seg2);
#line 86 "c:/project/schwash/uhal_74hc595.h"
void seg7WriteNum(uint8_t num1, uint8_t num2);
#line 95 "c:/project/schwash/uhal_74hc595.h"
void seg7Print(uint16_t num1, uint16_t num2);
<<<<<<< HEAD
#line 1 "c:/users/pcx/documents/schwash/uapi_motor.h"
#line 1 "c:/users/pcx/documents/schwash/u_hardware.h"
#line 1 "c:/users/pcx/documents/schwash/u_platform.h"
#line 1 "c:/users/pcx/documents/schwash/uhal_timer2.h"
#line 1 "c:/users/pcx/documents/schwash/u_hardware_init.h"
#line 1 "c:/users/pcx/documents/schwash/u_platform.h"
#line 45 "c:/users/pcx/documents/schwash/u_hardware_init.h"
 inline void InitTimer1();
 inline void InitExternalInterrupt();
 inline void U_gpioInit();
#line 34 "c:/users/pcx/documents/schwash/uhal_timer2.h"
=======

void seg7PrintBlink(uint16_t num1, uint16_t num2, uintmax_t systempStick);
#line 1 "c:/project/schwash/uapi_motor.h"
#line 1 "c:/project/schwash/u_hardware.h"
#line 1 "c:/project/schwash/u_platform.h"
#line 1 "c:/project/schwash/uhal_timer2.h"
#line 1 "c:/project/schwash/u_hardware_init.h"
#line 1 "c:/project/schwash/u_platform.h"
#line 46 "c:/project/schwash/u_hardware_init.h"
 inline void InitTimer1();
 inline void InitExternalInterrupt();
 inline void U_gpioInit();
#line 34 "c:/project/schwash/uhal_timer2.h"
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1
typedef uint_fast8_t UHAL_TIMER2_REGITER_T;



static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
{
 const uint8_t bitMask = 0b11;
  (((T2CON)) = (((( ((T2CON)) ) & (~(bitMask))) | (uhal_parm << T2CKPS0)))) ;
}

static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
{
  (((T2CON)) = (((( ((T2CON)) ) & (~(0b1111 << TOUTPS0))) | (uhal_parm << TOUTPS0)))) ;
}

static inline void UHAL_TIMER2_updatePrValue(uint8_t val,UHAL_TIMER2_REGITER_T * buffer )
{
 *buffer = val;
}
static inline void UHAL_TIMER2_updateTimerValue(uint8_t val, UHAL_TIMER2_REGITER_T * buffer)
{
 *buffer = val;
}
static inline void UHAL_TIMER2_setPrValue(uint8_t val)
{
 PR2 = val;
}
static inline void UHAL_TIMER2_setTimerValue(uint8_t val)
{
 TMR2 = val;
}


void UHAL_timer2Init();
<<<<<<< HEAD
#line 1 "c:/users/pcx/documents/schwash/u_hardware_init.h"
#line 15 "c:/users/pcx/documents/schwash/uapi_motor.h"
=======
#line 1 "c:/project/schwash/u_hardware_init.h"
#line 15 "c:/project/schwash/uapi_motor.h"
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1
void UAPI_MOTOR_init();
void UAPI_MOTOR_deinit();
void UAPI_MOTOR_start();
void UAPI_MOTOR_stop();
void UAPI_MOTOR_setSpeed(uint_fast8_t speed, UHAL_TIMER2_REGITER_T * buffer);
<<<<<<< HEAD
#line 6 "C:/Users/pcx/Documents/SCHwash/schWash_Main.c"
intmax_t PF_systemTick;
=======
#line 6 "C:/Project/SCHwash/schWash_Main.c"
uintmax_t PF_systemTick;
uint8_t isBlink = 1;
uint8_t butonTemp;
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1

static uint_fast16_t ledNum1 = 0;
static uint_fast16_t ledNum2 = 0;
static void ledDisplayHandler();
static UHAL_TIMER2_REGITER_T timerPrBuffer = 0;

void delayHandler(uint32_t, void (*)(void));

void Interrupt()
{

 if (TMR1IF_bit)
 {
 TMR1IF_bit = 0;
 TMR1H = 0xFCU;
 TMR1L = 0x18U;
 PF_systemTick++;
 }

 if ( (!!((INTCON) & (1UL << (INTF)))) )
 {
  (( PORTB ) &= ~(1UL << ( RB1 ))) ;
  (( PORTE ) &= ~(1UL << ( RE0 ))) ;
  (( PORTA ) &= ~(1UL << ( RA3 ))) ;
 ledNum1++;
  ((T2CON) |= (1UL << (TMR2ON))) ;
<<<<<<< HEAD
 ledNum2++;
=======

>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1
  ((INTCON) &= ~(1UL << (INTF))) ;
 }
 if ( (!!((PIR1) & (1UL << (TMR2IF)))) )
 {
<<<<<<< HEAD
  (( PORTB ) &= ~(1UL << ( RB1 ))) ;
=======
  (( PORTB ) |= (1UL << ( RB1 ))) ;
  (( PORTE ) |= (1UL << ( RE0 )))  ;
  (( PORTA ) |= (1UL << ( RA3 ))) ;
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1
  PR2  = timerPrBuffer;
 ledNum1++;
  ((T2CON) &= ~(1UL << (TMR2ON))) ;
  ((PIR1) &= ~(1UL << (TMR2IF))) ;
 }
}

static uint16_t forMainIndex = 0;
<<<<<<< HEAD
static uint_fast8_t motorSpeed = 1;
=======
static uint_fast8_t motorSpeed = 240;

uint8_t UAPI_buttonHanlde()
{
 uint8_t buttonTemp =  ((( PORTD )>>( RD4 ))&((0b1111))) ;
 intmax_t time = PF_systemTick;
  while(!((PF_systemTick - time)>20)) 
 {
 ledDisplayHandler();
 }
 if(!(buttonTemp ==  ((( PORTD )>>( RD4 ))&((0b1111))) ))
 {
 buttonTemp = 0;
 }
 return buttonTemp;
}
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1

void main()
{

 U_gpioInit();
<<<<<<< HEAD

=======
 UAPI_MOTOR_init();
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1
 InitTimer1();

 while (1)
 {
<<<<<<< HEAD
 motorSpeed++;
 UAPI_MOTOR_setSpeed(motorSpeed, &timerPrBuffer);
=======
 butonTemp = UAPI_buttonHanlde();
 ledNum1 = butonTemp;
 ledNum2 = butonTemp;
 if(butonTemp == 2)
 {
 isBlink = ~isBlink;
 }
 ledDisplayHandler();
>>>>>>> cad830a256bdab067e84a1658c69229ee81defc1

 }
}

static void ledDisplayHandler()
{

 uintmax_t time = ((PF_systemTick) / 1000);
 if(isBlink)
 {
 if(time%2)
 {
  (( PORTC ) &= ~(1UL << ( RC4 ))) ;
  (( PORTC ) &= ~(1UL << ( RC5 ))) ;
  (( PORTC ) &= ~(1UL << ( RC6 ))) ;
 }else
 {
 seg7Print(ledNum1, ledNum2);
  (( PORTC ) |= (1UL << ( RC4 ))) ;
  (( PORTC ) |= (1UL << ( RC5 ))) ;
  (( PORTC ) |= (1UL << ( RC6 ))) ;
 }
 }else
 {
 seg7Print(ledNum1, ledNum2);
 }


}

void delayHandler(uint32_t time, void (*HandleF)(void))
{
 uintmax_t now = PF_systemTick;

 uint32_t totalDelay = now + time;
 while (PF_systemTick < totalDelay)
 {
 HandleF();
 }
}

void delayHandler(uint32_t time, void (*HandleF)(void))
{
 uint32_t now = PF_systemTick;
 uint32_t totalDelay = now + time;
 while (PF_systemTick < totalDelay)
 {
 HandleF();
 }
}
void buttonPolling()
{

}
