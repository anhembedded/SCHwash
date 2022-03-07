// This comment for cheacking the GitHub, capability.
#include <stdint.h>
//#include "U_Hardware.h"
#include "UHAL_74HC595.h"
#include "U_Hardware.h"
#include "U_hardware_init.h"
#include "UHAL_pwm.h"

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
     ANSEL = 0; // Configure AN pins as digital
     ANSELH = 0;
     C1ON_bit = 0; // Disable comparators
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