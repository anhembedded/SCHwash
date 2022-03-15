#include <stdint.h>
#include "U_platform.h"
#include "UHAL_74HC595.h"
#include "UAPI_motor.h"

intmax_t PF_systemTick;

static uint_fast16_t ledNum1 = 0;
static uint_fast16_t ledNum2 = 0;
static void ledDisplayHandler();
static UHAL_TIMER2_REGITER_T timerPrBuffer = 0;

void delayHandler(uint32_t, void (*)(void));

void Interrupt()
{
     // TIMER1 for system stick
     if (TMR1IF_bit)
     {
          TMR1IF_bit = 0;
          TMR1H = 0xFCU;
          TMR1L = 0x18U;
          PF_systemTick++;
     }
     // RB0 external EXT
     if (U_IS_SET_EXTERNAL_INTERRUPT())
     {
          UAPI_PWM_ACTIVE();
          UHAL_TIMER2_ON();
          ledNum2++;
          U_CLEAR_EXTERNAL_INTERRUPT();
     }
     if (UHAL_TIMER2_IS_ISR_FLAG_SET())
     {
          UAPI_PWM_DEACTIVE();
          U_TIMER2_COMPARE_REG = timerPrBuffer;
          ledNum1++;
          UHAL_TIMER2_OFF();
          UHAL_TIMER2_CLEAR_ISR_FLAG();
     }
}

static uint16_t forMainIndex = 0;
static uint_fast8_t motorSpeed = 1;

void main()
{

     U_gpioInit();
     UAPI_MOTOR_init();
     InitTimer1();

     while (1)
     {
           motorSpeed++;
          UAPI_MOTOR_setSpeed(motorSpeed, &timerPrBuffer);
         PF_delay_ms(50);
     }
}

static void ledDisplayHandler()
{
     seg7Print(ledNum1, ledNum2);
}

void delayHandler(uint32_t time, void (*HandleF)(void))
{
     uint32_t now = PF_systemTick;
     uint32_t totalDelay = now + time;
     while (PF_systemTick < totalDelay)
     {
          HandleF();
     }
}
void buttonPolling()
{
     
}