
UHAL_timer2_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,32 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,35 :: 		MODIFY_REG(T2CON, bitMask, uhal_parm << T2CKPS0);
	MOVLW      252
	ANDWF      T2CON+0, 0
	MOVWF      R0+0
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      R0+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,36 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setPrescaler

UHAL_timer2_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,38 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,40 :: 		MODIFY_REG(T2CON, 0b1111 << TOUTPS0, uhal_parm << TOUTPS0);
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
;uhal_timer2.h,42 :: 		}
L_end_UHAL_TIMER2_setPostscaler:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setPostscaler

UHAL_timer2_UHAL_TIMER2_setModulePeriodValue:

;uhal_timer2.h,44 :: 		static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
;uhal_timer2.h,46 :: 		PR2 = val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setModulePeriodValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,47 :: 		}
L_end_UHAL_TIMER2_setModulePeriodValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setModulePeriodValue

UHAL_timer2_UHAL_TIMER2_setTimerValueValue:

;uhal_timer2.h,48 :: 		static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
;uhal_timer2.h,50 :: 		TMR2 = val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setTimerValueValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,51 :: 		}
L_end_UHAL_TIMER2_setTimerValueValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setTimerValueValue

UHAL_timer2_UHAL_TIMER2_setTimeForMatchEvent:

;uhal_timer2.h,53 :: 		static inline UHAL_TIMER2_setTimeForMatchEvent()
;uhal_timer2.h,56 :: 		}
L_end_UHAL_TIMER2_setTimeForMatchEvent:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setTimeForMatchEvent

_UHAL_timer2Init:

;UHAL_timer2.c,3 :: 		void UHAL_timer2Init()
;UHAL_timer2.c,5 :: 		UHAL_TIMER2_ON();
	BSF        T2CON+0, 2
;UHAL_timer2.c,6 :: 		UHAL_TIMER2_setPrescaler(UHAL_TIMER2_SET_PRESCALER_16);
	MOVLW      3
	MOVWF      FARG_UHAL_timer2_UHAL_TIMER2_setPrescaler_uhal_parm+0
	CALL       UHAL_timer2_UHAL_TIMER2_setPrescaler+0
;UHAL_timer2.c,7 :: 		UHAL_TIMER2_setPostscaler(UHAL_TIMER2_SET_POSTSCALER_2);
	MOVLW      1
	MOVWF      FARG_UHAL_timer2_UHAL_TIMER2_setPostscaler_uhal_parm+0
	CALL       UHAL_timer2_UHAL_TIMER2_setPostscaler+0
;UHAL_timer2.c,8 :: 		UHAL_TIMER2_setPrescaler(UHAL_TIMER2_SET_PRESCALER_16);
	MOVLW      3
	MOVWF      FARG_UHAL_timer2_UHAL_TIMER2_setPrescaler_uhal_parm+0
	CALL       UHAL_timer2_UHAL_TIMER2_setPrescaler+0
;UHAL_timer2.c,9 :: 		U_TIMER2_COMPARE_REG = 10;
	MOVLW      10
	MOVWF      PR2+0
;UHAL_timer2.c,10 :: 		TMR2IF_bit = 0;
	BCF        TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
;UHAL_timer2.c,11 :: 		U_GLOBAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 7
;UHAL_timer2.c,12 :: 		U_PERIPHERAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 6
;UHAL_timer2.c,13 :: 		U_TMR2_TO_PR2_MATCH_INTERRUPT_ENABLE();
	BSF        PIE1+0, 1
;UHAL_timer2.c,15 :: 		}
L_end_UHAL_timer2Init:
	RETURN
; end of _UHAL_timer2Init
