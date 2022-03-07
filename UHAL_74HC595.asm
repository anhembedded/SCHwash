
UHAL_74HC595_reverseByte:

;UHAL_74HC595.c,7 :: 		static uint8_t reverseByte(uint8_t agr)
;UHAL_74HC595.c,10 :: 		return b = ((b * 0x0802LU & 0x22110LU) | (b * 0x8020LU & 0x88440LU)) * 0x10101LU >> 16;
	MOVF       FARG_UHAL_74HC595_reverseByte_agr+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVLW      2
	MOVWF      R4+0
	MOVLW      8
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      16
	ANDWF      R0+0, 0
	MOVWF      FLOC_UHAL_74HC595_reverseByte+0
	MOVLW      33
	ANDWF      R0+1, 0
	MOVWF      FLOC_UHAL_74HC595_reverseByte+1
	MOVLW      2
	ANDWF      R0+2, 0
	MOVWF      FLOC_UHAL_74HC595_reverseByte+2
	MOVLW      0
	ANDWF      R0+3, 0
	MOVWF      FLOC_UHAL_74HC595_reverseByte+3
	MOVF       FARG_UHAL_74HC595_reverseByte_agr+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVLW      32
	MOVWF      R4+0
	MOVLW      128
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      64
	ANDWF      R0+0, 1
	MOVLW      132
	ANDWF      R0+1, 1
	MOVLW      8
	ANDWF      R0+2, 1
	MOVLW      0
	ANDWF      R0+3, 1
	MOVF       FLOC_UHAL_74HC595_reverseByte+0, 0
	IORWF      R0+0, 1
	MOVF       FLOC_UHAL_74HC595_reverseByte+1, 0
	IORWF      R0+1, 1
	MOVF       FLOC_UHAL_74HC595_reverseByte+2, 0
	IORWF      R0+2, 1
	MOVF       FLOC_UHAL_74HC595_reverseByte+3, 0
	IORWF      R0+3, 1
	MOVLW      1
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	MOVLW      1
	MOVWF      R4+2
	MOVLW      0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+2, 0
	MOVWF      R4+0
	MOVF       R0+3, 0
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       R4+0, 0
	MOVWF      R0+0
;UHAL_74HC595.c,11 :: 		}
L_end_reverseByte:
	RETURN
; end of UHAL_74HC595_reverseByte

UHAL_74HC595_clockGenerating:

;UHAL_74HC595.c,12 :: 		static void clockGenerating()
;UHAL_74HC595.c,14 :: 		BIT_SET(BIT_SHIFT_REG, CLOCK);
	BSF        PORTC+0, 2
;UHAL_74HC595.c,15 :: 		U_delay_us(_74HC595_CLOCK_DELAY_TIME);
	NOP
;UHAL_74HC595.c,16 :: 		BIT_CLEAR(BIT_SHIFT_REG, CLOCK);
	MOVLW      251
	ANDWF      PORTC+0, 1
;UHAL_74HC595.c,17 :: 		U_delay_us(_74HC595_CLOCK_DELAY_TIME);
	NOP
;UHAL_74HC595.c,18 :: 		}
L_end_clockGenerating:
	RETURN
; end of UHAL_74HC595_clockGenerating

UHAL_74HC595_latchGenerating:

;UHAL_74HC595.c,19 :: 		static void latchGenerating()
;UHAL_74HC595.c,21 :: 		BIT_SET(BIT_SHIFT_REG, LATCH);
	BSF        PORTC+0, 3
;UHAL_74HC595.c,22 :: 		U_delay_us(_74HC595_CLOCK_DELAY_TIME);
	NOP
;UHAL_74HC595.c,23 :: 		BIT_CLEAR(BIT_SHIFT_REG, LATCH);
	MOVLW      247
	ANDWF      PORTC+0, 1
;UHAL_74HC595.c,24 :: 		U_delay_us(_74HC595_CLOCK_DELAY_TIME);
	NOP
;UHAL_74HC595.c,25 :: 		}
L_end_latchGenerating:
	RETURN
