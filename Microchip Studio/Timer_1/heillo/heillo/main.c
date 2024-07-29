//Assuming 1Hz signal fed to T0 , wap for 16 bit counter0 in normal mode to count the pulses o
//on falling edge and display count on Portc and PortD
/*#include <avr/io.h>


int main(void)
{
	unsigned char x=0;
	DDRB=0x00;
	DDRC=DDRD=0xFF;
	TCCR0= 0x06;  // external clock falling edge
	
	while (1)
	{
		PORTD = x;
		do
		{
			PORTC=TCNT0;
		} while ((TIFR & 0x01) == 0);
		TIFR=0x01;
		x++;
	}
	
}*/

//
//assuming that clock pulses are fed into pin T1(PB1)
//and Buzzer is connected to pin portc.o wap for counter
//mode to sound buzzer every 100 pulses
#include <avr/io.h>

void t1_delay();
int main(void)
{
	DDRB &= ~(1 << DDB1);  // Make PB1 (T1) input
	DDRC |= (1 << DDC0);    // PC0 as output
	
	DDRA = 0xFF;

	while (1)
	{
		PORTC ^= 0x01;
		t1_delay();
	}
	
}

void t1_delay()
{
	TCCR1A= 0x00;  // external clock falling edge
	TCCR1B=0X0E;
	OCR1AH=00;  //temp =0
	OCR1AL=99;
	do
	{
		PORTA==TCNT1L;
	} while ((TIFR & 0x10)==0);
	TIFR = 0x10;
}