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
#line 35 "c:/project/schwash/u_platform.h"
intmax_t PF_millis(void);

typedef uint8_t PF_pin_type_t;
typedef uint8_t PF_port_type_t;
#line 45 "c:/project/schwash/u_hardware_init.h"
 inline void InitTimer1();
 inline void InitExternalInterrupt();
 inline void U_gpioInit();
#line 1 "c:/project/schwash/u_platform.h"
#line 9 "C:/Project/SCHwash/U_hardware_init.c"
inline void InitTimer1()
{
 T1CON = 0x01U;
 TMR1IF_bit = 0;
 TMR1H = 0xFCU;
 TMR1L = 0x18U;
 TMR1IE_bit = 1;
 INTCON = 0xC0U;
}

 inline void InitExternalInterrupt()
 {
  ((INTCON) |= (1UL << (GIE))) ;
  ((OPTION_REG) |= (1UL << (INTEDG))) ;
  ((INTCON) |= (1UL << (INTE))) ;
 }

 inline void U_gpioInit()
 {
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 TRISC = 0x00U;
 PORTC = 0x00U;
 TRISB1_bit = 0;
 }