; end of UHAL_74HC595_latchGenerating

UHAL_74HC595_seg7Write:

;UHAL_74HC595.c,26 :: 		static void seg7Write(uint8_t seg1, uint8_t seg2)
;UHAL_74HC595.c,28 :: 		uint8_t for_index = 0;
	CLRF       UHAL_74HC595_seg7Write_for_index_L0+0
	MOVLW      0
	MOVWF      UHAL_74HC595_seg7Write_temp_L0+0
	MOVLW      0
	MOVWF      UHAL_74HC595_seg7Write_temp_L0+1
;UHAL_74HC595.c,30 :: 		seg1 = reverseByte(seg1);
	MOVF       FARG_UHAL_74HC595_seg7Write_seg1+0, 0
	MOVWF      FARG_UHAL_74HC595_reverseByte_agr+0
	CALL       UHAL_74HC595_reverseByte+0
	MOVF       R0+0, 0
	MOVWF      FARG_UHAL_74HC595_seg7Write_seg1+0
;UHAL_74HC595.c,31 :: 		seg2 = reverseByte(seg2);
	MOVF       FARG_UHAL_74HC595_seg7Write_seg2+0, 0
	MOVWF      FARG_UHAL_74HC595_reverseByte_agr+0
	CALL       UHAL_74HC595_reverseByte+0
	MOVF       R0+0, 0
	MOVWF      FARG_UHAL_74HC595_seg7Write_seg2+0
;UHAL_74HC595.c,32 :: 		temp = seg1;
	MOVF       FARG_UHAL_74HC595_seg7Write_seg1+0, 0
	MOVWF      UHAL_74HC595_seg7Write_temp_L0+0
	CLRF       UHAL_74HC595_seg7Write_temp_L0+1
;UHAL_74HC595.c,33 :: 		temp = temp << 8;
	MOVF       UHAL_74HC595_seg7Write_temp_L0+0, 0
	MOVWF      UHAL_74HC595_seg7Write_temp_L0+1
	CLRF       UHAL_74HC595_seg7Write_temp_L0+0
;UHAL_74HC595.c,34 :: 		temp |= seg2;
	MOVF       R0+0, 0
	IORWF      UHAL_74HC595_seg7Write_temp_L0+0, 1
	MOVLW      0
	IORWF      UHAL_74HC595_seg7Write_temp_L0+1, 1
;UHAL_74HC595.c,35 :: 		for (for_index = 0; for_index <= 15; for_index++)
	CLRF       UHAL_74HC595_seg7Write_for_index_L0+0
L_UHAL_74HC595_seg7Write0:
	MOVF       UHAL_74HC595_seg7Write_for_index_L0+0, 0
	SUBLW      15
	BTFSS      STATUS+0, 0
	GOTO       L_UHAL_74HC595_seg7Write1
;UHAL_74HC595.c,37 :: 		if (BIT_READ(temp, for_index))
	MOVF       UHAL_74HC595_seg7Write_for_index_L0+0, 0
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	MOVF       R4+0, 0
L_UHAL_74HC595_seg7Write12:
	BTFSC      STATUS+0, 2
	GOTO       L_UHAL_74HC595_seg7Write13
	RLF        R0+0, 1
	RLF        R0+1, 1
	RLF        R0+2, 1
	RLF        R0+3, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L_UHAL_74HC595_seg7Write12
L_UHAL_74HC595_seg7Write13:
	MOVF       UHAL_74HC595_seg7Write_temp_L0+0, 0
	ANDWF      R0+0, 1
	MOVF       UHAL_74HC595_seg7Write_temp_L0+1, 0
	ANDWF      R0+1, 1
	MOVLW      0
	ANDWF      R0+2, 1
	ANDWF      R0+3, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	IORWF      R0+2, 0
	IORWF      R0+3, 0
	BTFSC      STATUS+0, 2
	GOTO       L_UHAL_74HC595_seg7Write3
;UHAL_74HC595.c,39 :: 		BIT_SET(BIT_SHIFT_REG, SERIAL_DATA_IN);
	BSF        PORTC+0, 1
