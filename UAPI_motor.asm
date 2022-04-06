
UAPI_motor_UHAL_TIMER2_setPrescaler:

;uhal_timer2.h,38 :: 		static inline void UHAL_TIMER2_setPrescaler(uint8_t uhal_parm)
;uhal_timer2.h,41 :: 		MODIFY_REG(T2CON, bitMask, uhal_parm << T2CKPS0);
	MOVLW      252
	ANDWF      T2CON+0, 0
	MOVWF      R0+0
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_setPrescaler_uhal_parm+0, 0
	IORWF      R0+0, 0
	MOVWF      T2CON+0
;uhal_timer2.h,42 :: 		}
L_end_UHAL_TIMER2_setPrescaler:
	RETURN
; end of UAPI_motor_UHAL_TIMER2_setPrescaler

UAPI_motor_UHAL_TIMER2_setPostscaler:

;uhal_timer2.h,44 :: 		static inline void UHAL_TIMER2_setPostscaler(uint8_t uhal_parm)
;uhal_timer2.h,46 :: 		MODIFY_REG(T2CON, 0b1111 << TOUTPS0, uhal_parm << TOUTPS0);
	MOVLW      135
	ANDWF      T2CON+0, 0
	MOVWF      R2+0
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_setPostscaler_uhal_parm+0, 0
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
; end of UAPI_motor_UHAL_TIMER2_setPostscaler

UAPI_motor_UHAL_TIMER2_updatePrValue:

;uhal_timer2.h,49 :: 		static inline void UHAL_TIMER2_updatePrValue(uint8_t val,UHAL_TIMER2_REGITER_T * buffer )
;uhal_timer2.h,51 :: 		*buffer =   val;
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_updatePrValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_updatePrValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,52 :: 		}
L_end_UHAL_TIMER2_updatePrValue:
	RETURN
; end of UAPI_motor_UHAL_TIMER2_updatePrValue

UAPI_motor_UHAL_TIMER2_updateTimerValue:

;uhal_timer2.h,53 :: 		static inline void UHAL_TIMER2_updateTimerValue(uint8_t val, UHAL_TIMER2_REGITER_T * buffer)
;uhal_timer2.h,55 :: 		*buffer =   val;
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_updateTimerValue_buffer+0, 0
	MOVWF      FSR
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_updateTimerValue_val+0, 0
	MOVWF      INDF+0
;uhal_timer2.h,56 :: 		}
L_end_UHAL_TIMER2_updateTimerValue:
	RETURN
; end of UAPI_motor_UHAL_TIMER2_updateTimerValue

UAPI_motor_UHAL_TIMER2_setPrValue:

;uhal_timer2.h,57 :: 		static inline void UHAL_TIMER2_setPrValue(uint8_t val)
;uhal_timer2.h,59 :: 		PR2 = val;
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_setPrValue_val+0, 0
	MOVWF      PR2+0
;uhal_timer2.h,60 :: 		}
L_end_UHAL_TIMER2_setPrValue:
	RETURN
; end of UAPI_motor_UHAL_TIMER2_setPrValue

UAPI_motor_UHAL_TIMER2_setTimerValue:

;uhal_timer2.h,61 :: 		static inline void UHAL_TIMER2_setTimerValue(uint8_t val)
;uhal_timer2.h,63 :: 		TMR2 = val;
	MOVF       FARG_UAPI_motor_UHAL_TIMER2_setTimerValue_val+0, 0
	MOVWF      TMR2+0
;uhal_timer2.h,64 :: 		}
L_end_UHAL_TIMER2_setTimerValue:
	RETURN
; end of UAPI_motor_UHAL_TIMER2_setTimerValue

_UAPI_MOTOR_init:

;UAPI_motor.c,3 :: 		void UAPI_MOTOR_init()
;UAPI_motor.c,6 :: 		UHAL_timer2Init();
	CALL       _UHAL_timer2Init+0
