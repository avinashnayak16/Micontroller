//square wave 
/*#include <avr/io.h>

void Timer0_Delay();
int main(void)
{
    DDRB=0x20; //makes portb 5 as output	
	DDRA=0x20;
	while (1)
	{
		PORTB = PORTB^(1<<PB5); //toggle pb7
		Timer0_Delay();
		PORTA = PORTA^(1<<PB4); //toggle pb7
		Timer0_Delay();		
	}
}
void Timer0_Delay()
{
	TCNT0=0xf2;
	TCCR0=0x01;  //normal mode , no prescalar
	while ((TIFR & 0x01)==0); //keep monitoring TOV0 bit 
	TCCR0=0; // Stop th timer0 
	TIFR=0x01; //clear TOV0 flag
	
}*/
/*
//generate the 25Khz in c 
#include <avr/io.h>

void Timer0_Delay();
int main(void)
{
    DDRB=0x20; //makes port-b 5 as output   port b =0010 0000
	while (1)
	{
		PORTB = PORTB^(1<<PB5); //toggle pb7
		Timer0_Delay();	
	}
}
void Timer0_Delay()
{
	TCNT0=0x00;
	OCR0=0XC7;
	TCCR0=0x09;  //normal mode , no Pre-scalar
	while ((TIFR & 0x02)==0); //keep monitoring TOV0 bit 
	TCCR0=0; // Stop th timer0 
	TIFR=0x02; //clear TOV0 flag
	
}*/
//6 4 2 
/*#include <avr/io.h>

void Timer2_Delay1();
void Timer2_Delay2();
void Timer2_Delay3();
int main(void)
{
	DDRB=0x08; //makes port-b 5 as output   port b =0000 1000
	while (1)
	{
		PORTB = 0x08; //toggle pb7
		Timer2_Delay1();
		
		PORTB = 0x00; //toggle pb7
		Timer2_Delay2();
		
		PORTB = 0x08; //toggle pb7
		Timer2_Delay3();
	}
}
void Timer2_Delay1()
{
	TCNT0=0x00;
	OCR0=0XC7;
	TCCR0=0x09;  //normal mode , no Pre-scalar
	while ((TIFR & 0x02)==0); //keep monitoring TOV0 bit
	TCCR0=0; // Stop th timer0
	TIFR=0x02; //clear TOV0 flag
	
}
void Timer2_Delay2()
{
	TCNT0=0x00;
	OCR0=0XC7;
	TCCR0=0x09;  //normal mode , no Pre-scalar
	while ((TIFR & 0x02)==0); //keep monitoring TOV0 bit
	TCCR0=0; // Stop th timer0
	TIFR=0x02; //clear TOV0 flag
	
}
void Timer2_Delay3()
{
	TCNT0=0x00;
	OCR0=0XC7;
	TCCR0=0x09;  //normal mode , no Pre-scalar
	while ((TIFR & 0x02)==0); //keep monitoring TOV0 bit
	TCCR0=0; // Stop th timer0
	TIFR=0x02; //clear TOV0 flag
	
}*/

//Generate the wave for 1 sec 