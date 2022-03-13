/**
 * @file UHAL_74HC595.h
 * Created on Wed Feb 16 2022
 *
 * Copyright (c) 2022 INT, Intitution of nanotechnology
 * This file is file header of 74HC595 hardware abstract layer and application layer
 * Developed for hardware: 74HC595 bit shift IC be attached with Seg7 led display on the project ...
 *
 * Developed on mikroC PRO for PIC toolchain.
 * author HoangAnh Tran
 * Contact: [zalo]: 0965062996
 */

#ifndef __UHAL_74HC595_H__
#define __UHAL_74HC595_H__
#include <stdint.h>
#include "U_platform.h"

#define _SEG_DELAY_TIME 1           // ms
#define _74HC595_CLOCK_DELAY_TIME 1 //  us

/* BitShift IC pinout */
#define CLOCK RC2
#define LATCH RC3
#define SERIAL_DATA_IN_1 RC1
#define SERIAL_DATA_IN SERIAL_DATA_IN_1
#define SERIAL_DATA_IN_2 SERIAL_DATA_IN_1
#define BIT_SHIFT_REG PORTC

/* 74HC595 pinout */
#define SHCP CLOCK
#define STCP LATCH
#define DS_1 SERIAL_DATA_IN_1
#define DS_2 SERIAL_DATA_IN_2
/* SEG7 pinout */
#define DIGIT_1 RC4
#define DIGIT_2 RC5
#define DIGIT_3 RC6
#define LED_1_PIN DIGIT_1
#define LED_2_PIN DIGIT_2
#define LED_3_PIN DIGIT_3
/* SEG7 macro */
#define LED_1_ON() BIT_SET(BIT_SHIFT_REG, LED_1_PIN)
#define LED_2_ON() BIT_SET(BIT_SHIFT_REG, LED_2_PIN)
#define LED_3_ON() BIT_SET(BIT_SHIFT_REG, LED_3_PIN)
#define LED_1_OFF() BIT_CLEAR(BIT_SHIFT_REG, LED_1_PIN)
#define LED_2_OFF() BIT_CLEAR(BIT_SHIFT_REG, LED_2_PIN)
#define LED_3_OFF() BIT_CLEAR(BIT_SHIFT_REG, LED_3_PIN)

/* FIRMWARE LAYER */
/**
 * @brief Reservsing a whole bit of byte
 *
 * @param agr byte that want to reserve
 * @return uint8_t byte have been reserved
 * @example 0b1110 0000  -> 0b0000 0111
 */
static uint8_t reverseByte(uint8_t agr);
/**
 * @brief generating 1 pulse of clock source for 75HC595 IC
 *
 */
static void clockGenerating();
/**
 * @brief generating 1 pulse of latch source for 75HC595 IC
 *
 */
static void latchGenerating();
/**
 * @brief Writing 8 bit to Seg 7 led display
 *
 * @param seg1  8 bit for Seg7 1
 * @param seg2  8 bit for Seg7 2
 */
void seg7Write(uint8_t seg1, uint8_t seg2);

/* APPLICATION LAYER */
/**
 * @brief Seg7 led display number
 *
 * @param num1 number for Seg7 led 1
 * @param num2 number for Seg7 led 2
 * @note the number in this funtion in range 0 to 9, and just affect to one digit of each Seg7 led display
 * @note this function do not make the Seg7 led display "light on".
 */
void seg7WriteNum(uint8_t num1, uint8_t num2);
/**
 * @brief Seg7 led display number
 *
 * @param num1 number for Seg7 led 1
 * @param num2 number for Seg7 led 2
 * @note the number in this funtion in range 0 to 999, and shifting to all digit of each  Seg7 led display
 * @note that function will make the Seg7 led display "light on".
 */
void seg7Print(uint16_t num1, uint16_t num2);

#endif // __UHAL_74HC595_H__