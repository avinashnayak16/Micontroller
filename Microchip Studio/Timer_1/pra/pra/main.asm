//Assume XTAL= 8MHz. Using Timer2 in CTC mode write an ALP to generate a waveform of 60% duty
//cycle on PC.1 with Ton=8ms. Assume any suitable prescalar. Simulate and show the output.

//64 prescalar

.INCLUDE "M32DEF.INC"
.MACRO  INITSTACK              ;SET UP STACK
        LDI  R20,HIGH(RAMEND)
		OUT  SPH,R20
		LDI  R20,LOW(RAMEND)
		OUT  SPL,R20
.ENDMACRO
        INITSTACK
		LDI R16,0X20
		SBI DDRB,5
		LDI R18,0XF5
BEGIN:  SBI PORTB,5
        OUT TCNT0,R18
		CALL DELAY
		OUT TCNT0,R18
		CALL DELAY
		CBI PORTB,5
		OUT TCNT0,R18
		CALL DELAY
		RJMP BEGIN


DELAY :LDI R20 ,0X04
	   OUT TCCR0 ,R20        ;TIMER0, NORMAL MODE ,INT CLK,NO PRESCALAR
 
AGAIN:IN R20 ,TIFR           ;READ TIFR
      SBRS R20 ,TOV0         ;IF TOVO IS SET SKIP NEXT INSTRUCTION
	  RJMP AGAIN
	  LDI R20 ,0X00
	  OUT TCCR0,R20          ;STOP TIMER0
	  LDI R20,(1<<TOV0)
	  OUT TIFR ,R20          ;CLEAR TOV0 FLAG BY WRITNG A 1 TO TIFR
	  RET