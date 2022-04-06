#ifndef __SCHWASH_MAIN_H__
#define __SCHWASH_MAIN_H__

#include <stdint.h>
#include "U_platform.h"
#include "UHAL_74HC595.h"
#include "UAPI_motor.h"
#include "UAPI_button.h"

extern uintmax_t PF_systemTick;

void ledDisplayHandler();

void delayHandler(uint32_t time, void (*HandleF)(void));

#endif // __SCHWASH_MAIN_H__