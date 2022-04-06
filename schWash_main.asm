
schWash_main_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,38 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,41 :: 		MODIFY_REG(T2CON, bitMask, uhal_parm << T2CKPS0);
	MOVLW      252
	ANDWF      T2CON+0, 0
	MOVWF      R0+0
	MOVF       FARG_schWash_main_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      R0+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,42 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of schWash_main_UHAL_TIMER2_setPrescaler

schWash_main_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,44 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,46 :: 		MODIFY_REG(T2CON, 0b1111 << TOUTPS0, uhal_parm << TOUTPS0);
	MOVLW      135
	ANDWF      T2CON+0, 0
	MOVWF      R2+0
	MOVF       FARG_schWash_main_UHAL_TIMER2_setPostscaler_uhal_parm+0, 0
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
; end of schWash_main_UHAL_TIMER2_setPostscaler

schWash_main_UHAL_TIMER2_updatePrValue:

;uhal_timer2.h,49 :: 		static inline void UHAL_TIMER2_updatePrValue(uint8_t val,UHAL_TIMER2_REGITER_T * buffer )
;uhal_timer2.h,51 :: 		*buffer =   val;
	MOVF       FARG_schWash_main_UHAL_TIMER2_updatePrValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_schWash_main_UHAL_TIMER2_updatePrValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,52 :: 		}
L_end_UHAL_TIMER2_updatePrValue:
	RETURN
; end of schWash_main_UHAL_TIMER2_updatePrValue

schWash_main_UHAL_TIMER2_updateTimerValue:

;uhal_timer2.h,53 :: 		static inline void UHAL_TIMER2_updateTimerValue(uint8_t val, UHAL_TIMER2_REGITER_T * buffer)
;uhal_timer2.h,55 :: 		*buffer =   val;
	MOVF       FARG_schWash_main_UHAL_TIMER2_updateTimerValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_schWash_main_UHAL_TIMER2_updateTimerValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,56 :: 		}
L_end_UHAL_TIMER2_updateTimerValue:
	RETURN
; end of schWash_main_UHAL_TIMER2_updateTimerValue

schWash_main_UHAL_TIMER2_setPrValue:

;uhal_timer2.h,57 :: 		static inline void UHAL_TIMER2_setPrValue(uint8_t val)
;uhal_timer2.h,59 :: 		PR2 = val;
	MOVF       FARG_schWash_main_UHAL_TIMER2_setPrValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,60 :: 		}
L_end_UHAL_TIMER2_setPrValue:
	RETURN
; end of schWash_main_UHAL_TIMER2_setPrValue

schWash_main_UHAL_TIMER2_setTimerValue:

;uhal_timer2.h,61 :: 		static inline void UHAL_TIMER2_setTimerValue(uint8_t val)
;uhal_timer2.h,63 :: 		TMR2 = val;
	MOVF       FARG_schWash_main_UHAL_TIMER2_setTimerValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,64 :: 		}
L_end_UHAL_TIMER2_setTimerValue:
	RETURN
; end of schWash_main_UHAL_TIMER2_setTimerValue

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;schWash_main.c,15 :: 		void Interrupt()
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
;schWash_main.c,23 :: 		PF_systemTick++;
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
;schWash_main.c,24 :: 		}
L_Interrupt0:
;schWash_main.c,26 :: 		if (U_IS_SET_EXTERNAL_INTERRUPT())
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
;schWash_main.c,28 :: 		CLEAR_BIT(U_VAN_PORT, U_VAN_PIN);
	MOVLW      247
	ANDWF      PORTA+0, 1
;schWash_main.c,29 :: 		UHAL_TIMER2_ON();
	BSF        T2CON+0, 2
;schWash_main.c,30 :: 		U_CLEAR_EXTERNAL_INTERRUPT();
	MOVLW      253
	ANDWF      INTCON+0, 1
;schWash_main.c,31 :: 		}
L_Interrupt1:
;schWash_main.c,32 :: 		if (UHAL_TIMER2_IS_ISR_FLAG_SET())
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
;schWash_main.c,34 :: 		SET_BIT(U_VAN_PORT, U_VAN_PIN);
	BSF        PORTA+0, 3
