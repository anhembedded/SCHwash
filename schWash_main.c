
#include "schWash_Main.h"

uintmax_t PF_systemTick;
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
          CLEAR_BIT(U_VAN_PORT, U_VAN_PIN);
          UHAL_TIMER2_ON();
          U_CLEAR_EXTERNAL_INTERRUPT();
     }
     if (UHAL_TIMER2_IS_ISR_FLAG_SET())
     {
          SET_BIT(U_VAN_PORT, U_VAN_PIN);
          U_TIMER2_COMPARE_REG = timerPrBuffer;
          UHAL_TIMER2_OFF();
          UHAL_TIMER2_CLEAR_ISR_FLAG();
     }
}




void main()
{

     U_gpioInit();
     UAPI_MOTOR_init();
     InitTimer1();

     while (1)
     {
     if(UAPI_buttonHanlde() == UAPI_NUT1_IS_PRESSED)
     {
           ledNum1 = 1;
           UAPI_MOTOR_start();
     }
     if(UAPI_buttonHanlde() == UAPI_NUT2_IS_PRESSED)
     {
           ledNum1 = 2;
           UAPI_MOTOR_stop();
     }
     if(UAPI_buttonHanlde() == UAPI_NUT3_IS_PRESSED)
     {
           ledNum1 = 3;
     }
     if(UAPI_buttonHanlde() == UAPI_NUT4_IS_PRESSED)
     {
           ledNum1 = 4;
     }
       UAPI_MOTOR_setSpeed(123, &timerPrBuffer);
     }
}



void ledDisplayHandler()
{
     seg7Print(ledNum1, ledNum2);
}

void delayHandler(uint32_t time, void (*HandleF)(void))
{
     uintmax_t now = PF_systemTick;

     uint32_t totalDelay = now + time;
     while (PF_systemTick < totalDelay)
     {
          HandleF();
     }
}