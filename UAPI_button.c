#include "UAPI_button.h"



uint8_t UAPI_buttonHanlde()
{
    uint8_t buttonTemp = READ_BIT_MASK(U_NUT_POTR, U_NUT_1_PIN, 0b1111);
    intmax_t time = PF_systemTick;
    WAIT_UNTIL((PF_systemTick - time) > 20)
    {
        ledDisplayHandler();
    }
    if (!(buttonTemp == READ_BIT_MASK(U_NUT_POTR, U_NUT_1_PIN, 0b1111)))
    {
        buttonTemp = 0;
    }
    return buttonTemp;
}