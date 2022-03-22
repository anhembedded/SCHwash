
schWash_Main_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,38 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,41 :: 		MODIFY_REG(T2CON, bitMask, uhal_parm << T2CKPS0);
	MOVLW      252
	ANDWF      T2CON+0, 0
	MOVWF      R0+0
	MOVF       FARG_schWash_Main_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      R0+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,42 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setPrescaler

schWash_Main_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,44 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,46 :: 		MODIFY_REG(T2CON, 0b1111 << TOUTPS0, uhal_parm << TOUTPS0);
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
;uhal_timer2.h,47 :: 		}
L_end_UHAL_TIMER2_setPostscaler:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setPostscaler

schWash_Main_UHAL_TIMER2_updatePrValue:

;uhal_timer2.h,49 :: 		static inline void UHAL_TIMER2_updatePrValue(uint8_t val,UHAL_TIMER2_REGITER_T * buffer )
;uhal_timer2.h,51 :: 		*buffer =   val;
	MOVF       FARG_schWash_Main_UHAL_TIMER2_updatePrValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_schWash_Main_UHAL_TIMER2_updatePrValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,52 :: 		}
L_end_UHAL_TIMER2_updatePrValue:
	RETURN
; end of schWash_Main_UHAL_TIMER2_updatePrValue

schWash_Main_UHAL_TIMER2_updateTimerValue:

;uhal_timer2.h,53 :: 		static inline void UHAL_TIMER2_updateTimerValue(uint8_t val, UHAL_TIMER2_REGITER_T * buffer)
;uhal_timer2.h,55 :: 		*buffer =   val;
	MOVF       FARG_schWash_Main_UHAL_TIMER2_updateTimerValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_schWash_Main_UHAL_TIMER2_updateTimerValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,56 :: 		}
L_end_UHAL_TIMER2_updateTimerValue:
	RETURN
; end of schWash_Main_UHAL_TIMER2_updateTimerValue

schWash_Main_UHAL_TIMER2_setPrValue:

;uhal_timer2.h,57 :: 		static inline void UHAL_TIMER2_setPrValue(uint8_t val)
;uhal_timer2.h,59 :: 		PR2 = val;
	MOVF       FARG_schWash_Main_UHAL_TIMER2_setPrValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,60 :: 		}
L_end_UHAL_TIMER2_setPrValue:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setPrValue

schWash_Main_UHAL_TIMER2_setTimerValue:

;uhal_timer2.h,61 :: 		static inline void UHAL_TIMER2_setTimerValue(uint8_t val)
;uhal_timer2.h,63 :: 		TMR2 = val;
	MOVF       FARG_schWash_Main_UHAL_TIMER2_setTimerValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,64 :: 		}
L_end_UHAL_TIMER2_setTimerValue:
	RETURN
; end of schWash_Main_UHAL_TIMER2_setTimerValue

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;schWash_Main.c,15 :: 		void Interrupt()
;schWash_Main.c,18 :: 		if (TMR1IF_bit)
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;schWash_Main.c,20 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;schWash_Main.c,21 :: 		TMR1H = 0xFCU;
	MOVLW      252
	MOVWF      TMR1H+0
;schWash_Main.c,22 :: 		TMR1L = 0x18U;
	MOVLW      24
	MOVWF      TMR1L+0
;schWash_Main.c,23 :: 		PF_systemTick++;
	MOVF       _PF_systemTick+0, 0
	MOVWF      R0+0
	MOVF       _PF_systemTick+1, 0
	MOVWF      R0+1
	MOVF       _PF_systemTick+2, 0
	MOVWF      R0+2
	MOVF       _PF_systemTick+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _PF_systemTick+0
	MOVF       R0+1, 0
	MOVWF      _PF_systemTick+1
	MOVF       R0+2, 0
	MOVWF      _PF_systemTick+2
	MOVF       R0+3, 0
	MOVWF      _PF_systemTick+3
;schWash_Main.c,24 :: 		}
L_Interrupt0:
;schWash_Main.c,26 :: 		if (U_IS_SET_EXTERNAL_INTERRUPT())
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
;schWash_Main.c,28 :: 		UAPI_PWM_ACTIVE();
	BSF        PORTB+0, 1
;schWash_Main.c,29 :: 		UHAL_TIMER2_ON();
	BSF        T2CON+0, 2
;schWash_Main.c,30 :: 		ledNum2++;
	INCF       schWash_Main_ledNum2+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_Main_ledNum2+1, 1
;schWash_Main.c,31 :: 		U_CLEAR_EXTERNAL_INTERRUPT();
	MOVLW      253
	ANDWF      INTCON+0, 1
