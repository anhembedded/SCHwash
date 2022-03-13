#include <stdint.h>
#include "U_platform.h"
#include "UHAL_74HC595.h"
#include "U_Hardware.h"
#include "U_hardware_init.h"
#include "UHAL_timer2.h"

#define UHAL_PWM_ACTIVE()     BIT_SET(U_PWM_PGx_ZERO_PORT, U_PWM_PIN)
#define UHAL_PWM_DEACTIVE()    BIT_CLEAR(U_PWM_PGx_ZERO_PORT, U_PWM_PIN)

static uint32_t U_systemTick = 0;
static  uint_fast16_t ledNum1 = 0;
static  uint_fast16_t ledNum2 = 0;
static void ledDisplayHandler();

void Interrupt()
{
 // TIMER1 for system stick
     if (TMR1IF_bit)
     {
          TMR1IF_bit = 0;
          TMR1H = 0xFCU;
          TMR1L = 0x18U;
          U_systemTick++;
     }
     // RB0 external EXT
     if(U_IS_SET_EXTERNAL_INTERRUPT())
     {
           UHAL_PWM_ACTIVE();
           UHAL_TIMER2_ON();
           ledNum2 ++;
           U_CLEAR_EXTERNAL_INTERRUPT();
     }
     if(UHAL_TIMER2_IS_ISR_FLAG_SET())
     {
         UHAL_PWM_DEACTIVE();
         ledNum1++;
         UHAL_TIMER2_OFF();
         UHAL_TIMER2_CLEAR_ISR_FLAG();
     }
}
static uint16_t forMainIndex = 0;

void main()
{

   U_gpioInit();
   UHAL_timer2Init();
     InitTimer1();
     InitExternalInterrupt();
     while (1)
     {
        seg7Print(ledNum1, ledNum2);
     }
}

static void ledDisplayHandler()
{
     seg7Print(ledNum1, ledNum2);
}