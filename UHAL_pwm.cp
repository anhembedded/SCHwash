#line 1 "C:/Project/SCHwash/UHAL_pwm.c"
#line 1 "c:/project/schwash/uhal_pwm.h"
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
#line 1 "c:/project/schwash/u_hardware.h"
#line 13 "c:/project/schwash/uhal_pwm.h"
void UHAL_pwmInit();
void UHAL_pwmSetFequence(const uint8_t pin, const uint16_t fequ);
void UHAL_pwmStart(const uint8_t pin);
void UHAL_pwmSetDutyCycle(const uint8_t pin, const uint8_t dutyC);
void UHAL_pwmStop(const uint8_t pin);
void UHAL_pwmDeInit();

static inline UHAL_TIMER2_ON()
{
 TMR2ON_bit = 1;
}
static inline UHAL_TIMER2_OFF()
{
 TMR2ON_bit = 0;
}
static inline UHAL_TIMER2_SET_PRESCALER(const uint8_t value)
{

}
static inline UHAL_TIMER2_periodRegister(const uint8_t value)
{

}
#line 4 "C:/Project/SCHwash/UHAL_pwm.c"
void UHAL_pwmInit()
{
 PWM1_Init(5000);
}
void UHAL_pwmSetFequence(uint8_t pin, const uint16_t fequ)
{
 PWM1_Init(5000);
}
void UHAL_pwmStart(const uint8_t pin)
{
 PWM1_Start();
}
void UHAL_pwmSetDutyCycle(const uint8_t pin, const uint8_t dutyC)
{
 PWM1_Set_Duty(dutyC);
}
void UHAL_pwmStop(const uint8_t pin)
{
 PWM1_Stop();
}
void UHAL_pwmDeInit()
{

}
