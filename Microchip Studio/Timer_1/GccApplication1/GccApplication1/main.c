//Assuming that a 1hz clock pulse is fed into pin t0(PB0)
//write a program for counter0 in normal mode to count the pulses
//on falling edge and display the state of tcnt0 count on portc
#include <avr/io.h>

void Timer0_Delay();
int main(void)
{
    DDRB=0x0;
    while (1) 
    {
		PORTC=PORTC^(1<<PC5);
		Timer0_Delay();
    }
}
void Timer0_Delay()
{
	TCNT0=0XF2;
	TCCR0=0X01;
	while((TIFR & 0X01)==0);
	TCCR0=0;
	TIFR=0x01;
}