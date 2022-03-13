#include "UHAL_74HC595.h"

uint8_t seg7DeCode[] = {0xC0, 0xF9U, 0xA4U, 0xB0U, 0x99U, 0x92U, 0x82U, 0xF8U, 0x80U, 0x90U};
//uint8_t textDigit[4];

/* FIRMWARE LAYER */
static uint8_t reverseByte(uint8_t agr)
{
    uint8_t b = agr;
    return b = ((b * 0x0802LU & 0x22110LU) | (b * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
}
static void clockGenerating()
{
    BIT_SET(BIT_SHIFT_REG, CLOCK);
    PF_delay_us(_74HC595_CLOCK_DELAY_TIME);
    BIT_CLEAR(BIT_SHIFT_REG, CLOCK);
    PF_delay_us(_74HC595_CLOCK_DELAY_TIME);
}
static void latchGenerating()
{
    BIT_SET(BIT_SHIFT_REG, LATCH);
    PF_delay_us(_74HC595_CLOCK_DELAY_TIME);
    BIT_CLEAR(BIT_SHIFT_REG, LATCH);
    PF_delay_us(_74HC595_CLOCK_DELAY_TIME);
}
static void seg7Write(uint8_t seg1, uint8_t seg2)
{
    uint_fast8_t for_index = 0;
    uint16_t temp = 0;
    seg1 = reverseByte(seg1);
    seg2 = reverseByte(seg2);
    temp = seg1;
    temp = temp << 8;
    temp |= seg2;
    for (for_index = 0; for_index <= 15; for_index++)
    {
        if (BIT_READ(temp, for_index))
        {
            BIT_SET(BIT_SHIFT_REG, SERIAL_DATA_IN);
        }
        else
        {
            BIT_CLEAR(BIT_SHIFT_REG, SERIAL_DATA_IN);
        }
        clockGenerating();
    }
    latchGenerating();
}

void seg7WriteNum(uint8_t num1, uint8_t num2)
{
    seg7Write(seg7DeCode[num1], seg7DeCode[num2]);
}
void seg7Print(uint16_t num1, uint16_t num2)
{
    uint8_t digitSeg_1[3];
    uint8_t digitSeg_2[3];
    /* separating munber to digit */
    digitSeg_1[0] = num1 % 10;
    num1 = num1 / 10;
    digitSeg_1[1] = num1 % 10;
    num1 = num1 / 10;
    digitSeg_1[2] = num1 % 10;

    digitSeg_2[0] = num2 % 10;
    num2 = num2 / 10;
    digitSeg_2[1] = num2 % 10;
    num2 = num2 / 10;
    digitSeg_2[2] = num2 % 10;
    /*  */
    seg7WriteNum(digitSeg_1[2], digitSeg_2[2]);
    LED_1_ON();
    PF_delay_ms(_SEG_DELAY_TIME);
    LED_1_OFF();
    seg7WriteNum(digitSeg_1[1], digitSeg_2[1]);
    LED_2_ON();
    PF_delay_ms(_SEG_DELAY_TIME);
    LED_2_OFF();
    seg7WriteNum(digitSeg_1[0], digitSeg_2[0]);
    LED_3_ON();
    PF_delay_ms(_SEG_DELAY_TIME);
    LED_3_OFF();
}