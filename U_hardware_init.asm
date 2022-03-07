
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
