//
// Created by hoang on 2/21/2022.
//

#include "U_hardware_init.h"
#include "U_platform.h"




#define UHAL_TIMER2_SET_PRESCALER_1 0b00
#define UHAL_TIMER2_SET_PRESCALER_4 0b01
#define UHAL_TIMER2_SET_PRESCALER_16 0b11


#define UHAL_TIMER2_ON() SET_BIT(T2CON, TMR2ON)
#define UHAL_TIMER2_OFF() CLEAR_BIT(T2CON, TMR2ON)



static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
{
    T2CON |= (uhal_parm << T2CKPS0);
}

static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
{
    PR2 = val;
}
static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
{
    TMR2 = val;
}



inline void InitTimer1()
{
     T1CON = 0x01U;
     TMR1IF_bit = 0;
     TMR1H = 0xFCU;
     TMR1L = 0x18U;
     TMR1IE_bit = 1;
     INTCON = 0xC0U;
}

inline void InitTimer2(){
  T2CON	 = 0x4D;
  PR2		 = 250;
  TMR2IE_bit	 = 1;
  INTCON	 = 0xC0;
}
 inline void InitExternalInterrupt()
 {
    U_GLOBAL_INTERRUPT_ENABLE();
    U_EXTERNAL_INTERRUPT_RISING();
    U_EXTERNAL_INTERRUPT_ENABLE();
 }