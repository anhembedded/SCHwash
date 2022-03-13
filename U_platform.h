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
#define CLEAR_REG(REG) ((REG) = (0x0))
#define WRITE_REG(REG, VAL) ((REG) = (VAL))
#define READ_REG(REG) ((REG))
#define MODIFY_REG(REG, CLEARMASK, SETMASK) WRITE_REG((REG), (((READ_REG(REG)) & (~(CLEARMASK))) | (SETMASK)))
#define LOWBYTE(w) ((uint8_t) ((w) & 0xff))
#define HIGHBYTE(w) ((uint8_t) ((w) >> 8))

// include is platform

#define PF_delay_us(a) Delay_us(a)
#define PF_delay_ms(a) Delay_ms(a)
#define PF_delay_Cyc(a) Delay_Cyc(a)
#define PF_NOP         // do nothing

intmax_t PF_millis(void);

typedef uint8_t PF_pin_type_t;
typedef uint8_t PF_port_type_t;
extern intmax_t PF_systemTick;

void delayHandler(uint32_t time, void (*HandleF)(void));

#endif // UNTITLED5_U_PLATFORM_H