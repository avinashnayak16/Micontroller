//Assuming 1Hz signal fed to T0 , wap for 16 bit counter0 in normal mode to count the pulses o
//on falling edge and display count on Portc and PortD
#include <avr/io.h>


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
		} while ((TIFR0 & 0x01) == 0);
		TIFR0=0x01;
		x++;
    }
	
}

