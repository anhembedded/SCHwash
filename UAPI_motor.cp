#line 1 "C:/Project/SCHwash/UAPI_motor.c"
#line 1 "c:/project/schwash/uapi_motor.h"
#line 1 "c:/project/schwash/u_hardware.h"
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
#line 36 "c:/project/schwash/u_platform.h"
intmax_t PF_millis(void);

typedef uint8_t PF_pin_type_t;
typedef uint8_t PF_port_type_t;
#line 1 "c:/project/schwash/uhal_timer2.h"
#line 1 "c:/project/schwash/u_hardware_init.h"
#line 1 "c:/project/schwash/u_platform.h"
#line 46 "c:/project/schwash/u_hardware_init.h"
 inline void InitTimer1();
 inline void InitExternalInterrupt();
 inline void U_gpioInit();
#line 34 "c:/project/schwash/uhal_timer2.h"
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
#line 1 "c:/project/schwash/u_hardware_init.h"
#line 15 "c:/project/schwash/uapi_motor.h"
void UAPI_MOTOR_init();
void UAPI_MOTOR_deinit();
void UAPI_MOTOR_start();
void UAPI_MOTOR_stop();
void UAPI_MOTOR_setSpeed(uint_fast8_t speed, UHAL_TIMER2_REGITER_T * buffer);
#line 3 "C:/Project/SCHwash/UAPI_motor.c"
void UAPI_MOTOR_init()
{
 UAPI_MOTOR_stop();
 UHAL_timer2Init();
 InitExternalInterrupt();
}

void UAPI_MOTOR_start()
{
 TRISA3_bit = 1;
}
void UAPI_MOTOR_stop()
{

 TRISA3_bit = 0;

}
void UAPI_MOTOR_setSpeed(uint_fast8_t speed, UHAL_TIMER2_REGITER_T * buffer)
{
 speed =  ((speed)<( 1 )?( 1 ):((speed)>( 220 )?( 220 ):(speed))) ;
 UHAL_TIMER2_updatePrValue(speed,buffer);
}
