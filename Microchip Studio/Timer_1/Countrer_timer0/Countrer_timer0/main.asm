//Assuming that a 1hz clock pulse is fed into pin t0(PB0)
//write a program for counter0 in normal mode to count the pulses 
//on falling edge and display the state of tcnt0 count on portc

.INCLUDE "M32DEF.INC"
		CBI DDRB,0   ; MAKE T0 AS INPUT
		LDI R20 ,0XFF
		OUT DDRC , R20  ; MAKE PORT C AS OUTPUT
		LDI R20 , 0X06 
		OUT TCCR0 , R20   ; COUNTER FALLING EDGE  

AGAIN: IN R20 , TCNT0
	   OUT PORTC , R20  ; PORTC = TCNT0
	   IN R16, TIFR
	   SBRS R16, TOV0  ; MONITOR TOV0 FLAG
	   RJMP AGAIN   ; Keep doing if timer0 flag is 0 (low)
	   LDI R16 ,(1<<TOV0)
	   OUT TIFR, R16  ; clear tov0 flag by writing 1 into bit 0 of tifr 
	   RJMP AGAIN  ; keep doing it

