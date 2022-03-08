//
// Created by hoang on 2/21/2022.
//

#ifndef UNTITLED5_U_HARDWARE_INIT_H
#define UNTITLED5_U_HARDWARE_INIT_H

#include "U_platform.h"



#define U_GLOBAL_INTERRUPT_ENABLE()     BIT_SET(INTCON, GIE)
#define U_GLOBAL_INTERRUPT_DISABLE()    BIT_CLEAR(INTCON, GIE)

#define U_PERIPHERAL_INTERRUPT_ENABLE()    BIT_SET(INTCON, PEIE)
#define U_PERIPHERAL_INTERRUPT_DISABLE()    BIT_CLEAR(INTCON, PEIE)

#define U_TMR2_TO_PR2_MATCH_INTERRUPT_ENABLE()   BIT_SET(PIE1, TMR2IE)
#define U_TMR2_TO_PR2_MATCH_INTERRUPT_DISABLE()   BIT_CLEAR(PIE1, TMR2IE)

#define U_IS_SET_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG() BIT_READ(PIR1, TMR2IF)
#define U_CLEAR_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG()  BIT_CLEAR(PIR1, TMR2IF)

#define U_EXTERNAL_INTERRUPT_ENABLE() BIT_SET(INTCON, INTE)
#define U_EXTERNAL_INTERRUPT_DISABLE()  BIT_CLEAR(INTCON, INTE)

#define U_IS_SET_EXTERNAL_INTERRUPT()   BIT_READ(INTCON,INTF)
#define U_CLEAR_EXTERNAL_INTERRUPT()   BIT_CLEAR(INTCON,INTF)

#define U_EXTERNAL_INTERRUPT_FALLING()     BIT_SET(OPTION_REG, INTEDG)
#define U_EXTERNAL_INTERRUPT_RISING()      BIT_CLEAR(OPTION_REG, INTEDG)



#define U_TIMER2_T uint8_t
#define U_TIMER2_MAX UINT8_MAX

#define U_TIMER2_VALUE_REG TMR2
#define U_TIMER2_COMPARE_REG PR2



 inline void InitTimer1();
 inline void InitTimer2();
 inline void InitExternalInterrupt();
 inline void U_gpioInit();




#endif //UNTITLED5_U_HARDWARE_INIT_H