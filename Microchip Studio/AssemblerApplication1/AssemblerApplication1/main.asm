.include "m32def.inc"
.macro   initstack             ;set up stack
     ldi r20,high(ramend)
     out sph,r20
     ldi r20,low(ramend)
     out spl,r20
.endmacro

     ldi r16,0x08
     sbi ddrb,3
	 ldi r17,0

begin:out portb ,r17
	  rcall delay
	  eor r17,r16
	  rjmp begin

;---------------------------------time0 delay
delay:ldi r20,0 ;r20=0xf2
      out tcnt0,r20  ;load timer0
	  ldi r20,9
	  out ocr0,r20   ;timer0, normal mode,int clk,no prescalar
	  ldi r20,0x09
	  out tccr0,r20
again:in r20,tifr     ;read tifr
      sbrs r20,ocf0   ;if tov0 is set skip next instruction  if condition is true
	  rjmp again
	  ldi r20,00
	  out tccr0,r20  ;stop timer
	  ldi r20,(1<<ocf0)
	  out tifr,r20  ;clear  tovo flag by writing a 1 to tifr
	  ret