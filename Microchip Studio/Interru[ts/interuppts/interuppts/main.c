//GEnarate square wave on PB.5 using timer0 while at the same  time
//tranfer the data from portc to portd
/*#include <avr/io.h>
#include "avr/interrupt.h"

int main(void)
{
   DDRB|=0X20;  // SET PORTB.5
   TCNT0=-32;
   TCCR0=0X01;
   TIMSK=(1<<TOIE0);
   sei();
   DDRC=0X00;
   DDRD=0XFF;
    while (1) 
	PORTD=PORTC;
}
ISR(TIMER0_OVF_vect)
{
	TCNT0=-32;
	PORTB^=0X20;
}
*/
////genrate the square wave on pb.1 and  pb.7 using timer0 and timer 2
//
#include <avr/io.h>
#include <avr/interrupt.h>


int main(void)
{
	DDRB=0x81;   //pb0 and pb7
	TCNT0=00;   //set tcnt for delay
	OCR0=249;
	TCCR0=0x0a;  //sq of 2khz
	
	TCNT2=176;
	TCCR2=0x02;  //sq wave of 6hz
	
	TIMSK=(1<<OCIE0)|(1<<TOIE2);
	sei();
	while(1);
}

ISR(TIMER0_COMP_vect)
{
	PORTB^=0x01;
}

ISR(TIMER2_OVF_vect)
{
	TCNT2=176;
	PORTB^=0x80;
}
