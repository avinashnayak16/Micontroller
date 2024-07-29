/*
#include <avr/io.h>

void Timer0_Delay()
{
	TCNT0=0xf2;
	TCCR0=0x01;
	while((TIFR & 0x01)==0);
	TCCR0=0;
	TIFR=0x01;
}
#include<avr/io.h>
int main(void)
{
	DDRB=0x20;
	while(1)
	{
		PORTB =PORTB^(1<<PB5);
		Timer0_Delay();
	}
}*/


.INCLUDE "m32def.inc"