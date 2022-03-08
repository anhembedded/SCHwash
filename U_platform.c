                              //
// Created by hoang on 2/21/2022.
//

#include "U_platform.h"



const pin_type_t U_PWM_PIN = 9;
intmax_t U_systemTick = 0;

void delayHandler(uint32_t time, void (*HandleF)(void))
{
     uint32_t now = u_systemTick;
     uint32_t totalDelay = now + time;
     while (u_systemTick < totalDelay)
     {
          HandleF();
     }
}