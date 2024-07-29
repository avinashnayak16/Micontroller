#include "avr/io.h"
void time0_delay();
int main(void)
{
DDRB=0xFF;
while (1)
{
	time0_delay();
	PORTB=PORTB^0x20;
}
}

void time0_delay()
{
	TCNT0=0xF2;
	TCCR0=0x01;
	while((TIFR&0x01)==0);
	TCCR0=0;
	TIFR=0x01;
	
}