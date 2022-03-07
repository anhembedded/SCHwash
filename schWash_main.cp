#line 1 "C:/Project/SCHwash/schWash_main.c"
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
#line 1 "c:/project/schwash/uhal_74hc595.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 1 "c:/project/schwash/u_platform.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 15 "c:/project/schwash/u_platform.h"
typedef uint8_t pin_type_t;
typedef uint8_t port_type_t;

extern const pin_type_t U_PWM_PIN;
extern intmax_t U_systemTick;
#line 65 "c:/project/schwash/uhal_74hc595.h"
static uint8_t reverseByte(uint8_t agr);
#line 70 "c:/project/schwash/uhal_74hc595.h"
static void clockGenerating();
#line 75 "c:/project/schwash/uhal_74hc595.h"
static void latchGenerating();
#line 82 "c:/project/schwash/uhal_74hc595.h"
void seg7Write(uint8_t seg1, uint8_t seg2);
#line 93 "c:/project/schwash/uhal_74hc595.h"
void seg7WriteNum(uint8_t num1, uint8_t num2);
#line 102 "c:/project/schwash/uhal_74hc595.h"
void seg7Print(uint16_t num1, uint16_t num2);
#line 1 "c:/project/schwash/u_hardware.h"
#line 1 "c:/project/schwash/u_hardware_init.h"
#line 1 "c:/project/schwash/u_platform.h"
#line 11 "c:/project/schwash/u_hardware_init.h"
 inline void InitTimer1();
 inline void U_gpioInit();
#line 1 "c:/project/schwash/uhal_pwm.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"
#line 1 "c:/project/schwash/u_hardware.h"
#line 13 "c:/project/schwash/uhal_pwm.h"
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
#line 9 "C:/Project/SCHwash/schWash_main.c"
static uint32_t u_systemTick = 0;
static uint16_t ledNum1 = 242;
static uint16_t ledNum2 = 356;

static void delayHandler(uint32_t time, void (*HandleF)(void));
static void ledDisplayHandler();

void Interrupt()
{
 if (TMR1IF_bit)
 {
 TMR1IF_bit = 0;
 TMR1H = 0xFCU;
 TMR1L = 0x18U;
 U_systemTick++;
 }
}

static uint16_t forMainIndex = 0;

void main()
{
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 TRISC = 0x00U;
 PORTC = 0x00U;

 InitTimer1();
 while (1)
 {

 for (forMainIndex = 0; forMainIndex < 999; forMainIndex++)
 {
 ledNum1++;
 ledNum2++;
 delayHandler(200, ledDisplayHandler);
 }
 }
}

static void delayHandler(uint32_t time, void (*HandleF)(void))
{
 uint32_t now = u_systemTick;
 uint32_t totalDelay = now + time;
 while (u_systemTick < totalDelay)
 {
 HandleF();
 }
}


static void ledDisplayHandler()
{
 seg7Print(ledNum1, ledNum2);
}
