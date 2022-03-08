
schWash_Main_UHAL_TIMER2_ON:

;uhal_pwm.h,20 :: 		static inline UHAL_TIMER2_ON()
;uhal_pwm.h,22 :: 		TMR2ON_bit = 1;
	BSF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;uhal_pwm.h,23 :: 		}
L_end_UHAL_TIMER2_ON:
	RETURN
; end of schWash_Main_UHAL_TIMER2_ON

schWash_Main_UHAL_TIMER2_OFF:

;uhal_pwm.h,24 :: 		static inline UHAL_TIMER2_OFF()
;uhal_pwm.h,26 :: 		TMR2ON_bit = 0;
	BCF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;uhal_pwm.h,27 :: 		}
L_end_UHAL_TIMER2_OFF:
	RETURN
; end of schWash_Main_UHAL_TIMER2_OFF

schWash_Main_UHAL_TIMER2_SET_PRESCALER:

;uhal_pwm.h,28 :: 		static inline UHAL_TIMER2_SET_PRESCALER(const uint8_t value)
;uhal_pwm.h,31 :: 		}
L_end_UHAL_TIMER2_SET_PRESCALER:
	RETURN
; end of schWash_Main_UHAL_TIMER2_SET_PRESCALER

schWash_Main_UHAL_TIMER2_periodRegister:

;uhal_pwm.h,32 :: 		static inline UHAL_TIMER2_periodRegister(const uint8_t value)
;uhal_pwm.h,35 :: 		}
L_end_UHAL_TIMER2_periodRegister:
	RETURN
; end of schWash_Main_UHAL_TIMER2_periodRegister

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;schWash_Main.c,16 :: 		void Interrupt()
;schWash_Main.c,19 :: 		if (TMR1IF_bit)
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;schWash_Main.c,21 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;schWash_Main.c,22 :: 		TMR1H = 0xFCU;
	MOVLW      252
	MOVWF      TMR1H+0
;schWash_Main.c,23 :: 		TMR1L = 0x18U;
	MOVLW      24
	MOVWF      TMR1L+0
;schWash_Main.c,24 :: 		U_systemTick++;
	MOVF       schWash_Main_u_systemTick+0, 0
	MOVWF      R0+0
	MOVF       schWash_Main_u_systemTick+1, 0
	MOVWF      R0+1
	MOVF       schWash_Main_u_systemTick+2, 0
	MOVWF      R0+2
	MOVF       schWash_Main_u_systemTick+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      schWash_Main_u_systemTick+0
	MOVF       R0+1, 0
	MOVWF      schWash_Main_u_systemTick+1
	MOVF       R0+2, 0
	MOVWF      schWash_Main_u_systemTick+2
	MOVF       R0+3, 0
	MOVWF      schWash_Main_u_systemTick+3
;schWash_Main.c,25 :: 		}
L_Interrupt0:
;schWash_Main.c,27 :: 		if(U_IS_SET_EXTERNAL_INTERRUPT())
	MOVF       INTCON+0, 0
	ANDLW      2
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	MOVLW      0
	ANDWF      R0+1, 1
	ANDWF      R0+2, 1
	ANDWF      R0+3, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	IORWF      R0+2, 0
	IORWF      R0+3, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt1
;schWash_Main.c,29 :: 		ledNum1++;
	INCF       schWash_Main_ledNum1+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_Main_ledNum1+1, 1
;schWash_Main.c,32 :: 		U_CLEAR_EXTERNAL_INTERRUPT();
	MOVLW      253
	ANDWF      INTCON+0, 1
;schWash_Main.c,34 :: 		}
L_Interrupt1:
;schWash_Main.c,35 :: 		}
L_end_Interrupt:
L__Interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;schWash_Main.c,40 :: 		void main()
;schWash_Main.c,42 :: 		ANSEL = 0; // Configure AN pins as digital
	CLRF       ANSEL+0
;schWash_Main.c,43 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;schWash_Main.c,44 :: 		C1ON_bit = 0; // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;schWash_Main.c,45 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;schWash_Main.c,47 :: 		TRISC = 0x00U;
	CLRF       TRISC+0
;schWash_Main.c,48 :: 		PORTC = 0x00U;
	CLRF       PORTC+0
;schWash_Main.c,50 :: 		InitTimer1();
	CALL       _InitTimer1+0
;schWash_Main.c,51 :: 		InitExternalInterrupt();
	CALL       _InitExternalInterrupt+0
;schWash_Main.c,52 :: 		while (1)
L_main2:
;schWash_Main.c,54 :: 		seg7Print(ledNum1, ledNum2);
	MOVF       schWash_Main_ledNum1+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       schWash_Main_ledNum1+1, 0
	MOVWF      FARG_seg7Print_num1+1
	MOVF       schWash_Main_ledNum2+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       schWash_Main_ledNum2+1, 0
	MOVWF      FARG_seg7Print_num2+1
	CALL       _seg7Print+0
;schWash_Main.c,55 :: 		}
	GOTO       L_main2
;schWash_Main.c,56 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

schWash_Main_ledDisplayHandler:

;schWash_Main.c,61 :: 		static void ledDisplayHandler()
;schWash_Main.c,63 :: 		seg7Print(ledNum1, ledNum2);
	MOVF       schWash_Main_ledNum1+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       schWash_Main_ledNum1+1, 0
	MOVWF      FARG_seg7Print_num1+1
	MOVF       schWash_Main_ledNum2+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       schWash_Main_ledNum2+1, 0
	MOVWF      FARG_seg7Print_num2+1
	CALL       _seg7Print+0
;schWash_Main.c,64 :: 		}
L_end_ledDisplayHandler:
	RETURN
; end of schWash_Main_ledDisplayHandler
