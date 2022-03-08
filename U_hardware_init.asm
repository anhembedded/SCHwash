
_InitTimer1:

;U_hardware_init.c,7 :: 		inline void InitTimer1()
;U_hardware_init.c,9 :: 		T1CON = 0x01U;
	MOVLW      1
	MOVWF      T1CON+0
;U_hardware_init.c,10 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;U_hardware_init.c,11 :: 		TMR1H = 0xFCU;
	MOVLW      252
	MOVWF      TMR1H+0
;U_hardware_init.c,12 :: 		TMR1L = 0x18U;
	MOVLW      24
	MOVWF      TMR1L+0
;U_hardware_init.c,13 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;U_hardware_init.c,14 :: 		INTCON = 0xC0U;
	MOVLW      192
	MOVWF      INTCON+0
;U_hardware_init.c,15 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_InitExternalInterrupt:

;U_hardware_init.c,17 :: 		inline void InitExternalInterrupt()
;U_hardware_init.c,19 :: 		U_GLOBAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 7
;U_hardware_init.c,20 :: 		U_EXTERNAL_INTERRUPT_RISING();
	MOVLW      191
	ANDWF      OPTION_REG+0, 1
;U_hardware_init.c,21 :: 		U_EXTERNAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 4
;U_hardware_init.c,22 :: 		}
L_end_InitExternalInterrupt:
	RETURN
; end of _InitExternalInterrupt
