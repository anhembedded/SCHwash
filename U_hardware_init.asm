
_InitTimer1:

;U_hardware_init.c,9 :: 		inline void InitTimer1()
;U_hardware_init.c,11 :: 		T1CON = 0x01U;
	MOVLW      1
	MOVWF      T1CON+0
;U_hardware_init.c,12 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;U_hardware_init.c,13 :: 		TMR1H = 0xFCU;
	MOVLW      252
	MOVWF      TMR1H+0
;U_hardware_init.c,14 :: 		TMR1L = 0x18U;
	MOVLW      24
	MOVWF      TMR1L+0
;U_hardware_init.c,15 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;U_hardware_init.c,16 :: 		INTCON = 0xC0U;
	MOVLW      192
	MOVWF      INTCON+0
;U_hardware_init.c,17 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_InitExternalInterrupt:

;U_hardware_init.c,19 :: 		inline void InitExternalInterrupt()
;U_hardware_init.c,21 :: 		U_GLOBAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 7
;U_hardware_init.c,22 :: 		U_EXTERNAL_INTERRUPT_FALLING();
	BSF        OPTION_REG+0, 6
;U_hardware_init.c,23 :: 		U_EXTERNAL_INTERRUPT_ENABLE();
	BSF        INTCON+0, 4
;U_hardware_init.c,24 :: 		}
L_end_InitExternalInterrupt:
	RETURN
; end of _InitExternalInterrupt

_U_gpioInit:

;U_hardware_init.c,26 :: 		inline void U_gpioInit()
;U_hardware_init.c,28 :: 		ANSEL = 0; // Configure AN pins as digital
	CLRF       ANSEL+0
;U_hardware_init.c,29 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;U_hardware_init.c,30 :: 		C1ON_bit = 0; // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;U_hardware_init.c,31 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;U_hardware_init.c,32 :: 		TRISC = 0x00U;
	CLRF       TRISC+0
;U_hardware_init.c,33 :: 		PORTC = 0x00U;
	CLRF       PORTC+0
;U_hardware_init.c,34 :: 		TRISB1_bit = 0;
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;U_hardware_init.c,35 :: 		}
L_end_U_gpioInit:
	RETURN
; end of _U_gpioInit
