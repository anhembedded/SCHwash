//
// Created by hoang on 2/21/2022.
//

#include "U_platform.h"

intmax_t PF_systemTick = 0;

void delayHandler(uint32_t time, void (*HandleF)(void))
{
     uint32_t now = PF_systemTick;
     uint32_t totalDelay = now + time;
     while (PF_systemTick < totalDelay)
     {
          HandleF();
     }
}