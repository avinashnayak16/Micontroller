#include <avr/io.h>
#include <util/delay.h>

// Define baud rate
#define BAUD 9600
#define BAUD_PRESCALE (((F_CPU / (BAUD * 16UL))) - 1)

// Function to initialize USART
void USART_Init() {
	// Set baud rate
	UBRRH = (uint8_t)(BAUD_PRESCALE >> 8);
	UBRRL = (uint8_t)(BAUD_PRESCALE);

	// Enable transmitter
	UCSRB |= (1 << TXEN);

	// Set frame format: 8 data, 1 stop bit, no parity
	UCSRC |= (1 << URSEL) | (1 << UCSZ1) | (1 << UCSZ0);
}

// Function to transmit data via USART
void USART_Transmit(unsigned char data) {
	// Wait for empty transmit buffer
	while (!(UCSRA & (1 << UDRE)));

	// Put data into buffer, sends the data
	UDR = data;
}

int main(void) {
	// Initialize USART
	USART_Init();

	// Main loop
	while (1) {
		// Transmit "Hello, world!" message
		USART_Transmit('H');
		USART_Transmit('e');
		USART_Transmit('l');
		USART_Transmit('l');
		USART_Transmit('o');
		USART_Transmit(',');
		USART_Transmit(' ');
		USART_Transmit('w');
		USART_Transmit('o');
		USART_Transmit('r');
		USART_Transmit('l');
		USART_Transmit('d');
		USART_Transmit('!');
		USART_Transmit('\n');
		
		// Add a delay between transmissions
		_delay_ms(1000);
	}

	return 0;
}


/*//program to trasmit the one character to 9600 baud rate and with no parity and one stop bit
#include <avr/io.h>


void usart_init(void)
{
	UCSRB=(1<<TXEN);
	UCSRC = (1<<UCSZ1)|(1<<UCSZ0)| (1<<URSEL);
	UBRRL=0X33;
}
void usart_send(unsigned int ch)
{
	while(!(UCSRA & (1<<UDRE)));
	UDR= ch;
	
}
int main(void)
{
	unsigned char str[30]="Serial communication success";
	unsigned char strlengh=28;
	unsigned char i=0;
	usart_init();

    while (1) 
	{
		usart_send(str[i++]);
		if(1>=strlengh)
		i=0;
	}
	return 0;
}
*/
/*//program to receive the one character to 9600 baud rate and with no parity and one stop bit
#include <avr/io.h>


void usart_init(void)
{
	UCSRB=(1<<RXEN);
	UCSRC = (1<<UCSZ1)|(1<<UCSZ0)| (1<<URSEL);
	UBRRL=0X33;
}
char usart_recieve()
{
	while(!(UCSRA & (1<<RXC)));
	return UDR;
	
}
int main(void)
{
	DDRB = 0xFF;
	usart_init();
	unsigned char str;
	while (1)
	{
		str=usart_recieve();
		PORTB=str;
	}
	return 0;
}
*//*
//program to receive the  and send one character to 9600 baud rate and with no parity and one stop bit
#include <avr/io.h>
#include <ctype.h>
#include <stdio.h>

void usart_init(void)
{
	UCSRB=(1<<RXEN) |(1<<TXEN);
	UCSRC = (1<<UCSZ1)|(1<<UCSZ0)| (1<<URSEL);
	UBRRL=0X33;
}
char usart_receive()
{
	while(!(UCSRA & (1<<RXC)));
	return UDR;
	
}
void usart_send(unsigned int ch)
{
	while(!(UCSRA & (1<<UDRE)));
	UDR= ch;	
}
int main(void)
{
	DDRB = 0xFF;
	usart_init();
	unsigned char str;
	while (1)
	{
		str=usart_receive();
		PORTB=str;
		if (islower(str)) {
			usart_send(toupper(str));
			} else if (isupper(str)) {
			usart_send(tolower(str));
			}
		
	}
	return 0;
}
*/