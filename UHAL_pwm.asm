
UHAL_pwm_UHAL_TIMER2_ON:

;uhal_pwm.h,20 :: 		static inline UHAL_TIMER2_ON()
;uhal_pwm.h,22 :: 		TMR2ON_bit = 1;
	BSF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;uhal_pwm.h,23 :: 		}
L_end_UHAL_TIMER2_ON:
	RETURN
; end of UHAL_pwm_UHAL_TIMER2_ON

UHAL_pwm_UHAL_TIMER2_OFF:

;uhal_pwm.h,24 :: 		static inline UHAL_TIMER2_OFF()
;uhal_pwm.h,26 :: 		TMR2ON_bit = 0;
	BCF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;uhal_pwm.h,27 :: 		}
L_end_UHAL_TIMER2_OFF:
	RETURN
; end of UHAL_pwm_UHAL_TIMER2_OFF

UHAL_pwm_UHAL_TIMER2_SET_PRESCALER:

;uhal_pwm.h,28 :: 		static inline UHAL_TIMER2_SET_PRESCALER(const uint8_t value)
;uhal_pwm.h,31 :: 		}
L_end_UHAL_TIMER2_SET_PRESCALER:
	RETURN
; end of UHAL_pwm_UHAL_TIMER2_SET_PRESCALER

UHAL_pwm_UHAL_TIMER2_periodRegister:

;uhal_pwm.h,32 :: 		static inline UHAL_TIMER2_periodRegister(const uint8_t value)
;uhal_pwm.h,35 :: 		}
L_end_UHAL_TIMER2_periodRegister:
	RETURN
; end of UHAL_pwm_UHAL_TIMER2_periodRegister

_UHAL_pwmInit:

;UHAL_pwm.c,4 :: 		void UHAL_pwmInit()
;UHAL_pwm.c,6 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;UHAL_pwm.c,7 :: 		}
L_end_UHAL_pwmInit:
	RETURN
; end of _UHAL_pwmInit

_UHAL_pwmSetFequence:

;UHAL_pwm.c,8 :: 		void UHAL_pwmSetFequence(uint8_t pin, const uint16_t fequ)
;UHAL_pwm.c,10 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;UHAL_pwm.c,11 :: 		}
L_end_UHAL_pwmSetFequence:
	RETURN
; end of _UHAL_pwmSetFequence

_UHAL_pwmStart:

;UHAL_pwm.c,12 :: 		void UHAL_pwmStart(const uint8_t pin)
;UHAL_pwm.c,14 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;UHAL_pwm.c,15 :: 		}
L_end_UHAL_pwmStart:
	RETURN
; end of _UHAL_pwmStart

_UHAL_pwmSetDutyCycle:

;UHAL_pwm.c,16 :: 		void UHAL_pwmSetDutyCycle(const uint8_t pin, const uint8_t dutyC)
;UHAL_pwm.c,18 :: 		PWM1_Set_Duty(dutyC);
	MOVF       FARG_UHAL_pwmSetDutyCycle_dutyC+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;UHAL_pwm.c,19 :: 		}
L_end_UHAL_pwmSetDutyCycle:
	RETURN
; end of _UHAL_pwmSetDutyCycle

_UHAL_pwmStop:

;UHAL_pwm.c,20 :: 		void UHAL_pwmStop(const uint8_t pin)
;UHAL_pwm.c,22 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;UHAL_pwm.c,23 :: 		}
L_end_UHAL_pwmStop:
	RETURN
; end of _UHAL_pwmStop

_UHAL_pwmDeInit:

;UHAL_pwm.c,24 :: 		void UHAL_pwmDeInit()
;UHAL_pwm.c,27 :: 		}
L_end_UHAL_pwmDeInit:
	RETURN
; end of _UHAL_pwmDeInit
