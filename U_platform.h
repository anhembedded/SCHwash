//
// Created by hoang on 2/21/2022.
//

#ifndef UNTITLED5_U_PLATFORM_H
#define UNTITLED5_U_PLATFORM_H

#include "stdint.h"

/* BASIC BITWISE MACRO */
#define BIT_SET(a, b) ((a) |= (1UL << (b)))
#define BIT_CLEAR(a, b) ((a) &= ~(1UL << (b)))
#define BIT_TOGGLE(a, b) ((a) ^= (1UL << (b)))
#define BIT_READ(a, b) (!!((a) & (1UL << (b)))) // '!!' to make sure this returns 0 or 1

#define SET_BIT(a, b) ((a) |= (1UL << (b)))
#define CLEAR_BIT(a, b) ((a) &= ~(1UL << (b)))
#define TOGGLE_BIT(a, b) ((a) ^= (1UL << (b)))
#define READ_BIT(a, b) (!!((a) & (1UL << (b)))) // '!!' to make sure this returns 0 or 1

// include is platform

#define U_delay_us(a) Delay_us(a)
#define U_delay_ms(a) Delay_ms(a)

typedef uint8_t pin_type_t;
typedef uint8_t port_type_t;


extern intmax_t U_systemTick;

void delayHandler(uint32_t time, void (*HandleF)(void));




#endif // UNTITLED5_U_PLATFORM_H