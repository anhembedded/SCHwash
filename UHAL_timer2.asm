
UHAL_timer2_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,17 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,20 :: 		T2CON |= (uhal_parm << T2CKPS0);
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      T2CON+0, 1
;uhal_timer2.h,21 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setPrescaler

UHAL_timer2_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,23 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,25 :: 		T2CON |= (uhal_parm << TOUTPS0);
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setPostscaler_uhal_parm+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      T2CON+0, 1
;uhal_timer2.h,26 :: 		}
L_end_UHAL_TIMER2_setPostscaler:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setPostscaler

UHAL_timer2_UHAL_TIMER2_setModulePeriodValue:

;uhal_timer2.h,28 :: 		static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
;uhal_timer2.h,30 :: 		PR2 = val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setModulePeriodValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,31 :: 		}
L_end_UHAL_TIMER2_setModulePeriodValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setModulePeriodValue

UHAL_timer2_UHAL_TIMER2_setTimerValueValue:

;uhal_timer2.h,32 :: 		static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
;uhal_timer2.h,34 :: 		TMR2 = val;
	MOVF       FARG_UHAL_timer2_UHAL_TIMER2_setTimerValueValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,35 :: 		}
L_end_UHAL_TIMER2_setTimerValueValue:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setTimerValueValue

UHAL_timer2_UHAL_TIMER2_setTimeForMatchEvent:

;uhal_timer2.h,37 :: 		static inline UHAL_TIMER2_setTimeForMatchEvent()
;uhal_timer2.h,40 :: 		}
L_end_UHAL_TIMER2_setTimeForMatchEvent:
	RETURN
; end of UHAL_timer2_UHAL_TIMER2_setTimeForMatchEvent

_UHAL_timer2Init:

;UHAL_timer2.c,3 :: 		void UHAL_timer2Init()
;UHAL_timer2.c,5 :: 		UHAL_TIMER2_setPrescaler(UHAL_TIMER2_SET_PRESCALER_16);
	MOVLW      3
	MOVWF      FARG_UHAL_timer2_UHAL_TIMER2_setPrescaler_uhal_parm+0
	CALL       UHAL_timer2_UHAL_TIMER2_setPrescaler+0
;UHAL_timer2.c,6 :: 		U_TIMER2_COMPARE_REG = 1;
	MOVLW      1
	MOVWF      PR2+0
;UHAL_timer2.c,7 :: 		TMR2IF_bit = 0;
	BCF        TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
;UHAL_timer2.c,8 :: 		U_GLOBAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 7
;UHAL_timer2.c,9 :: 		U_PERIPHERAL_INTERRUPT_DISABLE();
	MOVLW      191
	ANDWF      INTCON+0, 1
;UHAL_timer2.c,10 :: 		U_TMR2_TO_PR2_MATCH_INTERRUPT_ENABLE();
	BSF        PIE1+0, 1
;UHAL_timer2.c,12 :: 		}
L_end_UHAL_timer2Init:
	RETURN
; end of _UHAL_timer2Init
