#ifndef __UHAL_TIMER2_H__
#define __UHAL_TIMER2_H__

#include  "U_hardware_init.h"

#define UHAL_TIMER2_SET_PRESCALER_1 0b00
#define UHAL_TIMER2_SET_PRESCALER_4 0b01
#define UHAL_TIMER2_SET_PRESCALER_16 0b11



#define UHAL_TIMER2_ON() SET_BIT(T2CON, TMR2ON)
#define UHAL_TIMER2_OFF() CLEAR_BIT(T2CON, TMR2ON)
#define UHAL_TIMER2_IS_SET_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG()  U_IS_SET_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG()
#define UHAL_TIMER2_CLEAR_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG()   U_CLEAR_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG()

static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
{
    T2CON |= (uhal_parm << T2CKPS0);
}

static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
{
 T2CON |= (uhal_parm << TOUTPS0);
}

static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
{
    PR2 = val;
}
static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
{
    TMR2 = val;
}

static inline UHAL_TIMER2_setTimeForMatchEvent()
{

}

void UHAL_timer2Init();

#endif // __UHAL_TIMER2_H__