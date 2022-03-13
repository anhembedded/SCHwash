
schWash_Main_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,32 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,35 :: 		MODIFY_REG(T2CON, regMask, uhal_parm << T2CKPS0);
	MOVLW      252
	ANDWF      T2CON+0, 0
	MOVWF      R0+0
	MOVF       FARG_schWash_Main_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      R0+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,37 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setPrescaler

schWash_Main_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,39 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,41 :: 		MODIFY_REG(T2CON, 0b1111 << TOUTPS0, uhal_parm << TOUTPS0);
	MOVLW      135
	ANDWF      T2CON+0, 0
	MOVWF      R2+0
	MOVF       FARG_schWash_Main_UHAL_TIMER2_setPostscaler_uhal_parm+0, 0
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
;uhal_timer2.h,43 :: 		}
L_end_UHAL_TIMER2_setPostscaler:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setPostscaler

schWash_Main_UHAL_TIMER2_setModulePeriodValue:

;uhal_timer2.h,45 :: 		static inline void UHAL_TIMER2_setModulePeriodValue(uint8_t val)
;uhal_timer2.h,47 :: 		PR2 = val;
	MOVF       FARG_schWash_Main_UHAL_TIMER2_setModulePeriodValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,48 :: 		}
L_end_UHAL_TIMER2_setModulePeriodValue:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setModulePeriodValue

schWash_Main_UHAL_TIMER2_setTimerValueValue:

;uhal_timer2.h,49 :: 		static inline void UHAL_TIMER2_setTimerValueValue(uint8_t val)
;uhal_timer2.h,51 :: 		TMR2 = val;
	MOVF       FARG_schWash_Main_UHAL_TIMER2_setTimerValueValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,52 :: 		}
L_end_UHAL_TIMER2_setTimerValueValue:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setTimerValueValue

schWash_Main_UHAL_TIMER2_setTimeForMatchEvent:

;uhal_timer2.h,54 :: 		static inline UHAL_TIMER2_setTimeForMatchEvent()
;uhal_timer2.h,57 :: 		}
L_end_UHAL_TIMER2_setTimeForMatchEvent:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setTimeForMatchEvent

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
;schWash_Main.c,29 :: 		BIT_SET(U_PWM_PGx_ZERO_PORT, U_PWM_PIN);
	BSF        PORTB+0, 1
;schWash_Main.c,30 :: 		UHAL_TIMER2_ON();
	BSF        T2CON+0, 2
;schWash_Main.c,31 :: 		ledNum2 ++;
	INCF       schWash_Main_ledNum2+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_Main_ledNum2+1, 1
;schWash_Main.c,32 :: 		U_CLEAR_EXTERNAL_INTERRUPT();
	MOVLW      253
	ANDWF      INTCON+0, 1
;schWash_Main.c,33 :: 		}
L_Interrupt1:
;schWash_Main.c,34 :: 		if(UHAL_TIMER2_IS_SET_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG())
	MOVF       PIR1+0, 0
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
	GOTO       L_Interrupt2
;schWash_Main.c,36 :: 		BIT_CLEAR(U_PWM_PGx_ZERO_PORT, U_PWM_PIN);
	MOVLW      253
	ANDWF      PORTB+0, 1
;schWash_Main.c,37 :: 		ledNum1++;
	INCF       schWash_Main_ledNum1+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_Main_ledNum1+1, 1
;schWash_Main.c,38 :: 		UHAL_TIMER2_OFF();
	MOVLW      251
	ANDWF      T2CON+0, 1
;schWash_Main.c,39 :: 		UHAL_TIMER2_CLEAR_TMR2_TO_PR2_MATCH_INTERRUPT_FLAG();
	MOVLW      253
	ANDWF      PIR1+0, 1
;schWash_Main.c,40 :: 		}
L_Interrupt2:
;schWash_Main.c,41 :: 		}
L_end_Interrupt:
L__Interrupt11:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_InitTimer2:

;schWash_Main.c,42 :: 		void InitTimer2(){
;schWash_Main.c,44 :: 		UHAL_TIMER2_ON();
	BSF        T2CON+0, 2
;schWash_Main.c,45 :: 		UHAL_TIMER2_setPrescaler(UHAL_TIMER2_SET_PRESCALER_16);
	MOVLW      3
	MOVWF      FARG_schWash_Main_UHAL_TIMER2_setPrescaler_uhal_parm+0
	CALL       schWash_Main_UHAL_TIMER2_setPrescaler+0
;schWash_Main.c,46 :: 		UHAL_TIMER2_setPostscaler(UHAL_TIMER2_SET_POSTSCALER_2);
	MOVLW      1
	MOVWF      FARG_schWash_Main_UHAL_TIMER2_setPostscaler_uhal_parm+0
	CALL       schWash_Main_UHAL_TIMER2_setPostscaler+0
;schWash_Main.c,47 :: 		PR2                 = 254;
	MOVLW      254
	MOVWF      PR2+0
;schWash_Main.c,48 :: 		TMR2IE_bit         = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;schWash_Main.c,49 :: 		INTCON         = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;schWash_Main.c,51 :: 		}
L_end_InitTimer2:
	RETURN
; end of _InitTimer2

_main:

;schWash_Main.c,55 :: 		void main()
;schWash_Main.c,57 :: 		ANSEL = 0; // Configure AN pins as digital
	CLRF       ANSEL+0
;schWash_Main.c,58 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;schWash_Main.c,59 :: 		C1ON_bit = 0; // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;schWash_Main.c,60 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;schWash_Main.c,62 :: 		TRISC = 0x00U;
	CLRF       TRISC+0
;schWash_Main.c,63 :: 		PORTC = 0x00U;
	CLRF       PORTC+0
;schWash_Main.c,64 :: 		TRISB1_bit = 0;
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;schWash_Main.c,65 :: 		UHAL_timer2Init();
	CALL       _UHAL_timer2Init+0
;schWash_Main.c,67 :: 		InitTimer1();
	CALL       _InitTimer1+0
;schWash_Main.c,68 :: 		InitExternalInterrupt();
	CALL       _InitExternalInterrupt+0
;schWash_Main.c,69 :: 		while (1)
L_main3:
;schWash_Main.c,71 :: 		seg7Print(ledNum1, ledNum2);
	MOVF       schWash_Main_ledNum1+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       schWash_Main_ledNum1+1, 0
	MOVWF      FARG_seg7Print_num1+1
	MOVF       schWash_Main_ledNum2+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       schWash_Main_ledNum2+1, 0
	MOVWF      FARG_seg7Print_num2+1
	CALL       _seg7Print+0
;schWash_Main.c,72 :: 		}
	GOTO       L_main3
;schWash_Main.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

schWash_Main_ledDisplayHandler:

;schWash_Main.c,78 :: 		static void ledDisplayHandler()
;schWash_Main.c,80 :: 		seg7Print(ledNum1, ledNum2);
	MOVF       schWash_Main_ledNum1+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       schWash_Main_ledNum1+1, 0
	MOVWF      FARG_seg7Print_num1+1
	MOVF       schWash_Main_ledNum2+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       schWash_Main_ledNum2+1, 0
	MOVWF      FARG_seg7Print_num2+1
	CALL       _seg7Print+0
;schWash_Main.c,81 :: 		}
L_end_ledDisplayHandler:
	RETURN
; end of schWash_Main_ledDisplayHandler
