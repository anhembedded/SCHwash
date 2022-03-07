//
// Created by hoang on 2/21/2022.
//

#ifndef UNTITLED5_U_PLATFORM_H
#define UNTITLED5_U_PLATFORM_H

#include "stdint.h"

// include is platform

#define U_delay_us(a) Delay_us(a)
#define U_delay_ms(a) Delay_ms(a)

typedef uint8_t pin_type_t;
typedef uint8_t port_type_t;

extern const pin_type_t U_PWM_PIN;
extern intmax_t U_systemTick;

#endif // UNTITLED5_U_PLATFORM_H
