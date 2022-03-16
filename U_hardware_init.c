//
// Created by hoang on 2/21/2022.
//

#include "U_hardware_init.h"
#include "U_platform.h"


inline void InitTimer1()
{
     T1CON = 0x01U;
     TMR1IF_bit = 0;
     TMR1H = 0xFCU;
     TMR1L = 0x18U;
     TMR1IE_bit = 1;
     INTCON = 0xC0U;
}

 inline void InitExternalInterrupt()
 {
    U_GLOBAL_INTERRUPT_ENABLE();
    U_EXTERNAL_INTERRUPT_RISING();
    U_EXTERNAL_INTERRUPT_ENABLE();
 }
 
  inline void U_gpioInit()
  {
     ANSEL = 0; // Configure AN pins as digital
     ANSELH = 0;
     C1ON_bit = 0; // Disable comparators
     C2ON_bit = 0;
     TRISC = 0x00U;
     PORTC = 0x00U;
     TRISB1_bit = 0;
     TRISE0_bit = 0;
     
     TRISA3_bit = 0;
      TRISB1_bit = 0;
      TRISE0_bit =0;
      //BUtton
      TRISD4_bit = 1;
      TRISD5_bit = 1;
      TRISD6_bit = 1;
      TRISD7_bit = 1;
  }