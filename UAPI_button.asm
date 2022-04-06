
UAPI_button_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,38 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,41 :: 		MODIFY_REG(T2CON, bitMask, uhal_parm << T2CKPS0);
	MOVLW      252
	ANDWF      T2CON+0, 0
	MOVWF      R0+0
	MOVF       FARG_UAPI_button_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      R0+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,42 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of UAPI_button_UHAL_TIMER2_setPrescaler

UAPI_button_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,44 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,46 :: 		MODIFY_REG(T2CON, 0b1111 << TOUTPS0, uhal_parm << TOUTPS0);
	MOVLW      135
	ANDWF      T2CON+0, 0
	MOVWF      R2+0
	MOVF       FARG_UAPI_button_UHAL_TIMER2_setPostscaler_uhal_parm+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,47 :: 		}
L_end_UHAL_TIMER2_setPostscaler:
	RETURN
; end of UAPI_button_UHAL_TIMER2_setPostscaler

UAPI_button_UHAL_TIMER2_updatePrValue:

;uhal_timer2.h,49 :: 		static inline void UHAL_TIMER2_updatePrValue(uint8_t val,UHAL_TIMER2_REGITER_T * buffer )
;uhal_timer2.h,51 :: 		*buffer =   val;
	MOVF       FARG_UAPI_button_UHAL_TIMER2_updatePrValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_UAPI_button_UHAL_TIMER2_updatePrValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,52 :: 		}
L_end_UHAL_TIMER2_updatePrValue:
	RETURN
; end of UAPI_button_UHAL_TIMER2_updatePrValue

UAPI_button_UHAL_TIMER2_updateTimerValue:

;uhal_timer2.h,53 :: 		static inline void UHAL_TIMER2_updateTimerValue(uint8_t val, UHAL_TIMER2_REGITER_T * buffer)
;uhal_timer2.h,55 :: 		*buffer =   val;
	MOVF       FARG_UAPI_button_UHAL_TIMER2_updateTimerValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_UAPI_button_UHAL_TIMER2_updateTimerValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,56 :: 		}
L_end_UHAL_TIMER2_updateTimerValue:
	RETURN
; end of UAPI_button_UHAL_TIMER2_updateTimerValue

UAPI_button_UHAL_TIMER2_setPrValue:

;uhal_timer2.h,57 :: 		static inline void UHAL_TIMER2_setPrValue(uint8_t val)
;uhal_timer2.h,59 :: 		PR2 = val;
	MOVF       FARG_UAPI_button_UHAL_TIMER2_setPrValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,60 :: 		}
L_end_UHAL_TIMER2_setPrValue:
	RETURN
; end of UAPI_button_UHAL_TIMER2_setPrValue

UAPI_button_UHAL_TIMER2_setTimerValue:

;uhal_timer2.h,61 :: 		static inline void UHAL_TIMER2_setTimerValue(uint8_t val)
;uhal_timer2.h,63 :: 		TMR2 = val;
	MOVF       FARG_UAPI_button_UHAL_TIMER2_setTimerValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,64 :: 		}
L_end_UHAL_TIMER2_setTimerValue:
	RETURN
; end of UAPI_button_UHAL_TIMER2_setTimerValue

_UAPI_buttonHanlde:

;UAPI_button.c,5 :: 		uint8_t UAPI_buttonHanlde()
;UAPI_button.c,7 :: 		uint8_t buttonTemp = READ_BIT_MASK(U_NUT_POTR, U_NUT_1_PIN, 0b1111);
	MOVF       PORTD+0, 0
	MOVWF      UAPI_buttonHanlde_buttonTemp_L0+0
	RRF        UAPI_buttonHanlde_buttonTemp_L0+0, 1
	BCF        UAPI_buttonHanlde_buttonTemp_L0+0, 7
	RRF        UAPI_buttonHanlde_buttonTemp_L0+0, 1
	BCF        UAPI_buttonHanlde_buttonTemp_L0+0, 7
	RRF        UAPI_buttonHanlde_buttonTemp_L0+0, 1
	BCF        UAPI_buttonHanlde_buttonTemp_L0+0, 7
	RRF        UAPI_buttonHanlde_buttonTemp_L0+0, 1
	BCF        UAPI_buttonHanlde_buttonTemp_L0+0, 7
	MOVLW      15
	ANDWF      UAPI_buttonHanlde_buttonTemp_L0+0, 1
;UAPI_button.c,8 :: 		intmax_t time = PF_systemTick;
	MOVF       _PF_systemTick+0, 0
	MOVWF      UAPI_buttonHanlde_time_L0+0
	MOVF       _PF_systemTick+1, 0
	MOVWF      UAPI_buttonHanlde_time_L0+1
	MOVF       _PF_systemTick+2, 0
	MOVWF      UAPI_buttonHanlde_time_L0+2
	MOVF       _PF_systemTick+3, 0
	MOVWF      UAPI_buttonHanlde_time_L0+3
;UAPI_button.c,9 :: 		WAIT_UNTIL((PF_systemTick - time) > 20)
L_UAPI_buttonHanlde0:
	MOVF       _PF_systemTick+0, 0
	MOVWF      R1+0
	MOVF       _PF_systemTick+1, 0
	MOVWF      R1+1
	MOVF       _PF_systemTick+2, 0
	MOVWF      R1+2
	MOVF       _PF_systemTick+3, 0
	MOVWF      R1+3
	MOVF       UAPI_buttonHanlde_time_L0+0, 0
	SUBWF      R1+0, 1
	MOVF       UAPI_buttonHanlde_time_L0+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     UAPI_buttonHanlde_time_L0+1, 0
	SUBWF      R1+1, 1
	MOVF       UAPI_buttonHanlde_time_L0+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     UAPI_buttonHanlde_time_L0+2, 0
	SUBWF      R1+2, 1
	MOVF       UAPI_buttonHanlde_time_L0+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     UAPI_buttonHanlde_time_L0+3, 0
	SUBWF      R1+3, 1
	MOVF       R1+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__UAPI_buttonHanlde10
	MOVF       R1+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__UAPI_buttonHanlde10
	MOVF       R1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__UAPI_buttonHanlde10
	MOVF       R1+0, 0
	SUBLW      20
L__UAPI_buttonHanlde10:
	BTFSS      STATUS+0, 0
	GOTO       L_UAPI_buttonHanlde1
;UAPI_button.c,11 :: 		ledDisplayHandler();
	CALL       _ledDisplayHandler+0
;UAPI_button.c,12 :: 		}
	GOTO       L_UAPI_buttonHanlde0
L_UAPI_buttonHanlde1:
;UAPI_button.c,13 :: 		if (!(buttonTemp == READ_BIT_MASK(U_NUT_POTR, U_NUT_1_PIN, 0b1111)))
	MOVF       PORTD+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       UAPI_buttonHanlde_buttonTemp_L0+0, 0
	XORWF      R1+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_UAPI_buttonHanlde2
;UAPI_button.c,15 :: 		buttonTemp = 0;
	CLRF       UAPI_buttonHanlde_buttonTemp_L0+0
;UAPI_button.c,16 :: 		}
L_UAPI_buttonHanlde2:
;UAPI_button.c,17 :: 		return buttonTemp;
	MOVF       UAPI_buttonHanlde_buttonTemp_L0+0, 0
	MOVWF      R0+0
;UAPI_button.c,18 :: 		}
L_end_UAPI_buttonHanlde:
	RETURN
; end of _UAPI_buttonHanlde