;UHAL_74HC595.c,40 :: 		}
	GOTO       L_UHAL_74HC595_seg7Write4
L_UHAL_74HC595_seg7Write3:
;UHAL_74HC595.c,43 :: 		BIT_CLEAR(BIT_SHIFT_REG, SERIAL_DATA_IN);
	MOVLW      253
	ANDWF      PORTC+0, 1
;UHAL_74HC595.c,44 :: 		}
L_UHAL_74HC595_seg7Write4:
;UHAL_74HC595.c,45 :: 		clockGenerating();
	CALL       UHAL_74HC595_clockGenerating+0
;UHAL_74HC595.c,35 :: 		for (for_index = 0; for_index <= 15; for_index++)
	INCF       UHAL_74HC595_seg7Write_for_index_L0+0, 1
;UHAL_74HC595.c,46 :: 		}
	GOTO       L_UHAL_74HC595_seg7Write0
L_UHAL_74HC595_seg7Write1:
;UHAL_74HC595.c,47 :: 		latchGenerating();
	CALL       UHAL_74HC595_latchGenerating+0
;UHAL_74HC595.c,48 :: 		}
L_end_seg7Write:
	RETURN
; end of UHAL_74HC595_seg7Write

_seg7WriteNum:

;UHAL_74HC595.c,50 :: 		void seg7WriteNum(uint8_t num1, uint8_t num2)
;UHAL_74HC595.c,52 :: 		seg7Write(seg7DeCode[num1], seg7DeCode[num2]);
	MOVF       FARG_seg7WriteNum_num1+0, 0
	ADDLW      _seg7DeCode+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UHAL_74HC595_seg7Write_seg1+0
	MOVF       FARG_seg7WriteNum_num2+0, 0
	ADDLW      _seg7DeCode+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UHAL_74HC595_seg7Write_seg2+0
	CALL       UHAL_74HC595_seg7Write+0
;UHAL_74HC595.c,53 :: 		}
L_end_seg7WriteNum:
	RETURN
; end of _seg7WriteNum

_seg7Print:

;UHAL_74HC595.c,54 :: 		void seg7Print(uint16_t num1, uint16_t num2)
;UHAL_74HC595.c,59 :: 		digitSeg_1[0] = num1 % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_seg7Print_num1+0, 0
	MOVWF      R0+0
	MOVF       FARG_seg7Print_num1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      seg7Print_digitSeg_1_L0+0
;UHAL_74HC595.c,60 :: 		num1 = num1 / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_seg7Print_num1+0, 0
	MOVWF      R0+0
	MOVF       FARG_seg7Print_num1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__seg7Print+0
	MOVF       R0+1, 0
	MOVWF      FLOC__seg7Print+1
	MOVF       FLOC__seg7Print+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       FLOC__seg7Print+1, 0
	MOVWF      FARG_seg7Print_num1+1
;UHAL_74HC595.c,61 :: 		digitSeg_1[1] = num1 % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__seg7Print+0, 0
	MOVWF      R0+0
	MOVF       FLOC__seg7Print+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      seg7Print_digitSeg_1_L0+1
;UHAL_74HC595.c,62 :: 		num1 = num1 / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__seg7Print+0, 0
	MOVWF      R0+0
	MOVF       FLOC__seg7Print+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       R0+1, 0
	MOVWF      FARG_seg7Print_num1+1
;UHAL_74HC595.c,63 :: 		digitSeg_1[2] = num1 % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__seg7Print+2
	MOVF       R0+1, 0
	MOVWF      FLOC__seg7Print+3
	MOVF       FLOC__seg7Print+2, 0
	MOVWF      seg7Print_digitSeg_1_L0+2
;UHAL_74HC595.c,65 :: 		digitSeg_2[0] = num2 % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_seg7Print_num2+0, 0
	MOVWF      R0+0
	MOVF       FARG_seg7Print_num2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      seg7Print_digitSeg_2_L0+0