;UAPI_motor.c,7 :: 		InitExternalInterrupt();
	CALL       _InitExternalInterrupt+0
;UAPI_motor.c,8 :: 		UAPI_MOTOR_stop();
	CALL       _UAPI_MOTOR_stop+0
;UAPI_motor.c,9 :: 		}
L_end_UAPI_MOTOR_init:
	RETURN
; end of _UAPI_MOTOR_init

_UAPI_MOTOR_start:

;UAPI_motor.c,11 :: 		void UAPI_MOTOR_start()
;UAPI_motor.c,13 :: 		TRISA3_bit = 0;
	BCF        TRISA3_bit+0, BitPos(TRISA3_bit+0)
;UAPI_motor.c,14 :: 		}
L_end_UAPI_MOTOR_start:
	RETURN
; end of _UAPI_MOTOR_start

_UAPI_MOTOR_stop:

;UAPI_motor.c,15 :: 		void UAPI_MOTOR_stop()
;UAPI_motor.c,18 :: 		TRISA3_bit = 1;
	BSF        TRISA3_bit+0, BitPos(TRISA3_bit+0)
;UAPI_motor.c,20 :: 		}
L_end_UAPI_MOTOR_stop:
	RETURN
; end of _UAPI_MOTOR_stop

_UAPI_MOTOR_setSpeed:

;UAPI_motor.c,21 :: 		void UAPI_MOTOR_setSpeed(uint_fast8_t speed, UHAL_TIMER2_REGITER_T * buffer)
;UAPI_motor.c,23 :: 		speed = CONSTRAIN(speed, UAPI_MOTOR_MIN_SPEED, UAPI_MOTOR_MAX_SPEED);
	MOVLW      1
	SUBWF      FARG_UAPI_MOTOR_setSpeed_speed+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_UAPI_MOTOR_setSpeed0
	MOVLW      1
	MOVWF      ?FLOC___UAPI_MOTOR_setSpeedT9+0
	GOTO       L_UAPI_MOTOR_setSpeed1
L_UAPI_MOTOR_setSpeed0:
	MOVF       FARG_UAPI_MOTOR_setSpeed_speed+0, 0
	SUBLW      220
	BTFSC      STATUS+0, 0
	GOTO       L_UAPI_MOTOR_setSpeed2
	MOVLW      220
	MOVWF      ?FLOC___UAPI_MOTOR_setSpeedT11+0
	GOTO       L_UAPI_MOTOR_setSpeed3
L_UAPI_MOTOR_setSpeed2:
	MOVF       FARG_UAPI_MOTOR_setSpeed_speed+0, 0
	MOVWF      ?FLOC___UAPI_MOTOR_setSpeedT11+0
L_UAPI_MOTOR_setSpeed3:
	MOVF       ?FLOC___UAPI_MOTOR_setSpeedT11+0, 0
	MOVWF      ?FLOC___UAPI_MOTOR_setSpeedT9+0
L_UAPI_MOTOR_setSpeed1:
	MOVF       ?FLOC___UAPI_MOTOR_setSpeedT9+0, 0
	MOVWF      FARG_UAPI_MOTOR_setSpeed_speed+0
;UAPI_motor.c,24 :: 		UHAL_TIMER2_updatePrValue(speed,buffer);
	MOVF       ?FLOC___UAPI_MOTOR_setSpeedT9+0, 0
	MOVWF      FARG_UAPI_motor_UHAL_TIMER2_updatePrValue_val+0
	MOVF       FARG_UAPI_MOTOR_setSpeed_buffer+0, 0
	MOVWF      FARG_UAPI_motor_UHAL_TIMER2_updatePrValue_buffer+0
	CALL       UAPI_motor_UHAL_TIMER2_updatePrValue+0
;UAPI_motor.c,25 :: 		}
L_end_UAPI_MOTOR_setSpeed:
	RETURN
; end of _UAPI_MOTOR_setSpeed
