#ifndef __UAPI_BUTTON_H__
#define __UAPI_BUTTON_H__

#include "schWash_Main.h"

#define UAPI_NUT1_IS_PRESSED    0b0001
#define UAPI_NUT2_IS_PRESSED      0b0010
#define UAPI_NUT3_IS_PRESSED         0b0100
#define UAPI_NUT4_IS_PRESSED        0b1000
uint8_t UAPI_buttonHanlde();



#endif // __UAPI_BUTTON_H__