
schWash_main_UHAL_TIMER2_ON:

;uhal_pwm.h,20 :: 		static inline UHAL_TIMER2_ON()
;uhal_pwm.h,22 :: 		TMR2ON_bit = 1;
	BSF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;uhal_pwm.h,23 :: 		}
L_end_UHAL_TIMER2_ON:
	RETURN
; end of schWash_main_UHAL_TIMER2_ON

schWash_main_UHAL_TIMER2_OFF:

;uhal_pwm.h,24 :: 		static inline UHAL_TIMER2_OFF()
;uhal_pwm.h,26 :: 		TMR2ON_bit = 0;
	BCF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;uhal_pwm.h,27 :: 		}
L_end_UHAL_TIMER2_OFF:
	RETURN
; end of schWash_main_UHAL_TIMER2_OFF

schWash_main_UHAL_TIMER2_SET_PRESCALER:

;uhal_pwm.h,28 :: 		static inline UHAL_TIMER2_SET_PRESCALER(const uint8_t value)
;uhal_pwm.h,31 :: 		}
L_end_UHAL_TIMER2_SET_PRESCALER:
	RETURN
; end of schWash_main_UHAL_TIMER2_SET_PRESCALER

schWash_main_UHAL_TIMER2_periodRegister:

;uhal_pwm.h,32 :: 		static inline UHAL_TIMER2_periodRegister(const uint8_t value)
;uhal_pwm.h,35 :: 		}
L_end_UHAL_TIMER2_periodRegister:
	RETURN
; end of schWash_main_UHAL_TIMER2_periodRegister

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;schWash_main.c,16 :: 		void Interrupt()
;schWash_main.c,18 :: 		if (TMR1IF_bit)
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;schWash_main.c,20 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;schWash_main.c,21 :: 		TMR1H = 0xFCU;
	MOVLW      252
	MOVWF      TMR1H+0
;schWash_main.c,22 :: 		TMR1L = 0x18U;
	MOVLW      24
	MOVWF      TMR1L+0
;schWash_main.c,23 :: 		U_systemTick++;
	MOVF       schWash_main_u_systemTick+0, 0
	MOVWF      R0+0
	MOVF       schWash_main_u_systemTick+1, 0
	MOVWF      R0+1
	MOVF       schWash_main_u_systemTick+2, 0
	MOVWF      R0+2
	MOVF       schWash_main_u_systemTick+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      schWash_main_u_systemTick+0
	MOVF       R0+1, 0
	MOVWF      schWash_main_u_systemTick+1
	MOVF       R0+2, 0
	MOVWF      schWash_main_u_systemTick+2
	MOVF       R0+3, 0
	MOVWF      schWash_main_u_systemTick+3
;schWash_main.c,24 :: 		}
L_Interrupt0:
;schWash_main.c,25 :: 		}
L_end_Interrupt:
L__Interrupt13:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;schWash_main.c,29 :: 		void main()
;schWash_main.c,31 :: 		ANSEL = 0; // Configure AN pins as digital
	CLRF       ANSEL+0
;schWash_main.c,32 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;schWash_main.c,33 :: 		C1ON_bit = 0; // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;schWash_main.c,34 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;schWash_main.c,36 :: 		TRISC = 0x00U;
	CLRF       TRISC+0
;schWash_main.c,37 :: 		PORTC = 0x00U;
	CLRF       PORTC+0
;schWash_main.c,39 :: 		InitTimer1();
	CALL       _InitTimer1+0
;schWash_main.c,40 :: 		while (1)
L_main1:
;schWash_main.c,43 :: 		for (forMainIndex = 0; forMainIndex < 999; forMainIndex++)
	CLRF       schWash_main_forMainIndex+0
	CLRF       schWash_main_forMainIndex+1
L_main3:
	MOVLW      3
	SUBWF      schWash_main_forMainIndex+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      231
	SUBWF      schWash_main_forMainIndex+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;schWash_main.c,45 :: 		ledNum1++;
	INCF       schWash_main_ledNum1+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_main_ledNum1+1, 1
;schWash_main.c,46 :: 		ledNum2++;
	INCF       schWash_main_ledNum2+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_main_ledNum2+1, 1