;UHAL_74HC595.c,66 :: 		num2 = num2 / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_seg7Print_num2+0, 0
	MOVWF      R0+0
	MOVF       FARG_seg7Print_num2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__seg7Print+0
	MOVF       R0+1, 0
	MOVWF      FLOC__seg7Print+1
	MOVF       FLOC__seg7Print+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       FLOC__seg7Print+1, 0
	MOVWF      FARG_seg7Print_num2+1
;UHAL_74HC595.c,67 :: 		digitSeg_2[1] = num2 % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__seg7Print+0, 0
	MOVWF      R0+0
	MOVF       FLOC__seg7Print+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      seg7Print_digitSeg_2_L0+1
;UHAL_74HC595.c,68 :: 		num2 = num2 / 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__seg7Print+0, 0
	MOVWF      R0+0
	MOVF       FLOC__seg7Print+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       R0+1, 0
	MOVWF      FARG_seg7Print_num2+1
;UHAL_74HC595.c,69 :: 		digitSeg_2[2] = num2 % 10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      seg7Print_digitSeg_2_L0+2
;UHAL_74HC595.c,71 :: 		seg7WriteNum(digitSeg_1[2], digitSeg_2[2]);
	MOVF       FLOC__seg7Print+2, 0
	MOVWF      FARG_seg7WriteNum_num1+0
	MOVF       R0+0, 0
	MOVWF      FARG_seg7WriteNum_num2+0
	CALL       _seg7WriteNum+0
;UHAL_74HC595.c,72 :: 		LED_1_ON();
	BSF        PORTC+0, 4
;UHAL_74HC595.c,73 :: 		U_delay_ms(_SEG_DELAY_TIME);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_seg7Print5:
	DECFSZ     R13+0, 1
	GOTO       L_seg7Print5
	DECFSZ     R12+0, 1
	GOTO       L_seg7Print5
;UHAL_74HC595.c,74 :: 		LED_1_OFF();
	MOVLW      239
	ANDWF      PORTC+0, 1
;UHAL_74HC595.c,75 :: 		seg7WriteNum(digitSeg_1[1], digitSeg_2[1]);
	MOVF       seg7Print_digitSeg_1_L0+1, 0
	MOVWF      FARG_seg7WriteNum_num1+0
	MOVF       seg7Print_digitSeg_2_L0+1, 0
	MOVWF      FARG_seg7WriteNum_num2+0
	CALL       _seg7WriteNum+0
;UHAL_74HC595.c,76 :: 		LED_2_ON();
	BSF        PORTC+0, 5
;UHAL_74HC595.c,77 :: 		U_delay_ms(_SEG_DELAY_TIME);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_seg7Print6:
	DECFSZ     R13+0, 1
	GOTO       L_seg7Print6
	DECFSZ     R12+0, 1
	GOTO       L_seg7Print6
;UHAL_74HC595.c,78 :: 		LED_2_OFF();
	MOVLW      223
	ANDWF      PORTC+0, 1
;UHAL_74HC595.c,79 :: 		seg7WriteNum(digitSeg_1[0], digitSeg_2[0]);
	MOVF       seg7Print_digitSeg_1_L0+0, 0
	MOVWF      FARG_seg7WriteNum_num1+0
	MOVF       seg7Print_digitSeg_2_L0+0, 0
	MOVWF      FARG_seg7WriteNum_num2+0
	CALL       _seg7WriteNum+0
;UHAL_74HC595.c,80 :: 		LED_3_ON();
	BSF        PORTC+0, 6
;UHAL_74HC595.c,81 :: 		U_delay_ms(_SEG_DELAY_TIME);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_seg7Print7:
	DECFSZ     R13+0, 1
	GOTO       L_seg7Print7
	DECFSZ     R12+0, 1
	GOTO       L_seg7Print7
;UHAL_74HC595.c,82 :: 		LED_3_OFF();
	MOVLW      191
	ANDWF      PORTC+0, 1
;UHAL_74HC595.c,83 :: 		}
L_end_seg7Print:
	RETURN
; end of _seg7Print
