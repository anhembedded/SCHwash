
UHAL_timer2_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,38 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,41 :: 		MODIFY_REG(T2CON, bitMask, uhal_parm << T2CKPS0);
	MOVLW      252
	ANDWF      T2CON+0, 0
	MOVWF      R0+0
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      R0+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,42 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setPrescaler

UHAL_timer2_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,44 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,46 :: 		MODIFY_REG(T2CON, 0b1111 << TOUTPS0, uhal_parm << TOUTPS0);
	MOVLW      135
	ANDWF      T2CON+0, 0
	MOVWF      R2+0
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setPostscaler_uhal_parm+0, 0
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
; end of UHAL_timer2_UHAL_TIMER2_setPostscaler

UHAL_timer2_UHAL_TIMER2_updatePrValue:

;uhal_timer2.h,49 :: 		static inline void UHAL_TIMER2_updatePrValue(uint8_t val,UHAL_TIMER2_REGITER_T * buffer )
;uhal_timer2.h,51 :: 		*buffer =   val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_updatePrValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_updatePrValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,52 :: 		}
L_end_UHAL_TIMER2_updatePrValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_updatePrValue

UHAL_timer2_UHAL_TIMER2_updateTimerValue:

;uhal_timer2.h,53 :: 		static inline void UHAL_TIMER2_updateTimerValue(uint8_t val, UHAL_TIMER2_REGITER_T * buffer)
;uhal_timer2.h,55 :: 		*buffer =   val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_updateTimerValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_updateTimerValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,56 :: 		}
L_end_UHAL_TIMER2_updateTimerValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_updateTimerValue

UHAL_timer2_UHAL_TIMER2_setPrValue:

;uhal_timer2.h,57 :: 		static inline void UHAL_TIMER2_setPrValue(uint8_t val)
;uhal_timer2.h,59 :: 		PR2 = val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setPrValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,60 :: 		}
L_end_UHAL_TIMER2_setPrValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setPrValue

UHAL_timer2_UHAL_TIMER2_setTimerValue:

;uhal_timer2.h,61 :: 		static inline void UHAL_TIMER2_setTimerValue(uint8_t val)
;uhal_timer2.h,63 :: 		TMR2 = val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setTimerValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,64 :: 		}
L_end_UHAL_TIMER2_setTimerValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setTimerValue

_UHAL_timer2Init:

;UHAL_timer2.c,3 :: 		void UHAL_timer2Init()
;UHAL_timer2.c,10 :: 		T2CON	 = 0x4D;
	MOVLW      77
	MOVWF      T2CON+0
;UHAL_timer2.c,12 :: 		TMR2IE_bit	 = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;UHAL_timer2.c,13 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;UHAL_timer2.c,16 :: 		U_TIMER2_COMPARE_REG = 0;     // 0 -> 230; max = 250
	CLRF       PR2+0
;UHAL_timer2.c,17 :: 		TMR2IF_bit = 0;
	BCF        TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
;UHAL_timer2.c,18 :: 		U_GLOBAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 7
;UHAL_timer2.c,19 :: 		U_PERIPHERAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 6
;UHAL_timer2.c,20 :: 		U_TMR2_TO_PR2_MATCH_INTERRUPT_ENABLE();
	BSF        PIE1+0, 1
;UHAL_timer2.c,22 :: 		}
L_end_UHAL_timer2Init:
	RETURN
; end of _UHAL_timer2Init
