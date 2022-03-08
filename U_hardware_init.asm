
U_hardware_init_UHAL_TIMER2_setPrescaler:

;U_hardware_init.c,21 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;U_hardware_init.c,23 :: 		T2CON |= (uhal_parm << T2CKPS0);
	MOVF       FARG_U_hardware_init_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      T2CON+0, 1
;U_hardware_init.c,24 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of U_hardware_init_UHAL_TIMER2_setPrescaler

U_hardware_init_UHAL_TIMER2_setModulePeriodValue:

;U_hardware_init.c,26 :: 		static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
;U_hardware_init.c,28 :: 		PR2 = val;
	MOVF       FARG_U_hardware_init_UHAL_TIMER2_setModulePeriodValue_val+0, 0
	MOVWF      PR2+0
;U_hardware_init.c,29 :: 		}
L_end_UHAL_TIMER2_setModulePeriodValue:
	RETURN
; end of U_hardware_init_UHAL_TIMER2_setModulePeriodValue

U_hardware_init_UHAL_TIMER2_setTimerValueValue:

;U_hardware_init.c,30 :: 		static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
;U_hardware_init.c,32 :: 		TMR2 = val;
	MOVF       FARG_U_hardware_init_UHAL_TIMER2_setTimerValueValue_val+0, 0
	MOVWF      TMR2+0
;U_hardware_init.c,33 :: 		}
L_end_UHAL_TIMER2_setTimerValueValue:
	RETURN
; end of U_hardware_init_UHAL_TIMER2_setTimerValueValue

_InitTimer1:

;U_hardware_init.c,37 :: 		inline void InitTimer1()
;U_hardware_init.c,39 :: 		T1CON = 0x01U;
	MOVLW      1
	MOVWF      T1CON+0
;U_hardware_init.c,40 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;U_hardware_init.c,41 :: 		TMR1H = 0xFCU;
	MOVLW      252
	MOVWF      TMR1H+0
;U_hardware_init.c,42 :: 		TMR1L = 0x18U;
	MOVLW      24
	MOVWF      TMR1L+0
;U_hardware_init.c,43 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;U_hardware_init.c,44 :: 		INTCON = 0xC0U;
	MOVLW      192
	MOVWF      INTCON+0
;U_hardware_init.c,45 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_InitTimer2:

;U_hardware_init.c,47 :: 		inline void InitTimer2(){
;U_hardware_init.c,48 :: 		T2CON	 = 0x4D;
	MOVLW      77
	MOVWF      T2CON+0
;U_hardware_init.c,49 :: 		PR2		 = 250;
	MOVLW      250
	MOVWF      PR2+0
;U_hardware_init.c,50 :: 		TMR2IE_bit	 = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;U_hardware_init.c,51 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;U_hardware_init.c,52 :: 		}
L_end_InitTimer2:
	RETURN
; end of _InitTimer2

_InitExternalInterrupt:

;U_hardware_init.c,53 :: 		inline void InitExternalInterrupt()
;U_hardware_init.c,55 :: 		U_GLOBAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 7
;U_hardware_init.c,56 :: 		U_EXTERNAL_INTERRUPT_RISING();
	MOVLW      191
	ANDWF      OPTION_REG+0, 1
;U_hardware_init.c,57 :: 		U_EXTERNAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 4
;U_hardware_init.c,58 :: 		}
L_end_InitExternalInterrupt:
	RETURN
; end of _InitExternalInterrupt
