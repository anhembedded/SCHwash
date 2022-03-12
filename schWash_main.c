
#include <stdint.h>
#include "U_platform.h"
#include "UHAL_74HC595.h"
#include "U_Hardware.h"
#include "U_hardware_init.h"
#include "UHAL_timer2.h"


static uint32_t u_systemTick = 0;
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
           BIT_SET(U_PWM_PGx_ZERO_PORT, U_PWM_PIN);
           UHAL_TIMER2_ON();
           ledNum2 ++;
           U_CLEAR_EXTERNAL_INTERRUPT();
     }
     if(UHAL_TIMER2_IS_SET_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG())
     {
          BIT_CLEAR(U_PWM_PGx_ZERO_PORT, U_PWM_PIN);
         ledNum1++;
         UHAL_TIMER2_OFF();
         UHAL_TIMER2_CLEAR_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG();
     }
}
  void InitTimer2(){
   T2CON	 = 0x1C;
  PR2		 = 249;
  TMR2IE_bit	 = 1;
  INTCON	 = 0xC0;

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
     TRISB1_bit = 0;
     
     
      InitTimer2();
     //UHAL_timer2Init();
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