;schWash_main.c,35 :: 		U_TIMER2_COMPARE_REG = timerPrBuffer;
	MOVF       schWash_main_timerPrBuffer+0, 0
	MOVWF      PR2+0
;schWash_main.c,36 :: 		UHAL_TIMER2_OFF();
	MOVLW      251
	ANDWF      T2CON+0, 1
;schWash_main.c,37 :: 		UHAL_TIMER2_CLEAR_ISR_FLAG();
	MOVLW      253
	ANDWF      PIR1+0, 1
;schWash_main.c,38 :: 		}
L_Interrupt2:
;schWash_main.c,39 :: 		}
L_end_Interrupt:
L__Interrupt22:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;schWash_main.c,41 :: 		void main()
;schWash_main.c,44 :: 		U_gpioInit();
	CALL       _U_gpioInit+0
;schWash_main.c,45 :: 		UAPI_MOTOR_init();
	CALL       _UAPI_MOTOR_init+0
;schWash_main.c,46 :: 		InitTimer1();
	CALL       _InitTimer1+0
;schWash_main.c,47 :: 		UAPI_MOTOR_stop();
	CALL       _UAPI_MOTOR_stop+0
;schWash_main.c,48 :: 		while (1)
L_main3:
;schWash_main.c,50 :: 		if (UAPI_buttonHanlde() == UAPI_NUT1_IS_PRESSED)
	CALL       _UAPI_buttonHanlde+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;schWash_main.c,52 :: 		ledNum1 = 1;
	MOVLW      1
	MOVWF      schWash_main_ledNum1+0
	MOVLW      0
	MOVWF      schWash_main_ledNum1+1
;schWash_main.c,53 :: 		motorState = !motorState;
	MOVF       _motorState+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _motorState+0
;schWash_main.c,54 :: 		}
L_main5:
;schWash_main.c,55 :: 		if (UAPI_buttonHanlde() == UAPI_NUT2_IS_PRESSED)
	CALL       _UAPI_buttonHanlde+0
	MOVF       R0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;schWash_main.c,57 :: 		ledNum1 = 2;
	MOVLW      2
	MOVWF      schWash_main_ledNum1+0
	MOVLW      0
	MOVWF      schWash_main_ledNum1+1
;schWash_main.c,58 :: 		relayState = !relayState;
	MOVF       _relayState+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _relayState+0
;schWash_main.c,59 :: 		}
L_main6:
;schWash_main.c,60 :: 		if (UAPI_buttonHanlde() == UAPI_NUT3_IS_PRESSED)
	CALL       _UAPI_buttonHanlde+0
	MOVF       R0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;schWash_main.c,62 :: 		ledNum1 = 3;
	MOVLW      3
	MOVWF      schWash_main_ledNum1+0
	MOVLW      0
	MOVWF      schWash_main_ledNum1+1
;schWash_main.c,63 :: 		motorSpeed = motorSpeed + 10;
	MOVLW      10
	ADDWF      _motorSpeed+0, 1
;schWash_main.c,64 :: 		}
L_main7:
;schWash_main.c,65 :: 		if (UAPI_buttonHanlde() == UAPI_NUT4_IS_PRESSED)
	CALL       _UAPI_buttonHanlde+0
	MOVF       R0+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;schWash_main.c,67 :: 		ledNum1 = 4;
	MOVLW      4
	MOVWF      schWash_main_ledNum1+0
	MOVLW      0
	MOVWF      schWash_main_ledNum1+1
;schWash_main.c,68 :: 		motorSpeed = motorSpeed - 10;
	MOVLW      10
	SUBWF      _motorSpeed+0, 1
;schWash_main.c,69 :: 		}
L_main8:
;schWash_main.c,71 :: 		if (motorState)
	MOVF       _motorState+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;schWash_main.c,73 :: 		UAPI_MOTOR_start();
	CALL       _UAPI_MOTOR_start+0
;schWash_main.c,74 :: 		}
	GOTO       L_main10
