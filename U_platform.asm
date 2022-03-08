
_delayHandler:

;U_platform.c,12 :: 		void delayHandler(uint32_t time, void (*HandleF)(void))
;U_platform.c,15 :: 		uint32_t totalDelay = now + time;
	MOVF       _U_systemTick+0, 0
	MOVWF      delayHandler_totalDelay_L0+0
	MOVF       _U_systemTick+1, 0
	MOVWF      delayHandler_totalDelay_L0+1
	MOVF       _U_systemTick+2, 0
	MOVWF      delayHandler_totalDelay_L0+2
	MOVF       _U_systemTick+3, 0
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
;U_platform.c,16 :: 		while (u_systemTick < totalDelay)
L_delayHandler0:
	MOVF       delayHandler_totalDelay_L0+3, 0
	SUBWF      _U_systemTick+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler3
	MOVF       delayHandler_totalDelay_L0+2, 0
	SUBWF      _U_systemTick+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler3
	MOVF       delayHandler_totalDelay_L0+1, 0
	SUBWF      _U_systemTick+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayHandler3
	MOVF       delayHandler_totalDelay_L0+0, 0
	SUBWF      _U_systemTick+0, 0
L__delayHandler3:
	BTFSC      STATUS+0, 0
	GOTO       L_delayHandler1
;U_platform.c,18 :: 		HandleF();
	MOVF       FARG_delayHandler_HandleF+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       FARG_delayHandler_HandleF+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoIFC+0
;U_platform.c,19 :: 		}
	GOTO       L_delayHandler0
L_delayHandler1:
;U_platform.c,20 :: 		}
L_end_delayHandler:
	RETURN
; end of _delayHandler
