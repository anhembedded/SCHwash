#line 1 "C:/Users/pcx/Documents/SCHwash/schWash_Main.c"
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
#line 1 "c:/users/pcx/documents/schwash/u_platform.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 34 "c:/users/pcx/documents/schwash/u_platform.h"
typedef uint8_t pin_type_t;
typedef uint8_t port_type_t;

extern intmax_t U_systemTick;

void delayHandler(uint32_t time, void (*HandleF)(void));
#line 1 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 1 "c:/users/pcx/documents/schwash/u_platform.h"
#line 58 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
static uint8_t reverseByte(uint8_t agr);
#line 63 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
static void clockGenerating();
#line 68 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
static void latchGenerating();
#line 75 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
void seg7Write(uint8_t seg1, uint8_t seg2);
#line 86 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
void seg7WriteNum(uint8_t num1, uint8_t num2);
#line 95 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
void seg7Print(uint16_t num1, uint16_t num2);
#line 1 "c:/users/pcx/documents/schwash/u_hardware.h"
#line 1 "c:/users/pcx/documents/schwash/u_hardware_init.h"
#line 1 "c:/users/pcx/documents/schwash/u_platform.h"
#line 43 "c:/users/pcx/documents/schwash/u_hardware_init.h"
 inline void InitTimer1();

 inline void InitExternalInterrupt();
 inline void U_gpioInit();
#line 1 "c:/users/pcx/documents/schwash/uhal_timer2.h"
#line 1 "c:/users/pcx/documents/schwash/u_hardware_init.h"
#line 17 "c:/users/pcx/documents/schwash/uhal_timer2.h"
static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
{
 auto var = 98;

 T2CON |= (uhal_parm << T2CKPS0);
}

static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
{
 T2CON |= (uhal_parm << TOUTPS0);
}

static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
{
 PR2 = val;
}
static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
{
 TMR2 = val;
}

static inline UHAL_TIMER2_setTimeForMatchEvent()
{

}

void UHAL_timer2Init();
#line 10 "C:/Users/pcx/Documents/SCHwash/schWash_Main.c"
static uint32_t u_systemTick = 0;
static uint_fast16_t ledNum1 = 0;
static uint_fast16_t ledNum2 = 0;

static void ledDisplayHandler();

void Interrupt()
{

 if (TMR1IF_bit)
 {
 TMR1IF_bit = 0;
 TMR1H = 0xFCU;
 TMR1L = 0x18U;
 U_systemTick++;
 }


 if( (!!((INTCON) & (1UL << (INTF)))) )
 {
  (( PORTB ) |= (1UL << ( RB1 ))) ;
  ((T2CON) |= (1UL << (TMR2ON))) ;
 ledNum2 ++;
  ((INTCON) &= ~(1UL << (INTF))) ;
 }
 if( (!!((PIR1) & (1UL << (TMR2IF)))) )
 {
  (( PORTB ) &= ~(1UL << ( RB1 ))) ;
 ledNum1++;
  ((T2CON) &= ~(1UL << (TMR2ON))) ;
  ((PIR1) &= ~(1UL << (TMR2IF))) ;
 }
}
 void InitTimer2(){
 T2CON = 0x45;
 PR2 = 231;
 TMR2IE_bit = 1;
 INTCON = 0xC0;

}

static uint16_t forMainIndex = 0;

void main()
{
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 TRISC = 0x00U;
 PORTC = 0x00U;
 TRISB1_bit = 0;

 InitTimer2();
 InitTimer1();
 InitExternalInterrupt();
 while (1)
 {
 seg7Print(ledNum1, ledNum2);
 }
}




static void ledDisplayHandler()
{
 seg7Print(ledNum1, ledNum2);
}
