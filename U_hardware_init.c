//
// Created by hoang on 2/21/2022.
//

#include "U_hardware_init.h"

inline void InitTimer1()
{
     T1CON = 0x01U;
     TMR1IF_bit = 0;
     TMR1H = 0xFCU;
     TMR1L = 0x18U;
     TMR1IE_bit = 1;
     INTCON = 0xC0U;
}