;schWash_main.c,47 :: 		delayHandler(200, ledDisplayHandler);
	MOVLW      200
	MOVWF      FARG_schWash_main_delayHandler_time+0
	CLRF       FARG_schWash_main_delayHandler_time+1
	CLRF       FARG_schWash_main_delayHandler_time+2
	CLRF       FARG_schWash_main_delayHandler_time+3
	MOVLW      schWash_main_ledDisplayHandler+0
	MOVWF      FARG_schWash_main_delayHandler_HandleF+0
	MOVLW      hi_addr(schWash_main_ledDisplayHandler+0)
	MOVWF      FARG_schWash_main_delayHandler_HandleF+1
	MOVLW      0
	MOVWF      FARG_schWash_main_delayHandler_HandleF+2
	MOVLW      0
	CALL       schWash_main_delayHandler+0
;schWash_main.c,43 :: 		for (forMainIndex = 0; forMainIndex < 999; forMainIndex++)
	INCF       schWash_main_forMainIndex+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_main_forMainIndex+1, 1
;schWash_main.c,48 :: 		}
	GOTO       L_main3
L_main4:
;schWash_main.c,49 :: 		}
	GOTO       L_main1
;schWash_main.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

schWash_main_delayHandler:

;schWash_main.c,52 :: 		static void delayHandler(uint32_t time, void (*HandleF)(void))
;schWash_main.c,55 :: 		uint32_t totalDelay = now + time;
	MOVF       schWash_main_u_systemTick+0, 0
	MOVWF      schWash_main_delayHandler_totalDelay_L0+0
	MOVF       schWash_main_u_systemTick+1, 0
	MOVWF      schWash_main_delayHandler_totalDelay_L0+1
	MOVF       schWash_main_u_systemTick+2, 0
	MOVWF      schWash_main_delayHandler_totalDelay_L0+2
	MOVF       schWash_main_u_systemTick+3, 0
	MOVWF      schWash_main_delayHandler_totalDelay_L0+3
	MOVF       FARG_schWash_main_delayHandler_time+0, 0
	ADDWF      schWash_main_delayHandler_totalDelay_L0+0, 1
	MOVF       FARG_schWash_main_delayHandler_time+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_schWash_main_delayHandler_time+1, 0
	ADDWF      schWash_main_delayHandler_totalDelay_L0+1, 1
	MOVF       FARG_schWash_main_delayHandler_time+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_schWash_main_delayHandler_time+2, 0
	ADDWF      schWash_main_delayHandler_totalDelay_L0+2, 1
	MOVF       FARG_schWash_main_delayHandler_time+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_schWash_main_delayHandler_time+3, 0
	ADDWF      schWash_main_delayHandler_totalDelay_L0+3, 1
;schWash_main.c,56 :: 		while (u_systemTick < totalDelay)
L_schWash_main_delayHandler6:
	MOVF       schWash_main_delayHandler_totalDelay_L0+3, 0
	SUBWF      schWash_main_u_systemTick+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_schWash_main_delayHandler17
	MOVF       schWash_main_delayHandler_totalDelay_L0+2, 0
	SUBWF      schWash_main_u_systemTick+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L_schWash_main_delayHandler17
	MOVF       schWash_main_delayHandler_totalDelay_L0+1, 0
	SUBWF      schWash_main_u_systemTick+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_schWash_main_delayHandler17
	MOVF       schWash_main_delayHandler_totalDelay_L0+0, 0
	SUBWF      schWash_main_u_systemTick+0, 0
L_schWash_main_delayHandler17:
	BTFSC      STATUS+0, 0
	GOTO       L_schWash_main_delayHandler7
;schWash_main.c,58 :: 		HandleF();
	MOVF       FARG_schWash_main_delayHandler_HandleF+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_schWash_main_delayHandler_HandleF+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoIFC+0
;schWash_main.c,59 :: 		}
	GOTO       L_schWash_main_delayHandler6
L_schWash_main_delayHandler7:
;schWash_main.c,60 :: 		}
L_end_delayHandler:
	RETURN
; end of schWash_main_delayHandler

schWash_main_ledDisplayHandler:

;schWash_main.c,63 :: 		static void ledDisplayHandler()
;schWash_main.c,65 :: 		seg7Print(ledNum1, ledNum2);
	MOVF       schWash_main_ledNum1+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       schWash_main_ledNum1+1, 0
	MOVWF      FARG_seg7Print_num1+1
	MOVF       schWash_main_ledNum2+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       schWash_main_ledNum2+1, 0
	MOVWF      FARG_seg7Print_num2+1
	CALL       _seg7Print+0
;schWash_main.c,66 :: 		}
L_end_ledDisplayHandler:
	RETURN
; end of schWash_main_ledDisplayHandler
