#include <stdint.h>
#include "U_platform.h"
#include "UHAL_74HC595.h"
#include "UAPI_motor.h"

uintmax_t PF_systemTick;
uint8_t isBlink = 1;
uint8_t butonTemp;

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
               UAPI_PWM_DEACTIVE();
          CLEAR_BIT(U_RELAY_MCLR_PORT, U_RELAY_PIN);
          CLEAR_BIT(U_VAN_PORT, U_VAN_PIN);
             ledNum1++;
          UHAL_TIMER2_ON();

          U_CLEAR_EXTERNAL_INTERRUPT();
     }
     if (UHAL_TIMER2_IS_ISR_FLAG_SET())
     {
          UAPI_PWM_ACTIVE();
          SET_BIT(U_RELAY_MCLR_PORT, U_RELAY_PIN) ;
          SET_BIT(U_VAN_PORT, U_VAN_PIN);
           U_TIMER2_COMPARE_REG = timerPrBuffer;
          ledNum1++;
          UHAL_TIMER2_OFF();
          UHAL_TIMER2_CLEAR_ISR_FLAG();
     }
}

static uint16_t forMainIndex = 0;
static uint_fast8_t motorSpeed = 240;

uint8_t UAPI_buttonHanlde()
{
  uint8_t buttonTemp = READ_BIT_MASK(U_NUT_POTR, U_NUT_1_PIN, 0b1111);
  intmax_t time = PF_systemTick;
  WAIT_UNTIL((PF_systemTick - time)>20)
  {
       ledDisplayHandler();
  }
  if(!(buttonTemp == READ_BIT_MASK(U_NUT_POTR, U_NUT_1_PIN, 0b1111)))
  {
     buttonTemp = 0;
  }
  return  buttonTemp;
}

void main()
{

     U_gpioInit();
     UAPI_MOTOR_init();
     InitTimer1();

     while (1)
     {
      butonTemp = UAPI_buttonHanlde();
      ledNum1 =  butonTemp;
       ledNum2 = butonTemp;
      if(butonTemp == 2)
      {
        isBlink = ~isBlink;
      }
      ledDisplayHandler();
      
     }
}

static void ledDisplayHandler()
{

         uintmax_t time =  ((PF_systemTick)  / 1000);
         if(isBlink)
         {
           if(time%2)
       {
         LED_1_OFF();
         LED_2_OFF();
         LED_3_OFF();
       }else
       {
       seg7Print(ledNum1, ledNum2);
           LED_1_ON();
           LED_2_ON();
           LED_3_ON();
       }
         }else
         {
                seg7Print(ledNum1, ledNum2);
         }


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