
.include "m32def.inc"
.macro initstack
	ldi r20 , high(ramend)
	out sph , r20
	ldi r20 , low(ramend)
	out spl , r20
.endmacro

initstack
	ldi r16 , 1<<1 //r16 =0010 0000 for pb5
	sbi ddrc ,1 //pb5 as output pin
begin: cbi portc ,1
	   rcall delay // call delay function once for toff
	   sbi portc , 1 
	   rcall delay // call delay function once for ton
	   rjmp begin 
//-----------------------------timer1 Delay function ------
delay : ldi r20, 0x00
		out tcnt1h ,r20
		out tcnt1l ,r20  ; load tcnt1= 0xd8f0 for dealy for 1.25ms
		ldi r20 , 0x00
		out tccr1a , r20
		ldi r20 , 0x05
		out tccr1b , r20
again : in r20 , tifr   ; read tifr
		sbrs r20 , tov1 ; if tov1 is set skip next instruction 
		rjmp again
		ldi r20 , 1<<tov1
		out tccr1b , r20  ; stop timer 1
		 
		ldi r19,0  ; also used as 0x04
		out tccr1b , r19	;clear tov1 flag by writing a 1 to tov1 bit in tifr 	
		out tccr1a , r19
		ret