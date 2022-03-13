#line 1 "C:/Users/pcx/Documents/SCHwash/UHAL_74HC595.c"
#line 1 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
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
#line 1 "c:/users/pcx/documents/schwash/u_platform.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 33 "c:/users/pcx/documents/schwash/u_platform.h"
intmax_t PF_millis(void);

typedef uint8_t PF_pin_type_t;
typedef uint8_t PF_port_type_t;
extern intmax_t PF_systemTick;

void delayHandler(uint32_t time, void (*HandleF)(void));
#line 58 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
static uint8_t reverseByte(uint8_t agr);
#line 63 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
static void clockGenerating();
#line 68 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
static void latchGenerating();
#line 75 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
void seg7Write(uint8_t seg1, uint8_t seg2);
#line 86 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
void seg7WriteNum(uint8_t num1, uint8_t num2);
#line 95 "c:/users/pcx/documents/schwash/uhal_74hc595.h"
void seg7Print(uint16_t num1, uint16_t num2);
#line 3 "C:/Users/pcx/Documents/SCHwash/UHAL_74HC595.c"
uint8_t seg7DeCode[] = {0xC0, 0xF9U, 0xA4U, 0xB0U, 0x99U, 0x92U, 0x82U, 0xF8U, 0x80U, 0x90U};



static uint8_t reverseByte(uint8_t agr)
{
 uint8_t b = agr;
 return b = ((b * 0x0802LU & 0x22110LU) | (b * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
}
static void clockGenerating()
{
  (( PORTC ) |= (1UL << ( RC2 ))) ;
  Delay_us( 1 ) ;
  (( PORTC ) &= ~(1UL << ( RC2 ))) ;
  Delay_us( 1 ) ;
}
static void latchGenerating()
{
  (( PORTC ) |= (1UL << ( RC3 ))) ;
  Delay_us( 1 ) ;
  (( PORTC ) &= ~(1UL << ( RC3 ))) ;
  Delay_us( 1 ) ;
}
static void seg7Write(uint8_t seg1, uint8_t seg2)
{
 uint_fast8_t for_index = 0;
 uint16_t temp = 0;
 seg1 = reverseByte(seg1);
 seg2 = reverseByte(seg2);
 temp = seg1;
 temp = temp << 8;
 temp |= seg2;
 for (for_index = 0; for_index <= 15; for_index++)
 {
 if ( (!!((temp) & (1UL << (for_index)))) )
 {
  (( PORTC ) |= (1UL << ( RC1 ))) ;
 }
 else
 {
  (( PORTC ) &= ~(1UL << ( RC1 ))) ;
 }
 clockGenerating();
 }
 latchGenerating();
}

void seg7WriteNum(uint8_t num1, uint8_t num2)
{
 seg7Write(seg7DeCode[num1], seg7DeCode[num2]);
}
void seg7Print(uint16_t num1, uint16_t num2)
{
 uint8_t digitSeg_1[3];
 uint8_t digitSeg_2[3];

 digitSeg_1[0] = num1 % 10;
 num1 = num1 / 10;
 digitSeg_1[1] = num1 % 10;
 num1 = num1 / 10;
 digitSeg_1[2] = num1 % 10;

 digitSeg_2[0] = num2 % 10;
 num2 = num2 / 10;
 digitSeg_2[1] = num2 % 10;
 num2 = num2 / 10;
 digitSeg_2[2] = num2 % 10;

 seg7WriteNum(digitSeg_1[2], digitSeg_2[2]);
  (( PORTC ) |= (1UL << ( RC4 ))) ;
  Delay_ms( 1 ) ;
  (( PORTC ) &= ~(1UL << ( RC4 ))) ;
 seg7WriteNum(digitSeg_1[1], digitSeg_2[1]);
  (( PORTC ) |= (1UL << ( RC5 ))) ;
  Delay_ms( 1 ) ;
  (( PORTC ) &= ~(1UL << ( RC5 ))) ;
 seg7WriteNum(digitSeg_1[0], digitSeg_2[0]);
  (( PORTC ) |= (1UL << ( RC6 ))) ;
  Delay_ms( 1 ) ;
  (( PORTC ) &= ~(1UL << ( RC6 ))) ;
}
