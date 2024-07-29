
#include <avr/io.h>

void dealy_timer0();
int main(void)
{
	DDRB =0X40;;
	TCNT0=0X00;
	OCR0=199;
	TCCR0=0X0D;
	/* Replace with your application code */
	while (1)
	{
		dealy_timer0();
		PORTB=PORTB^(1<<PB6);
	}
}
void dealy_timer0()
{
	while((TIFR && 1<<OCF0)==0);
	TCCR0=0;
	TIFR=1<<OCF0;
}

