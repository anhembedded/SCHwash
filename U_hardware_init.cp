#line 1 "C:/Project/SCHwash/U_hardware_init.c"
#line 1 "c:/project/schwash/u_hardware_init.h"
#line 1 "c:/project/schwash/u_platform.h"
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
#line 21 "c:/project/schwash/u_platform.h"
typedef uint8_t pin_type_t;
typedef uint8_t port_type_t;

extern const pin_type_t U_PWM_PIN;
extern intmax_t U_systemTick;

void delayHandler(uint32_t time, void (*HandleF)(void));
#line 43 "c:/project/schwash/u_hardware_init.h"
 inline void InitTimer1();
 inline void InitTimer2();
 inline void InitExternalInterrupt();
 inline void U_gpioInit();
#line 1 "c:/project/schwash/u_platform.h"
#line 21 "C:/Project/SCHwash/U_hardware_init.c"
static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
{
 T2CON |= (uhal_parm << T2CKPS0);
}

static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
{
 PR2 = val;
}
static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
{
 TMR2 = val;
}



inline void InitTimer1()
{
 T1CON = 0x01U;
 TMR1IF_bit = 0;
 TMR1H = 0xFCU;
 TMR1L = 0x18U;
 TMR1IE_bit = 1;
 INTCON = 0xC0U;
}

inline void InitTimer2(){
 T2CON = 0x4D;
 PR2 = 250;
 TMR2IE_bit = 1;
 INTCON = 0xC0;
}
 inline void InitExternalInterrupt()
 {
  ((INTCON) |= (1UL << (GIE))) ;
  ((OPTION_REG) &= ~(1UL << (INTEDG))) ;
  ((INTCON) |= (1UL << (INTE))) ;
 }
