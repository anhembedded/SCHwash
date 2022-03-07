#ifndef __UHAL_PWM_H__
#define __UHAL_PWM_H__



#include <stdint.h>
#include "U_Hardware.h"

#define UHAL_TIMER2_SET_PRESALER_1  00U
#define UHAL_TIMER2_SET_PRESALER_4 01U
#define UHAL_TIMER2_SET_PRESALER_16  11U

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


#endif // __UHAL_PWM_H__