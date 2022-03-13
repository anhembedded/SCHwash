#include "UHAL_timer2.h"

void UHAL_timer2Init()
{
  UHAL_TIMER2_ON();
  UHAL_TIMER2_setPrescaler(UHAL_TIMER2_SET_PRESCALER_16);
  UHAL_TIMER2_setPostscaler(UHAL_TIMER2_SET_POSTSCALER_2);
     UHAL_TIMER2_setPrescaler(UHAL_TIMER2_SET_PRESCALER_16);
    U_TIMER2_COMPARE_REG = 10;
    TMR2IF_bit = 0;
    U_GLOBAL_INTERRUPT_ENABLE();
    U_PERIPHERAL_INTERRUPT_ENABLE();
    U_TMR2_TO_PR2_MATCH_INTERRUPT_ENABLE();

}