;schWash_Main.c,32 :: 		}
L_Interrupt1:
;schWash_Main.c,33 :: 		if (UHAL_TIMER2_IS_ISR_FLAG_SET())
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
;schWash_Main.c,35 :: 		UAPI_PWM_DEACTIVE();
	MOVLW      253
	ANDWF      PORTB+0, 1
;schWash_Main.c,36 :: 		U_TIMER2_COMPARE_REG = timerPrBuffer;
	MOVF       schWash_Main_timerPrBuffer+0, 0
	MOVWF      PR2+0
;schWash_Main.c,37 :: 		ledNum1++;
	INCF       schWash_Main_ledNum1+0, 1
	BTFSC      STATUS+0, 2
	INCF       schWash_Main_ledNum1+1, 1
;schWash_Main.c,38 :: 		UHAL_TIMER2_OFF();
	MOVLW      251
	ANDWF      T2CON+0, 1
;schWash_Main.c,39 :: 		UHAL_TIMER2_CLEAR_ISR_FLAG();
	MOVLW      253
	ANDWF      PIR1+0, 1
;schWash_Main.c,40 :: 		}
L_Interrupt2:
;schWash_Main.c,41 :: 		}
L_end_Interrupt:
L__Interrupt14:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;schWash_Main.c,46 :: 		void main()
;schWash_Main.c,49 :: 		U_gpioInit();
	CALL       _U_gpioInit+0
;schWash_Main.c,51 :: 		InitTimer1();
	CALL       _InitTimer1+0
;schWash_Main.c,53 :: 		while (1)
L_main3:
;schWash_Main.c,55 :: 		motorSpeed++;
	INCF       schWash_Main_motorSpeed+0, 1
;schWash_Main.c,56 :: 		UAPI_MOTOR_setSpeed(motorSpeed, &timerPrBuffer);
	MOVF       schWash_Main_motorSpeed+0, 0
	MOVWF      FARG_UAPI_MOTOR_setSpeed_speed+0
	MOVLW      schWash_Main_timerPrBuffer+0
	MOVWF      FARG_UAPI_MOTOR_setSpeed_buffer+0
	CALL       _UAPI_MOTOR_setSpeed+0
;schWash_Main.c,58 :: 		}
	GOTO       L_main3
;schWash_Main.c,59 :: 		}
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

_delayHandler:

;schWash_Main.c,66 :: 		void delayHandler(uint32_t time, void (*HandleF)(void))
;schWash_Main.c,69 :: 		uint32_t totalDelay = now + time;
	MOVF       _PF_systemTick+0, 0
	MOVWF      delayHandler_totalDelay_L0+0
	MOVF       _PF_systemTick+1, 0
	MOVWF      delayHandler_totalDelay_L0+1
	MOVF       _PF_systemTick+2, 0
	MOVWF      delayHandler_totalDelay_L0+2
	MOVF       _PF_systemTick+3, 0
	MOVWF      delayHandler_totalDelay_L0+3
	MOVF       FARG_delayHandler_time+0, 0
	ADDWF      delayHandler_totalDelay_L0+0, 1
	MOVF       FARG_delayHandler_time+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_delayHandler_time+1, 0
	ADDWF      delayHandler_totalDelay_L0+1, 1
	MOVF       FARG_delayHandler_time+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_delayHandler_time+2, 0
	ADDWF      delayHandler_totalDelay_L0+2, 1
	MOVF       FARG_delayHandler_time+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_delayHandler_time+3, 0
	ADDWF      delayHandler_totalDelay_L0+3, 1
;schWash_Main.c,70 :: 		while (PF_systemTick < totalDelay)
L_delayHandler5:
	MOVF       delayHandler_totalDelay_L0+3, 0
	SUBWF      _PF_systemTick+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler18
	MOVF       delayHandler_totalDelay_L0+2, 0
	SUBWF      _PF_systemTick+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler18
	MOVF       delayHandler_totalDelay_L0+1, 0
	SUBWF      _PF_systemTick+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler18
	MOVF       delayHandler_totalDelay_L0+0, 0
	SUBWF      _PF_systemTick+0, 0
L__delayHandler18:
	BTFSC      STATUS+0, 0
	GOTO       L_delayHandler6
;schWash_Main.c,72 :: 		HandleF();
	MOVF       FARG_delayHandler_HandleF+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_delayHandler_HandleF+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoIFC+0
;schWash_Main.c,73 :: 		}
	GOTO       L_delayHandler5
L_delayHandler6:
;schWash_Main.c,74 :: 		}
L_end_delayHandler:
	RETURN
; end of _delayHandler

_buttonPolling:

;schWash_Main.c,75 :: 		void buttonPolling()
;schWash_Main.c,78 :: 		}
L_end_buttonPolling:
	RETURN
; end of _buttonPolling
