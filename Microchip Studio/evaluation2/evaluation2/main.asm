.include "m32def.inc"
.macro initstack
	ldi r20 , high(ramend)
	out sph , r20
	ldi r20 , low(ramend)
	out spl , r20
.endmacro
	initstack
	sbi ddrb , 2
begin: rcall delay
	   cbi portb , 2
	   rcall delay
	   sbi portb, 2
	   rjmp begin
delay: ldi r20 , 0x00
	   out tcnt1h , r20
	   out tcnt1l , r20
	   ldi r20 , 0x06
	   out ocr1ah , r20
	   ldi r20 , 0x3f
	   out ocr1al , r20
	   ldi r20 , 0x00
	   out tccr1a , r20
	   ldi r20 , 0x09
	   out tccr1b , r20
again: in r20 ,tifr
	   sbrs r20 , ocf1a
	   rjmp again 
	   ldi r20 , 1<< ocf1a
	   out tifr , r20 
	   ldi r20 , 0x00
	   out tccr1b , r20
	   out tccr1a , r20
	   
	   ret



	   */
#include "avr/io.h"

int main ( )
{

	PORTB = 0x01;
	DDRC = 0xFF;

	TCCRO = 0x06;
	TCNTO = 0x00;

	while (1)
	{


		do
		{

			PORTC = TCNTO;
		}while((TIFR&(0x1 << TOV0)) == 0);//wait for TOV0 to roll over

		
			TIFR = 0x1 << TOVO;
	}

}

-