L_main9:
;schWash_main.c,77 :: 		UAPI_MOTOR_stop();
	CALL       _UAPI_MOTOR_stop+0
;schWash_main.c,78 :: 		}
L_main10:
;schWash_main.c,80 :: 		if (relayState)
	MOVF       _relayState+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;schWash_main.c,82 :: 		SET_BIT(U_RELAY_MCLR_PORT, U_RELAY_PIN);
	BSF        PORTE+0, 0
;schWash_main.c,83 :: 		}
	GOTO       L_main12
L_main11:
;schWash_main.c,86 :: 		CLEAR_BIT(U_RELAY_MCLR_PORT, U_RELAY_PIN);
	MOVLW      254
	ANDWF      PORTE+0, 1
;schWash_main.c,87 :: 		}
L_main12:
;schWash_main.c,89 :: 		UAPI_MOTOR_setSpeed(motorSpeed, &timerPrBuffer);
	MOVF       _motorSpeed+0, 0
	MOVWF      FARG_UAPI_MOTOR_setSpeed_speed+0
	MOVLW      schWash_main_timerPrBuffer+0
	MOVWF      FARG_UAPI_MOTOR_setSpeed_buffer+0
	CALL       _UAPI_MOTOR_setSpeed+0
;schWash_main.c,90 :: 		ledNum2 = motorSpeed;
	MOVF       _motorSpeed+0, 0
	MOVWF      schWash_main_ledNum2+0
	CLRF       schWash_main_ledNum2+1
;schWash_main.c,91 :: 		seg7Print(ledNum1, ledNum2);
	MOVF       schWash_main_ledNum1+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       schWash_main_ledNum1+1, 0
	MOVWF      FARG_seg7Print_num1+1
	MOVF       schWash_main_ledNum2+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       schWash_main_ledNum2+1, 0
	MOVWF      FARG_seg7Print_num2+1
	CALL       _seg7Print+0
;schWash_main.c,92 :: 		}
	GOTO       L_main3
;schWash_main.c,93 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_ledDisplayHandler:

;schWash_main.c,95 :: 		void ledDisplayHandler()
;schWash_main.c,97 :: 		seg7Print(ledNum1, ledNum2);
	MOVF       schWash_main_ledNum1+0, 0
	MOVWF      FARG_seg7Print_num1+0
	MOVF       schWash_main_ledNum1+1, 0
	MOVWF      FARG_seg7Print_num1+1
	MOVF       schWash_main_ledNum2+0, 0
	MOVWF      FARG_seg7Print_num2+0
	MOVF       schWash_main_ledNum2+1, 0
	MOVWF      FARG_seg7Print_num2+1
	CALL       _seg7Print+0
;schWash_main.c,98 :: 		}
L_end_ledDisplayHandler:
	RETURN
; end of _ledDisplayHandler

_delayHandler:

;schWash_main.c,100 :: 		void delayHandler(uint32_t time, void (*HandleF)(void))
;schWash_main.c,104 :: 		uint32_t totalDelay = now + time;
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
;schWash_main.c,105 :: 		while (PF_systemTick < totalDelay)
L_delayHandler13:
	MOVF       delayHandler_totalDelay_L0+3, 0
	SUBWF      _PF_systemTick+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler26
	MOVF       delayHandler_totalDelay_L0+2, 0
	SUBWF      _PF_systemTick+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler26
	MOVF       delayHandler_totalDelay_L0+1, 0
	SUBWF      _PF_systemTick+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler26
	MOVF       delayHandler_totalDelay_L0+0, 0
	SUBWF      _PF_systemTick+0, 0
L__delayHandler26:
	BTFSC      STATUS+0, 0
	GOTO       L_delayHandler14
;schWash_main.c,107 :: 		HandleF();
	MOVF       FARG_delayHandler_HandleF+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_delayHandler_HandleF+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoIFC+0
;schWash_main.c,108 :: 		}
	GOTO       L_delayHandler13
L_delayHandler14:
;schWash_main.c,109 :: 		}
L_end_delayHandler:
	RETURN
; end of _delayHandler
