.INCLUDE "M32DEF.INC" 
	LDI R16 , 0x08 ; R16 = 0X08 (000 1000 FOR PB5)
	SBI DDRB , 3 ; PB5 AS AN OUTPUT
	CBI PORTB , 3
	LDI R20 , 89 
	OUT OCR0 , R20 ; OCR0 = 89 
	LDI R20 , 89 
	OUT OCR0 , R20 ; TCNT0= 95
	
BEGIN:  LDI R20 , 0X09
		OUT TCCR0 , R20 ;TIMER 0 , CTC MODE PRESCALAR NO
//----TIMER0 DELAY

AGAIN : IN R20 , TIFR ;READ TIFR
		SBRS R20 , OCF0 ; IF OCF0 IS SET SKIP NEXT INSTRUCTION
		RJMP AGAIN
		LDI R20 , 0X00
		OUT TCCR0, R20 ; STOP TIMER0
		LDI R20 , (1<<OCF0)
		OUT TIFR , R20 ; CLEAR OCF0 FLAG 
		EOR R17 , R16 
		OUT PORTB , R17 
		RJMP BEGIN