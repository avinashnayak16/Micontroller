//Assuming that a 1hz clock pulse is fed into pin t0(PB0)
//write a program for counter0 in normal mode to count the pulses 
//on falling edge and display the state of tcnt0 count on portc

//timer 1

.INCLUDE "M32DEF.INC"
		CBI DDRB,1   ; MAKE T1 (PB1)AS INPUT 
		LDI R20 ,0XFF
		OUT DDRC , R20  ; MAKE PORT C AS OUTPUT
		OUT DDRD , R20  ; MAKE PORT C AS OUTPUT
		LDI R20 , 0X00
		OUT TCCR1A , R20 
		LDI R20 , 0X06 
		OUT TCCR1B , R20   ; COUNTER FALLING EDGE  

AGAIN: IN R20 , TCNT1L   ; R20 = TCNT1L , TEMP = TCNT1H
	   OUT PORTC , R20  ; PORTC = TCNT1L
	   IN R20 , TCNT1H  ; R20= TEMP
	   OUT PORTC , R20  ; PORTD = TCNT1H
	   IN R16, TIFR
	   SBRS R16, TOV0  ; MONITOR TOV0 FLAG
	   RJMP AGAIN   ; Keep doing if timer0 flag is 0 (low)
	   LDI R16 ,(1<<TOV0)
	   OUT TIFR, R16  ; clear tov0 flag by writing 1 into bit 0 of tifr 
	   RJMP AGAIN  ; keep doing it

