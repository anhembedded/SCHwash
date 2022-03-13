#line 1 "C:/Users/pcx/Documents/SCHwash/UHAL_timer2.c"
#line 1 "c:/users/pcx/documents/schwash/uhal_timer2.h"
#line 1 "c:/users/pcx/documents/schwash/u_hardware_init.h"
#line 1 "c:/users/pcx/documents/schwash/u_platform.h"
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
#line 34 "c:/users/pcx/documents/schwash/u_platform.h"
typedef uint8_t pin_type_t;
typedef uint8_t port_type_t;

extern intmax_t U_systemTick;

void delayHandler(uint32_t time, void (*HandleF)(void));
#line 43 "c:/users/pcx/documents/schwash/u_hardware_init.h"
 inline void InitTimer1();

 inline void InitExternalInterrupt();
 inline void U_gpioInit();
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
#line 3 "C:/Users/pcx/Documents/SCHwash/UHAL_timer2.c"
void UHAL_timer2Init()
{
 UHAL_TIMER2_setPrescaler( 0b11 );
  PR2  = 1;
 TMR2IF_bit = 0;
  ((INTCON) |= (1UL << (GIE))) ;
  ((INTCON) &= ~(1UL << (PEIE))) ;
  ((PIE1) |= (1UL << (TMR2IE))) ;

}
