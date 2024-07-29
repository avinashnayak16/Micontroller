/*//program to toggle   
#include <avr/io.h>

void Timer1_Delay();
int main(void)
{
    DDRC=0x01; 
    while (1) 
    {
		PORTC = PORTC^(1<<PC1);  // TOGLLE PB5
		Timer1_Delay();
    }
	return 0;
}
void Timer1_Delay()
{
	TCNT1H=0x4E;
	TCNT1L=0x20;
	TCCR1A=0x00; // normal mode , no prescalar
	TCCR1B=0x01;  
	while((TIFR & 0x03)==0);
	TCCR1B=0;  // stop the timer1
	TIFR=0x03; // clear tov1 flag 
	
}
*/

/*#include "avr/io.h"
int a=0;
int main() {
	PORTB = 0X01;
	DDRC = 0XFF;
	DDRD = 0XFF;
	TCCR0 = 0X06;
	TCNT0 = 0X0;
	

	while(1) {
		// Clear overflow flag before entering the loop
		TIFR |= (1 << TOV1);
		
		do {
			PORTC = TCNT0; // Display low byte on PORTC
			
		} while ((TIFR & (1 << TOV0)) == 0); // Corrected condition using bitwise AND

		// Clearing the overflow flag after exiting the loop
		TIFR = (1 << TOV1);
		PORTD = ++a; // Display high byte on PORTD
	}
}*/

#include "avr/io.h"

int main() {
	PORTB = 0X01;
	DDRA = 0X20;
	TCCR1A=00;
	TCCR1B = 0X06;
	TCNT1 = 0X0;
	OCR1A = 199;
	

	while(1) {
		// Clear overflow flag before entering the loop
		TIFR |= (1 << TOV1);
		
		do {
			PORTA ^= 0x20; // Display low byte on PORTC
			
		} while ((TIFR & (1 << TOV1)) == 0); // Corrected condition using bitwise AND

		// Clearing the overflow flag after exiting the loop
		TIFR = (1 << TOV1);
	}
}