
#include <stdint.h>
//#include "U_Hardware.h"
#include "U_platform.h"
#include "UHAL_74HC595.h"
#include "U_Hardware.h"
#include "U_hardware_init.h"
#include "UHAL_pwm.h"

static uint32_t u_systemTick = 0;
static  uint_fast16_t ledNum1 = 0;
static  uint_fast16_t ledNum2 = 111;

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

  if (TMR2IF_bit){
    TMR2IF_bit = 0;
    // 100Hz

         //todo:
         //active PWM
  }

     // RB0 external EXT
     if(U_IS_SET_EXTERNAL_INTERRUPT())
     {

         U_CLEAR_EXTERNAL_INTERRUPT();

     }
}


static uint16_t forMainIndex = 0;

void main()
{
     ANSEL = 0; // Configure AN pins as digital
     ANSELH = 0;
     C1ON_bit = 0; // Disable comparators
     C2ON_bit = 0;

     TRISC = 0x00U;
     PORTC = 0x00U;

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