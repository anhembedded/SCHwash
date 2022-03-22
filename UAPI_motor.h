#ifndef __UAPI_MOTOR_H__
#define __UAPI_MOTOR_H__

#include "U_hardware.h"
#include "U_platform.h"
#include "UHAL_timer2.h"
#include "U_hardware_init.h"

#define UAPI_MOTOR_MAX_SPEED 220
#define UAPI_MOTOR_MIN_SPEED   1

#define UAPI_PWM_ACTIVE()     BIT_SET(U_PWM_PGx_ZERO_PORT, U_PWM_PIN)
#define UAPI_PWM_DEACTIVE()    BIT_CLEAR(U_PWM_PGx_ZERO_PORT, U_PWM_PIN)

void UAPI_MOTOR_init();
void UAPI_MOTOR_deinit();
void UAPI_MOTOR_start();
void UAPI_MOTOR_stop();
void UAPI_MOTOR_setSpeed(uint_fast8_t speed, UHAL_TIMER2_REGITER_T * buffer);



#endif // __UAPI_MOTOR_H__