#include "UHAL_pwm.h"


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
    // todo: Implement this fuction.
}