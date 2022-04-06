#include "UAPI_motor.h"

void UAPI_MOTOR_init()
{

    UHAL_timer2Init();
    InitExternalInterrupt();
    UAPI_MOTOR_stop();
}

void UAPI_MOTOR_start()
{
     TRISA3_bit = 0;
}
void UAPI_MOTOR_stop()
{

    TRISA3_bit = 1;

}
void UAPI_MOTOR_setSpeed(uint_fast8_t speed, UHAL_TIMER2_REGITER_T * buffer)
{
    speed = CONSTRAIN(speed, UAPI_MOTOR_MIN_SPEED, UAPI_MOTOR_MAX_SPEED);
    UHAL_TIMER2_updatePrValue(speed,buffer);
}