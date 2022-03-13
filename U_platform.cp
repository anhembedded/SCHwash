#line 1 "C:/Users/pcx/Documents/SCHwash/U_platform.c"
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
#line 33 "c:/users/pcx/documents/schwash/u_platform.h"
intmax_t PF_millis(void);

typedef uint8_t PF_pin_type_t;
typedef uint8_t PF_port_type_t;

extern intmax_t PF_systemTick;



void delayHandler(uint32_t time, void (*HandleF)(void));
#line 7 "C:/Users/pcx/Documents/SCHwash/U_platform.c"
intmax_t PF_systemTick = 0;

void delayHandler(uint32_t time, void (*HandleF)(void))
{
 uint32_t now = PF_systemTick;
 uint32_t totalDelay = now + time;
 while (PF_systemTick < totalDelay)
 {
 HandleF();
 }
}
